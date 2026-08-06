import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_colors.dart';
import '../widgets/glass_card.dart';
import '../widgets/islamic_watermark.dart';

/// Screen 07 — PRAYER TIMES
class PrayerTimesScreen extends StatelessWidget {
  const PrayerTimesScreen({super.key});

  static const List<Map<String, String>> _prayerTimes = [
    {'name': 'Fajr', 'time': '04:12', 'ampm': 'AM', 'icon': '🌙'},
    {'name': 'Dhuhr', 'time': '12:08', 'ampm': 'PM', 'icon': '☀️'},
    {'name': 'Asr', 'time': '03:45', 'ampm': 'PM', 'icon': '⛅'},
    {'name': 'Maghrib', 'time': '06:21', 'ampm': 'PM', 'icon': '🌇'},
    {'name': 'Isha', 'time': '07:38', 'ampm': 'PM', 'icon': '🌙'},
  ];

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
          const IslamicWatermark(alignment: Alignment.topRight, size: 260),
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
                    Text('Prayer Times',
                        style: GoogleFonts.poppins(
                            color: AppColors.lightGold,
                            fontSize: 17,
                            fontWeight: FontWeight.w600)),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 6),
                      decoration: BoxDecoration(
                        color: AppColors.cardBg,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: AppColors.glassBorder),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.location_on_outlined,
                              color: AppColors.accentGold, size: 14),
                          SizedBox(width: 4),
                          Text('Dhaka, Bangladesh',
                              style: TextStyle(
                                  color: AppColors.lightGold, fontSize: 10)),
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
                      // Location & GPS
                      GlassCard(
                        padding: const EdgeInsets.all(14),
                        child: Row(
                          children: [
                            const Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Current Location',
                                      style: TextStyle(
                                          color: Colors.white54, fontSize: 10)),
                                  Text('Dhaka, Bangladesh',
                                      style: TextStyle(
                                          color: AppColors.lightGold,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600)),
                                ],
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const Text('GPS Status',
                                    style: TextStyle(
                                        color: Colors.white54, fontSize: 10)),
                                const SizedBox(height: 2),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(
                                    color:
                                        AppColors.gpsGreen.withOpacity(0.12),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: const Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(Icons.wifi_tethering_rounded,
                                          color: AppColors.gpsGreen, size: 12),
                                      SizedBox(width: 4),
                                      Text('Connected',
                                          style: TextStyle(
                                              color: AppColors.gpsGreen,
                                              fontSize: 10,
                                              fontWeight: FontWeight.w600)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 14),

                      // Current Prayer Card
                      GlassCard(
                        glow: true,
                        padding: const EdgeInsets.symmetric(
                            vertical: 28, horizontal: 20),
                        child: Column(
                          children: [
                            const Icon(Icons.brightness_5_rounded,
                                color: AppColors.accentGold, size: 30),
                            const SizedBox(height: 8),
                            const Text('Current Prayer',
                                style: TextStyle(
                                    color: Colors.white60, fontSize: 11)),
                            const SizedBox(height: 4),
                            Text('Asr',
                                style: GoogleFonts.poppins(
                                    color: AppColors.lightGold,
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold)),
                            const SizedBox(height: 6),
                            const Text('Asr Time',
                                style: TextStyle(
                                    color: Colors.white54, fontSize: 11)),
                            const Text('03:45 PM',
                                style: TextStyle(
                                    color: AppColors.accentGold,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold)),
                            const SizedBox(height: 20),
                            const Text('Next Prayer: Maghrib',
                                style: TextStyle(
                                    color: Colors.white60, fontSize: 11)),
                            const SizedBox(height: 4),
                            Text('02:16:34',
                                style: GoogleFonts.poppins(
                                    color: AppColors.accentGold,
                                    fontSize: 26,
                                    fontWeight: FontWeight.bold)),
                            const SizedBox(height: 2),
                            const Text('Remaining',
                                style: TextStyle(
                                    color: Colors.white54, fontSize: 10)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 14),

                      // Next Prayer
                      GlassCard(
                        padding: const EdgeInsets.all(14),
                        child: Row(
                          children: [
                            const Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Next Prayer',
                                      style: TextStyle(
                                          color: Colors.white54, fontSize: 10)),
                                  Text('Maghrib',
                                      style: TextStyle(
                                          color: AppColors.lightGold,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 14, vertical: 8),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: AppColors.accentGold, width: 0.8),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Text('06:21 PM',
                                  style: TextStyle(
                                      color: AppColors.accentGold,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13)),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 14),

                      // Prayer grid
                      Row(
                        children: _prayerTimes.map((p) {
                          final bool active = p['name'] == 'Asr';
                          return Expanded(
                            child: Container(
                              margin: const EdgeInsets.symmetric(horizontal: 3),
                              padding: const EdgeInsets.symmetric(vertical: 11),
                              decoration: BoxDecoration(
                                color: active
                                    ? AppColors.accentGold.withOpacity(0.16)
                                    : AppColors.cardBg,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: active
                                      ? AppColors.accentGold
                                      : AppColors.glassBorder,
                                  width: active ? 1 : 0.8,
                                ),
                              ),
                              child: Column(
                                children: [
                                  Text(p['icon']!,
                                      style: const TextStyle(fontSize: 15)),
                                  const SizedBox(height: 4),
                                  Text(p['name']!,
                                      style: TextStyle(
                                          color: active
                                              ? AppColors.accentGold
                                              : Colors.white70,
                                          fontSize: 10,
                                          fontWeight: FontWeight.w600)),
                                  Text(p['time']!,
                                      style: TextStyle(
                                          color: active
                                              ? AppColors.lightGold
                                              : Colors.white60,
                                          fontSize: 11,
                                          fontWeight: active
                                              ? FontWeight.w600
                                              : FontWeight.w400)),
                                  Text(p['ampm']!,
                                      style: const TextStyle(
                                          color: Colors.white38, fontSize: 8)),
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 16),

                      // Additional info
                      Text('Additional Info',
                          style: GoogleFonts.poppins(
                              color: AppColors.lightGold,
                              fontSize: 13,
                              fontWeight: FontWeight.bold)),
                      const SizedBox(height: 10),
                      GlassCard(
                        padding: const EdgeInsets.all(14),
                        child: Row(
                          children: [
                            const Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Qibla Direction',
                                      style: TextStyle(
                                          color: AppColors.lightGold,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600)),
                                  SizedBox(height: 4),
                                  Text('Angle: 27.5°',
                                      style: TextStyle(
                                          color: Colors.white60, fontSize: 11)),
                                  SizedBox(height: 6),
                                  Text(
                                      'Calculation method as per the\nregional standard.',
                                      style: TextStyle(
                                          color: Colors.white38,
                                          fontSize: 9),
                                      maxLines: 2),
                                ],
                              ),
                            ),
                            Container(
                              width: 42,
                              height: 42,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: AppColors.accentGold, width: 1.2),
                              ),
                              child: const Icon(Icons.explore_rounded,
                                  color: AppColors.accentGold, size: 20),
                            ),
                          ],
                        ),
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
