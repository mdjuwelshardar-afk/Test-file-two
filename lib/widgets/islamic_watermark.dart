import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

/// Faint gold geometric Islamic star pattern used as a corner/background
/// watermark across screens.
class IslamicWatermark extends StatelessWidget {
  final double size;
  final Alignment alignment;
  final double opacity;

  const IslamicWatermark({
    super.key,
    this.size = 260,
    this.alignment = Alignment.topRight,
    this.opacity = 0.07,
  });

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Align(
        alignment: alignment,
        child: Opacity(
          opacity: opacity,
          child: SizedBox(
            width: size,
            height: size,
            child: CustomPaint(painter: _GeometricStarPainter()),
          ),
        ),
      ),
    );
  }
}

class _GeometricStarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint stroke = Paint()
      ..color = AppColors.accentGold
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.2;

    final Offset center = Offset(size.width / 2, size.height / 2);
    final double r = size.width / 2;

    // Concentric rings
    for (final f in [1.0, 0.78, 0.56, 0.34]) {
      canvas.drawCircle(center, r * f, stroke);
    }

    // 8-point star / rosette made of two overlapping squares
    _drawPolygon(canvas, center, r * 0.88, 8, math.pi / 8, stroke);
    _drawPolygon(canvas, center, r * 0.88, 8, 0, stroke);

    // Radiating lines
    for (int i = 0; i < 16; i++) {
      final angle = (math.pi * 2 / 16) * i;
      final p1 = Offset(
        center.dx + math.cos(angle) * r * 0.56,
        center.dy + math.sin(angle) * r * 0.56,
      );
      final p2 = Offset(
        center.dx + math.cos(angle) * r * 1.0,
        center.dy + math.sin(angle) * r * 1.0,
      );
      canvas.drawLine(p1, p2, stroke);
    }

    // Small inner star
    _drawPolygon(canvas, center, r * 0.24, 8, math.pi / 8, stroke);
  }

  void _drawPolygon(Canvas canvas, Offset center, double radius, int sides,
      double rotation, Paint paint) {
    final path = Path();
    for (int i = 0; i <= sides; i++) {
      final angle = (math.pi * 2 / sides) * i + rotation;
      final point = Offset(
        center.dx + radius * math.cos(angle),
        center.dy + radius * math.sin(angle),
      );
      if (i == 0) {
        path.moveTo(point.dx, point.dy);
      } else {
        path.lineTo(point.dx, point.dy);
      }
    }
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
