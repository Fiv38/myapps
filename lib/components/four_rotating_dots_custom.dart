import 'dart:math' as math;
import 'package:flutter/material.dart';

class FourRotatingDots extends StatefulWidget {
  final double size;
  final Color color;
  final List<Color>? colors; // [left, right, top, bottom]

  const FourRotatingDots({
    super.key,
    required this.size,
    required this.color,
    this.colors,
  });

  @override
  State<FourRotatingDots> createState() => _FourRotatingDotsState();
}

class _FourRotatingDotsState extends State<FourRotatingDots> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    final double radius = widget.size / 3;
    final double dotSize = widget.size * 0.25;

    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          final angle = _controller.value * 2 * math.pi;

          return Transform.rotate(
            angle: angle,
            child: Stack(
              alignment: Alignment.center,
              children: [
                _dot(
                  offset: Offset(-radius, 0),
                  color: widget.colors?[0] ?? widget.color,
                  size: dotSize,
                ),
                _dot(
                  offset: Offset(radius, 0),
                  color: widget.colors?[1] ?? widget.color,
                  size: dotSize,
                ),
                _dot(
                  offset: Offset(0, -radius),
                  color: widget.colors?[2] ?? widget.color,
                  size: dotSize,
                ),
                _dot(
                  offset: Offset(0, radius),
                  color: widget.colors?[3] ?? widget.color,
                  size: dotSize,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _dot({required Offset offset, required Color color, required double size}) {
    return Transform.translate(
      offset: offset,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
