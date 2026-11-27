import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:material_ui/material_ui.dart';

import '../../core/media/media.dart';
import '../theme/app_theme.dart';

/// Luminance-preserving grayscale, as on the website.
const _grayscale = ColorFilter.matrix([
  0.2126, 0.7152, 0.0722, 0, 0, //
  0.2126, 0.7152, 0.0722, 0, 0, //
  0.2126, 0.7152, 0.0722, 0, 0, //
  0, 0, 0, 1, 0, //
]);

/// An API image (`/media/…` path) loaded through the on-device cache.
///
/// Shows [fallback] while loading, when [path] is null, and when the file
/// cannot be fetched or decoded. Handles raster formats and SVG.
class MediaImage extends ConsumerWidget {
  const MediaImage({
    super.key,
    required this.path,
    required this.fallback,
    this.fit = BoxFit.cover,
    this.grayscale = false,
    this.semanticLabel,
  });

  final String? path;
  final Widget fallback;
  final BoxFit fit;
  final bool grayscale;

  /// Image description for screen readers; `null` hides the image from them.
  final String? semanticLabel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final url = mediaUrl(path);
    if (url == null) return fallback;
    final file = ref.watch(mediaFileProvider(url)).value;
    if (file == null) return fallback;

    final label = semanticLabel?.trim();
    final Widget image;
    if (isSvgUrl(url)) {
      image = SvgPicture.file(
        file,
        fit: fit,
        excludeFromSemantics: true,
        placeholderBuilder: (_) => fallback,
        errorBuilder: (_, _, _) => fallback,
      );
    } else {
      image = LayoutBuilder(
        builder: (context, constraints) {
          // Decode at display size to keep memory low.
          final dpr = MediaQuery.devicePixelRatioOf(context);
          final width = constraints.maxWidth.isFinite
              ? (constraints.maxWidth * dpr).round()
              : null;
          return Image.file(
            file,
            fit: fit,
            width: double.infinity,
            height: double.infinity,
            cacheWidth: width,
            excludeFromSemantics: true,
            gaplessPlayback: true,
            errorBuilder: (_, _, _) => fallback,
          );
        },
      );
    }
    return Semantics(
      image: label != null && label.isNotEmpty,
      label: label,
      excludeSemantics: true,
      child: grayscale
          ? ColorFiltered(colorFilter: _grayscale, child: image)
          : image,
    );
  }
}

/// Company or school logo in a small white square, uncropped (`contain`).
/// Falls back to the organization's initials.
class OrgLogo extends StatelessWidget {
  const OrgLogo({
    super.key,
    required this.path,
    required this.name,
    this.size = 40,
  });

  final String? path;

  /// Organization name: the logo's description and the fallback initials.
  final String name;
  final double size;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final hasLogo = mediaUrl(path) != null;
    final fallback = Container(
      alignment: Alignment.center,
      color: c.surface,
      child: Text(
        initials(name),
        style: AppText.mono(
          c.fgSubtle,
          size: size * 0.3,
          weight: FontWeight.w500,
        ),
      ),
    );
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        // White behind logos in both themes, like on the website.
        color: hasLogo ? Colors.white : c.surface,
        border: Border.all(color: c.chipBorder),
      ),
      padding: EdgeInsets.all(hasLogo ? size * 0.12 : 0),
      child: MediaImage(
        path: path,
        fit: BoxFit.contain,
        semanticLabel: name,
        fallback: ExcludeSemantics(child: fallback),
      ),
    );
  }
}

/// Up to two upper-case initials: "IOMEDIA SA" → "IS", "CPNV" → "CP".
String initials(String name) {
  final words = name
      .split(RegExp(r'[\s\-·/]+'))
      .map((w) => w.replaceAll(RegExp(r'[^\p{L}\p{N}]', unicode: true), ''))
      .where((w) => w.isNotEmpty)
      .toList();
  if (words.isEmpty) return '';
  if (words.length == 1) {
    final w = words.first;
    return (w.length > 1 ? w.substring(0, 2) : w).toUpperCase();
  }
  return (words[0][0] + words[1][0]).toUpperCase();
}

/// Grayscale project image behind a 90% veil of the card color, so text on
/// top stays readable (same treatment as the website's cards).
class VeiledImage extends StatelessWidget {
  const VeiledImage({
    super.key,
    required this.path,
    required this.veilColor,
    this.opacity = 0.9,
  });

  final String? path;
  final Color veilColor;
  final double opacity;

  @override
  Widget build(BuildContext context) {
    if (mediaUrl(path) == null) return ColoredBox(color: veilColor);
    return Stack(
      fit: StackFit.expand,
      children: [
        // Solid base while the image loads or if it fails.
        ColoredBox(color: veilColor),
        ExcludeSemantics(
          child: MediaImage(
            path: path,
            grayscale: true,
            fallback: const SizedBox.shrink(),
          ),
        ),
        ColoredBox(color: veilColor.withValues(alpha: opacity)),
      ],
    );
  }
}
