import 'package:material_ui/material_ui.dart';
import 'package:url_launcher/url_launcher.dart';

import '../theme/app_theme.dart';

/// Zero-padded two-digit number: `01`, `02`…
String twoDigits(int n) => n.toString().padLeft(2, '0');

/// Opens [url] in the browser or the matching app (mail…).
Future<void> openExternal(String url) async {
  final uri = Uri.tryParse(url);
  if (uri == null) return;
  await launchUrl(uri, mode: LaunchMode.externalApplication);
}

/// Mono accent label preceding titles: `// PROJECTS`.
class Kicker extends StatelessWidget {
  const Kicker(this.text, {super.key, this.color, this.header = false});

  final String text;
  final Color? color;

  /// Marks the label as a heading for screen readers (section titles).
  final bool header;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      header: header,
      child: Text(
        '// ${text.toUpperCase()}',
        style: AppText.kicker(color ?? context.colors.accent),
      ),
    );
  }
}

/// Two-line heading; the second line is dimmed.
class TwoLineTitle extends StatelessWidget {
  const TwoLineTitle(
    this.line1,
    this.line2, {
    super.key,
    this.size = 34,
    this.color,
    this.secondColor,
  });

  final String line1;
  final String? line2;
  final double size;
  final Color? color;
  final Color? secondColor;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return Semantics(
      header: true,
      child: Text.rich(
        TextSpan(
          text: line1,
          children: [
            if (line2 != null && line2!.isNotEmpty)
              TextSpan(
                text: '\n$line2',
                style: TextStyle(color: secondColor ?? c.fgSubtle),
              ),
          ],
        ),
        style: AppText.display(color ?? c.fgStrong, size: size),
      ),
    );
  }
}

/// Kicker + title block at the top of a screen.
class ScreenTitle extends StatelessWidget {
  const ScreenTitle({
    super.key,
    required this.kicker,
    required this.line1,
    this.line2,
    this.size = 34,
    this.padding = const EdgeInsets.fromLTRB(20, 32, 20, 20),
  });

  final String kicker;
  final String line1;
  final String? line2;
  final double size;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Kicker(kicker),
          const SizedBox(height: 10),
          TwoLineTitle(line1, line2, size: size),
        ],
      ),
    );
  }
}

/// A page section with an accent mono label.
class Section extends StatelessWidget {
  const Section({
    super.key,
    required this.label,
    required this.child,
    this.padding = const EdgeInsets.fromLTRB(20, 0, 20, 32),
  });

  final String label;
  final Widget child;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Kicker(label, header: true),
          const SizedBox(height: 12),
          child,
        ],
      ),
    );
  }
}

/// Technology chip: thin border, mono 12 px text.
class TechChip extends StatelessWidget {
  const TechChip(
    this.label, {
    super.key,
    this.textColor,
    this.borderColor,
    this.background,
    this.dashed = false,
    this.suffix,
    this.small = false,
  });

  final String label;
  final Color? textColor;
  final Color? borderColor;
  final Color? background;
  final bool dashed;
  final InlineSpan? suffix;
  final bool small;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final border = borderColor ?? c.chipBorder;
    final text = Text.rich(
      TextSpan(text: label, children: [?suffix]),
      style: AppText.mono(textColor ?? c.fg, size: small ? 11 : 12),
    );
    final padding = small
        ? const EdgeInsets.symmetric(horizontal: 6, vertical: 3)
        : const EdgeInsets.symmetric(horizontal: 9, vertical: 5);
    if (dashed) {
      return CustomPaint(
        painter: DashedBorderPainter(border),
        child: Padding(padding: padding, child: text),
      );
    }
    return DecoratedBox(
      decoration: BoxDecoration(
        color: background,
        border: Border.all(color: border),
      ),
      child: Padding(padding: padding, child: text),
    );
  }
}

class DashedBorderPainter extends CustomPainter {
  DashedBorderPainter(this.color);

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1;
    const dash = 3.0;
    const gap = 2.0;
    void dashed(Offset from, Offset to) {
      final length = (to - from).distance;
      final dir = (to - from) / length;
      for (var d = 0.0; d < length; d += dash + gap) {
        final end = d + dash > length ? length : d + dash;
        canvas.drawLine(from + dir * d, from + dir * end, paint);
      }
    }

    final r = Offset.zero & size;
    final rect = r.deflate(0.5);
    dashed(rect.topLeft, rect.topRight);
    dashed(rect.topRight, rect.bottomRight);
    dashed(rect.bottomRight, rect.bottomLeft);
    dashed(rect.bottomLeft, rect.topLeft);
  }

  @override
  bool shouldRepaint(DashedBorderPainter old) => old.color != color;
}

/// A wrap of [TechChip]s.
class ChipWrap extends StatelessWidget {
  const ChipWrap(this.labels, {super.key, this.small = false});

  final List<String> labels;
  final bool small;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: small ? 4 : 6,
      runSpacing: small ? 4 : 6,
      children: [for (final l in labels) TechChip(l, small: small)],
    );
  }
}

enum BadgeStyle { filled, outlined, subtle }

/// Mono upper-case badge for project kind, status, year…
class MonoBadge extends StatelessWidget {
  const MonoBadge(
    this.label, {
    super.key,
    this.style = BadgeStyle.subtle,
    this.dot,
  });

  final String label;
  final BadgeStyle style;

  /// Optional square status marker: `true` = filled, `false` = outlined.
  final bool? dot;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final (bg, fg, border) = switch (style) {
      BadgeStyle.filled => (c.inverse, c.inverseFg, c.inverse),
      BadgeStyle.outlined => (null, c.fgStrong, c.borderStrong),
      BadgeStyle.subtle => (null, c.fgSubtle, c.chipBorder),
    };
    return DecoratedBox(
      decoration: BoxDecoration(color: bg, border: Border.all(color: border)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (dot != null) ...[
              Container(
                width: 6,
                height: 6,
                decoration: BoxDecoration(
                  color: dot! ? c.accent : null,
                  border: Border.all(color: c.accent),
                ),
              ),
              const SizedBox(width: 6),
            ],
            Text(
              label.toUpperCase(),
              style: AppText.mono(fg, size: 10, letterSpacing: 0.8),
            ),
          ],
        ),
      ),
    );
  }
}

/// Numbered rows (`01`, `02`…) separated by thin borders.
class NumberedList extends StatelessWidget {
  const NumberedList(this.items, {super.key, this.topBorder = false});

  final List<String> items;
  final bool topBorder;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return DecoratedBox(
      decoration: BoxDecoration(
        border: topBorder
            ? Border(top: BorderSide(color: c.borderStrong))
            : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          for (final (i, item) in items.indexed)
            DecoratedBox(
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: c.border)),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 11),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 34,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 3),
                        child: Text(
                          twoDigits(i + 1),
                          style: AppText.mono(c.fgSubtle),
                        ),
                      ),
                    ),
                    Expanded(child: Text(item, style: AppText.body(c.fg))),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}

/// Grid with shared thin borders and a strong top border.
class BorderedGrid extends StatelessWidget {
  const BorderedGrid({super.key, required this.children, this.columns = 2});

  final List<Widget> children;
  final int columns;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final cellBorder = Border(
      right: BorderSide(color: c.border),
      bottom: BorderSide(color: c.border),
    );
    final rows = <Widget>[];
    for (var i = 0; i < children.length; i += columns) {
      rows.add(
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              for (var j = i; j < i + columns; j++)
                Expanded(
                  // Foreground: cells paint their own background.
                  child: DecoratedBox(
                    position: DecorationPosition.foreground,
                    decoration: BoxDecoration(border: cellBorder),
                    child: j < children.length
                        ? children[j]
                        : const SizedBox.shrink(),
                  ),
                ),
            ],
          ),
        ),
      );
    }
    return DecoratedBox(
      position: DecorationPosition.foreground,
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: c.borderStrong),
          left: BorderSide(color: c.border),
        ),
      ),
      child: Column(children: rows),
    );
  }
}

/// Tap target that reports its pressed state, so cards can switch to the
/// inverse palette while pressed (no ripple).
class Pressable extends StatefulWidget {
  const Pressable({
    super.key,
    required this.onTap,
    required this.builder,
    this.semanticLabel,
    this.isLink = false,
  });

  final VoidCallback? onTap;
  final Widget Function(BuildContext context, bool pressed) builder;
  final String? semanticLabel;
  final bool isLink;

  @override
  State<Pressable> createState() => _PressableState();
}

class _PressableState extends State<Pressable> {
  bool _pressed = false;

  void _set(bool value) {
    if (_pressed != value) setState(() => _pressed = value);
  }

  @override
  Widget build(BuildContext context) {
    final enabled = widget.onTap != null;
    return Semantics(
      button: !widget.isLink && enabled,
      link: widget.isLink,
      label: widget.semanticLabel,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: widget.onTap,
        onTapDown: enabled ? (_) => _set(true) : null,
        onTapUp: enabled ? (_) => _set(false) : null,
        onTapCancel: enabled ? () => _set(false) : null,
        child: widget.builder(context, _pressed),
      ),
    );
  }
}

enum AppButtonStyle { primary, outline }

/// Square full-width-friendly button (48 px high).
class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.style = AppButtonStyle.primary,
  });

  final String label;
  final VoidCallback? onPressed;
  final AppButtonStyle style;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return Pressable(
      onTap: onPressed,
      builder: (context, pressed) {
        final primary = style == AppButtonStyle.primary;
        final bg = pressed
            ? c.inverse
            : primary
            ? c.accent
            : null;
        final fg = pressed
            ? c.inverseFg
            : primary
            ? c.accentFg
            : c.fgStrong;
        return Container(
          height: 48,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: bg,
            border: primary ? null : Border.all(color: c.borderStrong),
          ),
          child: Text(
            label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppText.body(
              fg,
              weight: primary ? FontWeight.w600 : FontWeight.w500,
            ),
          ),
        );
      },
    );
  }
}

/// Row link with a trailing arrow (↗ external or chevron internal).
class LinkRow extends StatelessWidget {
  const LinkRow({
    super.key,
    required this.title,
    this.subtitle,
    this.leading,
    this.trailing,
    this.onTap,
    this.isExternal = false,
    this.inverse = false,
    this.minHeight = 52,
  });

  final Widget title;
  final Widget? subtitle;
  final Widget? leading;
  final Widget? trailing;
  final VoidCallback? onTap;
  final bool isExternal;
  final bool inverse;
  final double minHeight;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return Pressable(
      onTap: onTap,
      isLink: onTap != null,
      builder: (context, pressed) {
        final fg = inverse ? c.inverseFg : c.fgStrong;
        return Container(
          constraints: BoxConstraints(minHeight: minHeight),
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: inverse ? c.inverseSubtle : c.border),
            ),
          ),
          child: Opacity(
            opacity: pressed ? 0.6 : 1,
            child: Row(
              children: [
                if (leading != null) ...[leading!, const SizedBox(width: 14)],
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      title,
                      if (subtitle != null) ...[
                        const SizedBox(height: 3),
                        subtitle!,
                      ],
                    ],
                  ),
                ),
                ?trailing,
                if (trailing == null && onTap != null)
                  isExternal
                      ? Text('↗', style: AppText.mono(fg, size: 14))
                      : Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: _Chevron(color: fg),
                        ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _Chevron extends StatelessWidget {
  const _Chevron({required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 16,
      height: 16,
      child: CustomPaint(painter: _ChevronPainter(color)),
    );
  }
}

class _ChevronPainter extends CustomPainter {
  _ChevronPainter(this.color);

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final s = size.width / 24;
    canvas.drawPath(
      Path()
        ..moveTo(9 * s, 5 * s)
        ..lineTo(16 * s, 12 * s)
        ..lineTo(9 * s, 19 * s),
      Paint()
        ..color = color
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.5,
    );
  }

  @override
  bool shouldRepaint(_ChevronPainter old) => old.color != color;
}
