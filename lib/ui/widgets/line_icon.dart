import 'package:material_ui/material_ui.dart';

/// Thin square-cornered line icons drawn on a 24×24 grid, matching the
/// editorial style (no rounded Material icons).
enum LineIconKind { home, journey, projects, profile, settings, back, chevron }

class LineIcon extends StatelessWidget {
  const LineIcon(this.kind, {super.key, this.size = 22, this.color});

  final LineIconKind kind;
  final double size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final color = this.color ?? DefaultTextStyle.of(context).style.color!;
    return ExcludeSemantics(
      child: CustomPaint(
        size: Size.square(size),
        painter: _LineIconPainter(kind, color),
      ),
    );
  }
}

class _LineIconPainter extends CustomPainter {
  _LineIconPainter(this.kind, this.color);

  final LineIconKind kind;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.scale(size.width / 24, size.height / 24);
    final stroke = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5
      ..strokeCap = StrokeCap.square
      ..strokeJoin = StrokeJoin.miter;

    Path line(List<Offset> points) => Path()..addPolygon(points, false);
    Rect square(double x, double y, double side) =>
        Rect.fromLTWH(x, y, side, side);

    switch (kind) {
      case LineIconKind.home:
        canvas
          ..drawPath(
            line(const [
              Offset(3.5, 10.5),
              Offset(12, 3.5),
              Offset(20.5, 10.5),
              Offset(20.5, 20.5),
              Offset(3.5, 20.5),
              Offset(3.5, 10.5),
            ]),
            stroke,
          )
          ..drawPath(
            line(const [Offset(9.5, 20.5), Offset(9.5, 14.5), Offset(14.5, 14.5), Offset(14.5, 20.5)]),
            stroke,
          );
      case LineIconKind.journey:
        canvas
          ..drawLine(const Offset(6, 3), const Offset(6, 21), stroke)
          ..drawRect(square(4, 4.5, 4), stroke)
          ..drawRect(square(4, 15.5, 4), stroke)
          ..drawLine(const Offset(11, 6.5), const Offset(20, 6.5), stroke)
          ..drawLine(const Offset(11, 17.5), const Offset(18, 17.5), stroke);
      case LineIconKind.projects:
        for (final (x, y) in const [(3.5, 3.5), (13.5, 3.5), (3.5, 13.5), (13.5, 13.5)]) {
          canvas.drawRect(square(x, y, 7), stroke);
        }
      case LineIconKind.profile:
        canvas
          ..drawRect(square(8, 3.5, 8), stroke)
          ..drawPath(
            Path()
              ..moveTo(4, 20.5)
              ..cubicTo(4, 16.5, 7.5, 14.5, 12, 14.5)
              ..cubicTo(16.5, 14.5, 20, 16.5, 20, 20.5),
            stroke,
          );
      case LineIconKind.settings:
        final knob = Paint()..color = color;
        for (final (y, x) in const [(6.0, 14.0), (12.0, 6.0), (18.0, 12.0)]) {
          canvas
            ..drawLine(Offset(3, y), Offset(21, y), stroke)
            ..drawRect(square(x, y - 2, 4), knob);
        }
      case LineIconKind.back:
        canvas
          ..drawLine(const Offset(20, 12), const Offset(4, 12), stroke)
          ..drawPath(line(const [Offset(10, 6), Offset(4, 12), Offset(10, 18)]), stroke);
      case LineIconKind.chevron:
        canvas.drawPath(line(const [Offset(9, 5), Offset(16, 12), Offset(9, 19)]), stroke);
    }
  }

  @override
  bool shouldRepaint(_LineIconPainter old) =>
      old.kind != kind || old.color != color;
}
