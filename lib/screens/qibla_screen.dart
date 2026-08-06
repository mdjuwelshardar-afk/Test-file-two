import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_colors.dart';
import '../widgets/glass_card.dart';
import '../widgets/islamic_watermark.dart';

/// Screen 12 — QIBLA COMPASS
class QiblaScreen extends StatelessWidget {
  const QiblaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: AppColors.bgGradient,
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Stack(
        children: [
          const IslamicWatermark(alignment: Alignment.center, size: 320, opacity: 0.05),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(4, 8, 16, 4),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back_ios_new_rounded,
                          color: AppColors.lightGold, size: 18),
                      onPressed: () => Navigator.maybePop(context),
                    ),
                    Text('Qibla Compass',
                        style: GoogleFonts.poppins(
                            color: AppColors.lightGold,
                            fontSize: 17,
                            fontWeight: FontWeight.w600)),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                      decoration: BoxDecoration(
                        color: AppColors.cardBg,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: AppColors.glassBorder),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.location_on_outlined, color: AppColors.accentGold, size: 14),
                          SizedBox(width: 4),
                          Text('Dhaka, Bangladesh',
                              style: TextStyle(color: AppColors.lightGold, fontSize: 10)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(16, 4, 16, 20),
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      // Compass card
                      GlassCard(
                        glow: true,
                        padding: const EdgeInsets.all(24),
                        child: SizedBox(
                          height: 300,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              // Compass rose
                              CustomPaint(
                                size: const Size(280, 280),
                                painter: _CompassPainter(),
                              ),
                              // Kaaba icon
                              Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.accentGold.withOpacity(0.15),
                                  border: Border.all(color: AppColors.accentGold, width: 1.5),
                                ),
                                child: const Icon(Icons.mosque_rounded,
                                    color: AppColors.accentGold, size: 26),
                              ),
                              // Qibla arrow (pointing top-right)
                              Positioned(
                                top: 55,
                                right: 70,
                                child: Transform.rotate(
                                  angle: math.pi / 4,
                                  child: const Icon(
                                    Icons.navigation_rounded,
                                    color: AppColors.accentGold,
                                    size: 32,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      // Info cards
                      Row(
                        children: [
                          Expanded(
                            child: GlassCard(
                              padding: const EdgeInsets.all(14),
                              child: Column(
                                children: [
                                  const Icon(Icons.explore_rounded,
                                      color: AppColors.accentGold, size: 24),
                                  const SizedBox(height: 8),
                                  const Text('Qibla Direction',
                                      style: TextStyle(color: Colors.white60, fontSize: 10)),
                                  Text('27.5°',
                                      style: GoogleFonts.poppins(
                                          color: AppColors.accentGold,
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: GlassCard(
                              padding: const EdgeInsets.all(14),
                              child: Column(
                                children: [
                                  const Icon(Icons.social_distance_rounded,
                                      color: AppColors.accentGold, size: 24),
                                  const SizedBox(height: 8),
                                  const Text('Distance',
                                      style: TextStyle(color: Colors.white60, fontSize: 10)),
                                  Text('4,682 km',
                                      style: GoogleFonts.poppins(
                                          color: AppColors.accentGold,
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 14),
                      // GPS status
                      GlassCard(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Text('GPS Status',
                                    style: TextStyle(
                                        color: AppColors.lightGold,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600)),
                                const Spacer(),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: AppColors.gpsGreen.withOpacity(0.15),
                                    borderRadius: BorderRadius.circular(6),
                                    border: Border.all(color: AppColors.gpsGreen.withOpacity(0.5)),
                                  ),
                                  child: const Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(Icons.wifi_tethering_rounded,
                                          color: AppColors.gpsGreen, size: 11),
                                      SizedBox(width: 4),
                                      Text('Connected (High Accuracy)',
                                          style: TextStyle(
                                              color: AppColors.gpsGreen,
                                              fontSize: 9,
                                              fontWeight: FontWeight.w600)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            const Text('Lat: 23.8103, Lon: 90.4125',
                                style: TextStyle(color: Colors.white54, fontSize: 10)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                      // Recalibrate button
                      Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: 46,
                              child: OutlinedButton(
                                onPressed: () => Navigator.maybePop(context),
                                style: OutlinedButton.styleFrom(
                                  side: const BorderSide(color: AppColors.glassBorderStrong),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                                child: const Text('Cancel',
                                    style: TextStyle(
                                        color: AppColors.lightGold, fontSize: 13)),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            flex: 2,
                            child: SizedBox(
                              height: 46,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                      colors: AppColors.goldButtonGradient),
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [AppColors.goldGlowButton],
                                ),
                                child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(10),
                                    onTap: () {},
                                    child: const Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.gps_fixed_rounded,
                                            color: AppColors.primaryDark, size: 18),
                                        SizedBox(width: 8),
                                        Text('Recalibrate GPS',
                                            style: TextStyle(
                                                color: AppColors.primaryDark,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 13)),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _CompassPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final r = size.width / 2 - 10;

    // Outer ring
    final outerPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.5
      ..color = AppColors.glassBorder;
    canvas.drawCircle(center, r, outerPaint);

    // Inner ring
    final innerPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1
      ..color = AppColors.glassBorder.withOpacity(0.5);
    canvas.drawCircle(center, r * 0.85, innerPaint);
    canvas.drawCircle(center, r * 0.65, innerPaint);

    // Cardinal points
    final textPainter = TextPainter(textDirection: TextDirection.ltr);
    final directions = ['N', 'NE', 'E', 'SE', 'S', 'SW', 'W', 'NW'];
    for (int i = 0; i < 8; i++) {
      final angle = (math.pi * 2 / 8) * i - math.pi / 2;
      final x = center.dx + math.cos(angle) * r * 0.92;
      final y = center.dy + math.sin(angle) * r * 0.92;

      final isGold = directions[i] == 'N' || directions[i] == 'NW';
      textPainter.text = TextSpan(
        text: directions[i],
        style: TextStyle(
          color: isGold ? AppColors.accentGold : Colors.white38,
          fontSize: isGold ? 13 : 10,
          fontWeight: isGold ? FontWeight.bold : FontWeight.w400,
        ),
      );
      textPainter.layout();
      textPainter.paint(canvas, Offset(x - textPainter.width / 2, y - textPainter.height / 2));
    }

    // Tick marks
    for (int i = 0; i < 72; i++) {
      final angle = (math.pi * 2 / 72) * i - math.pi / 2;
      final isMajor = i % 9 == 0;
      final p1 = Offset(
        center.dx + math.cos(angle) * r * (isMajor ? 0.78 : 0.88),
        center.dy + math.sin(angle) * r * (isMajor ? 0.78 : 0.88),
      );
      final p2 = Offset(
        center.dx + math.cos(angle) * r * (isMajor ? 0.88 : 0.93),
        center.dy + math.sin(angle) * r * (isMajor ? 0.88 : 0.93),
      );
      canvas.drawLine(
        p1, p2,
        Paint()
          ..color = isMajor ? AppColors.accentGold : Colors.white24
          ..strokeWidth = isMajor ? 1.5 : 0.8,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
