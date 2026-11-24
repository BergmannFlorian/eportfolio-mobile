import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:material_ui/material_ui.dart';

import '../../core/api/api_exception.dart';
import '../../data/cached_resource.dart';
import '../../l10n/generated/app_localizations.dart';
import '../theme/app_theme.dart';
import 'common.dart';

/// Localized message for a loading error.
String errorMessage(AppLocalizations l10n, Object? error) => switch (error) {
  NetworkException() => l10n.errorNetwork,
  HttpStatusException(status: 404) => l10n.errorNotFound,
  HttpStatusException(isServerError: true) => l10n.errorServer,
  InvalidResponseException() => l10n.errorInvalid,
  _ => l10n.errorServer,
};

/// Shows a screen built from one or more API resources:
/// - skeleton while nothing is loaded,
/// - full-screen error with retry when loading failed and nothing is cached,
/// - content with pull-to-refresh, and an offline banner when serving the
///   cache after a failed refresh.
class ResourceView extends StatelessWidget {
  const ResourceView({
    super.key,
    required this.values,
    required this.onRefresh,
    required this.builder,
    this.pullToRefresh = true,
  });

  final List<AsyncValue<Cached<Object?>>> values;
  final Future<void> Function() onRefresh;

  /// Wraps the content in a [RefreshIndicator]. Disable it when the content
  /// is not a single vertical scrollable (e.g. pages) and add your own.
  final bool pullToRefresh;

  /// Builds the scrollable content. Only called once every value is loaded.
  /// The scrollable must use [AlwaysScrollableScrollPhysics] for
  /// pull-to-refresh to work on short pages.
  final WidgetBuilder builder;

  @override
  Widget build(BuildContext context) {
    // The header above already handles the status bar inset; without this,
    // list views would add it a second time.
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: Builder(builder: _buildContent),
    );
  }

  Widget _buildContent(BuildContext context) {
    if (values.every((v) => v.hasValue)) {
      final offline = values
          .map((v) => v.value!)
          .where((v) => v.isOffline)
          .toList();
      return Column(
        children: [
          if (offline.isNotEmpty)
            OfflineBanner(
              since: offline
                  .map((v) => v.fetchedAt)
                  .reduce((a, b) => a.isBefore(b) ? a : b),
              onRetry: onRefresh,
            ),
          Expanded(
            child: pullToRefresh
                ? PullToRefresh(onRefresh: onRefresh, child: builder(context))
                : builder(context),
          ),
        ],
      );
    }
    final failed = values.where((v) => v.hasError && !v.hasValue);
    if (failed.isNotEmpty && !values.any((v) => v.isLoading && !v.hasError)) {
      return ErrorView(error: failed.first.error, onRetry: onRefresh);
    }
    return const LoadingSkeleton();
  }
}

/// [RefreshIndicator] in the app colors.
class PullToRefresh extends StatelessWidget {
  const PullToRefresh({super.key, required this.onRefresh, required this.child});

  final Future<void> Function() onRefresh;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return RefreshIndicator(
      onRefresh: onRefresh,
      color: c.accent,
      backgroundColor: c.surface,
      child: child,
    );
  }
}

/// Inverse strip shown when the content comes from the cache.
class OfflineBanner extends StatefulWidget {
  const OfflineBanner({super.key, required this.since, required this.onRetry});

  final DateTime since;
  final Future<void> Function() onRetry;

  @override
  State<OfflineBanner> createState() => _OfflineBannerState();
}

class _OfflineBannerState extends State<OfflineBanner> {
  bool _busy = false;

  Future<void> _retry() async {
    setState(() => _busy = true);
    try {
      await widget.onRetry();
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final l10n = AppLocalizations.of(context);
    final local = widget.since.toLocal();
    final text = l10n.offlineBanner(
      DateFormat('dd.MM').format(local),
      DateFormat('HH:mm').format(local),
    );
    return Semantics(
      liveRegion: true,
      child: Container(
        color: c.inverse,
        padding: const EdgeInsets.fromLTRB(20, 6, 12, 6),
        child: Row(
          children: [
            Container(width: 7, height: 7, color: c.accent),
            const SizedBox(width: 10),
            Expanded(
              child: Text(text, style: AppText.mono(c.inverseFg)),
            ),
            Pressable(
              onTap: _busy ? null : _retry,
              builder: (context, pressed) => Container(
                constraints: const BoxConstraints(minHeight: 36),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(color: c.inverseSubtle),
                ),
                child: Text(
                  _busy ? '…' : l10n.retry,
                  style: AppText.mono(
                    pressed ? c.inverseSubtle : c.inverseFg,
                    size: 11,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Full-screen error when there is nothing cached to show.
class ErrorView extends StatefulWidget {
  const ErrorView({super.key, required this.error, required this.onRetry});

  final Object? error;
  final Future<void> Function() onRetry;

  @override
  State<ErrorView> createState() => _ErrorViewState();
}

class _ErrorViewState extends State<ErrorView> {
  bool _busy = false;

  Future<void> _retry() async {
    setState(() => _busy = true);
    try {
      await widget.onRetry();
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final l10n = AppLocalizations.of(context);
    return Semantics(
      liveRegion: true,
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const SizedBox(height: 48),
          Kicker(l10n.errorKicker),
          const SizedBox(height: 14),
          TwoLineTitle(l10n.errorTitleLine1, l10n.errorTitleLine2),
          const SizedBox(height: 18),
          Text(
            errorMessage(l10n, widget.error),
            style: AppText.body(c.fgMuted),
          ),
          const SizedBox(height: 24),
          AppButton(
            label: _busy ? l10n.loading : l10n.retry,
            onPressed: _busy ? null : _retry,
          ),
        ],
      ),
    );
  }
}

/// Bordered placeholder blocks shown during the first load.
class LoadingSkeleton extends StatelessWidget {
  const LoadingSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final block = Color.alphaBlend(c.border.withValues(alpha: 0.6), c.bg);
    Widget bar(double width, double height) =>
        Container(width: width, height: height, color: block);
    return Semantics(
      label: AppLocalizations.of(context).loading,
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(20, 32, 20, 20),
        children: [
          Align(alignment: Alignment.centerLeft, child: bar(90, 11)),
          const SizedBox(height: 14),
          Align(alignment: Alignment.centerLeft, child: bar(180, 30)),
          const SizedBox(height: 8),
          Align(alignment: Alignment.centerLeft, child: bar(130, 30)),
          const SizedBox(height: 28),
          BorderedGrid(
            children: [
              for (var i = 1; i <= 4; i++)
                Container(
                  height: 150,
                  color: c.surface,
                  padding: const EdgeInsets.all(14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(twoDigits(i), style: AppText.mono(c.fgSubtle)),
                      const SizedBox(height: 12),
                      bar(110, 16),
                      const SizedBox(height: 6),
                      bar(70, 16),
                      const Spacer(),
                      Row(
                        children: [
                          Container(
                            width: 48,
                            height: 20,
                            decoration: BoxDecoration(
                              border: Border.all(color: c.border),
                            ),
                          ),
                          const SizedBox(width: 4),
                          Container(
                            width: 56,
                            height: 20,
                            decoration: BoxDecoration(
                              border: Border.all(color: c.border),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
