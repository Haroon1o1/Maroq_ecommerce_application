import 'package:flutter/material.dart';

class CornerCircle extends StatelessWidget {
  final double diameter;
  final double? top;
  final double? bottom;
  final double? left;
  final double? right;
  final Color color;
  final double strokeWidth;
  final bool filled;

  const CornerCircle({
    super.key,
    required this.diameter,
    this.top,
    this.bottom,
    this.left,
    this.right,
    this.color = Colors.black12,
    this.strokeWidth = 1.0,
    this.filled = false,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
      child: Container(
        width: diameter,
        height: diameter,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: filled ? color : Colors.transparent,
          border: filled
              ? null
              : Border.all(color: color, width: strokeWidth),
        ),
      ),
    );
  }
}
