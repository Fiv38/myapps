import 'package:flutter/material.dart';

/// Garis putus-putus (horizontal/vertical) tanpa Text.
/// - direction: Axis.horizontal / Axis.vertical
/// - dashLength: panjang strip
/// - dashGap: jarak antar strip
/// - thickness: ketebalan garis
/// - color: warna garis
class DashedLine extends StatelessWidget {
  final Axis direction;
  final double dashLength;
  final double dashGap;
  final double thickness;
  final Color color;

  const DashedLine({
    super.key,
    this.direction = Axis.horizontal,
    this.dashLength = 6,
    this.dashGap = 4,
    this.thickness = 1.5,
    this.color = Colors.black54,
  });

  @override
  Widget build(BuildContext context) {
    // Ukuran kotak lukis: untuk horizontal, tinggi = thickness; untuk vertical, lebar = thickness
    return SizedBox(
      width: direction == Axis.horizontal ? double.infinity : thickness,
      height: direction == Axis.horizontal ? thickness : double.infinity,
      child: CustomPaint(
        painter: _DashedPainter(
          direction: direction,
          dashLength: dashLength,
          dashGap: dashGap,
          thickness: thickness,
          color: color,
        ),
      ),
    );
  }
}

class _DashedPainter extends CustomPainter {
  final Axis direction;
  final double dashLength;
  final double dashGap;
  final double thickness;
  final Color color;

  _DashedPainter({
    required this.direction,
    required this.dashLength,
    required this.dashGap,
    required this.thickness,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = thickness
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.square;

    double start = 0.0;
    final max = direction == Axis.horizontal ? size.width : size.height;

    while (start < max) {
      final end = (start + dashLength).clamp(0.0, max);
      if (direction == Axis.horizontal) {
        final y = size.height / 2;
        canvas.drawLine(Offset(start, y), Offset(end, y), paint);
      } else {
        final x = size.width / 2;
        canvas.drawLine(Offset(x, start), Offset(x, end), paint);
      }
      start += dashLength + dashGap;
    }
  }

  @override
  bool shouldRepaint(covariant _DashedPainter old) {
    return old.direction != direction ||
        old.dashLength != dashLength ||
        old.dashGap != dashGap ||
        old.thickness != thickness ||
        old.color != color;
  }
}
