import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_colors.dart';
import '../widgets/glass_card.dart';
import '../widgets/islamic_watermark.dart';

/// Screen 06 — DUA MODULE
class DuaScreen extends StatefulWidget {
  const DuaScreen({super.key});

  @override
  State<DuaScreen> createState() => _DuaScreenState();
}

class _DuaScreenState extends State<DuaScreen> {
  bool _playing = false;

  static const List<Map<String, dynamic>> _categories = [
    {'label': 'Quranic Duas', 'icon': Icons.menu_book_rounded},
    {'label': 'Daily Supplications', 'icon': Icons.volunteer_activism_rounded},
    {'label': 'For Guidance', 'icon': Icons.explore_rounded},
    {'label': 'For Health', 'icon': Icons.favorite_rounded},
    {'label': 'For Forgiveness', 'icon': Icons.pan_tool_alt_rounded},
    {'label': 'Morning Azkar', 'icon': Icons.wb_sunny_rounded},
    {'label': 'Evening Azkar', 'icon': Icons.nights_stay_rounded},
    {'label': 'Before Bed', 'icon': Icons.bedtime_rounded},
    {'label': 'After Salah', 'icon': Icons.self_improvement_rounded},
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
                    Text('Dua Collection',
                        style: GoogleFonts.poppins(
                            color: AppColors.lightGold,
                            fontSize: 16,
                            fontWeight: FontWeight.w600)),
                    const Spacer(),
                    const Icon(Icons.search_rounded,
                        color: AppColors.accentGold, size: 19),
                    const SizedBox(width: 12),
                    const Icon(Icons.favorite_border_rounded,
                        color: AppColors.accentGold, size: 19),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(16, 4, 16, 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Quick Access
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Quick Access',
                              style: GoogleFonts.poppins(
                                  color: AppColors.lightGold,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold)),
                          const Text('View All',
                              style: TextStyle(
                                  color: AppColors.accentGold, fontSize: 10)),
                        ],
                      ),
                      const SizedBox(height: 10),
                      GridView.count(
                        crossAxisCount: 3,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 1.05,
                        children: _categories
                            .map((c) => Container(
                                  decoration: BoxDecoration(
                                    color: AppColors.cardBg,
                                    borderRadius: BorderRadius.circular(14),
                                    border: Border.all(
                                        color: AppColors.glassBorder),
                                    boxShadow: [
                                      BoxShadow(
                                        color: AppColors.accentGold
                                            .withOpacity(0.04),
                                        blurRadius: 8,
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 36,
                                        height: 36,
                                        decoration: BoxDecoration(
                                          color: AppColors.accentGold
                                              .withOpacity(0.12),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Icon(c['icon'] as IconData,
                                            color: AppColors.accentGold,
                                            size: 18),
                                      ),
                                      const SizedBox(height: 6),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 3),
                                        child: Text(
                                          c['label'] as String,
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                              color: Colors.white70,
                                              fontSize: 9.5),
                                        ),
                                      ),
                                    ],
                                  ),
                                ))
                            .toList(),
                      ),
                      const SizedBox(height: 22),

                      // Today's Dua
                      Text("Today's Dua",
                          style: GoogleFonts.poppins(
                              color: AppColors.lightGold,
                              fontSize: 13,
                              fontWeight: FontWeight.bold)),
                      const SizedBox(height: 10),
                      GlassCard(
                        glow: true,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 28,
                                  height: 28,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: AppColors.accentGold),
                                  ),
                                  child: const Text('1',
                                      style: TextStyle(
                                          color: AppColors.accentGold,
                                          fontSize: 11,
                                          fontWeight: FontWeight.bold)),
                                ),
                                const Spacer(),
                                const Icon(Icons.bookmark_border_rounded,
                                    color: Colors.white54, size: 18),
                                const SizedBox(width: 8),
                                const Icon(Icons.volume_up_rounded,
                                    color: Colors.white54, size: 18),
                              ],
                            ),
                            const SizedBox(height: 12),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                'رَبَّنَا آتِنَا فِي الدُّنْيَا حَسَنَةً وَفِي الْآخِرَةِ حَسَنَةً وَقِنَا عَذَابَ النَّارِ',
                                textAlign: TextAlign.right,
                                style: GoogleFonts.amiri(
                                    color: AppColors.lightGold,
                                    fontSize: 17,
                                    height: 1.8),
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Text('রাব্বানা আতিনা ফিদ্দুনিয়া হাসানাতাও ওয়া ফিল আখিরাতি হাসানাতাও ওয়া কিনা আযাবান নার',
                                style: TextStyle(
                                    color: AppColors.accentGold,
                                    fontSize: 11,
                                    fontStyle: FontStyle.italic)),
                            const SizedBox(height: 6),
                            const Text(
                                'হে আমাদের রব! আমাদের দুনিয়াতে কল্যাণ দাও এবং আখিরাতে কল্যাণ দাও এবং আমাদের আগুনের শাস্তি থেকে রক্ষা কর।',
                                style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 11,
                                    height: 1.5)),
                            const SizedBox(height: 16),

                            // Audio
                            Row(
                              children: [
                                const Text('00:05',
                                    style: TextStyle(
                                        color: Colors.white54, fontSize: 10)),
                                Expanded(
                                  child: Slider(
                                    value: 0.18,
                                    onChanged: (_) {},
                                    activeColor: AppColors.accentGold,
                                    inactiveColor: AppColors.glassBorder,
                                  ),
                                ),
                                const Text('00:28',
                                    style: TextStyle(
                                        color: Colors.white54, fontSize: 10)),
                              ],
                            ),
                            Center(
                              child: GestureDetector(
                                onTap: () =>
                                    setState(() => _playing = !_playing),
                                child: Container(
                                  width: 44,
                                  height: 44,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.accentGold,
                                  ),
                                  child: Icon(
                                    _playing
                                        ? Icons.pause_rounded
                                        : Icons.play_arrow_rounded,
                                    color: AppColors.primaryDark,
                                    size: 22,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 12),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: const [
                                Icon(Icons.favorite_border_rounded,
                                    color: Colors.white54, size: 18),
                                Icon(Icons.share_outlined,
                                    color: Colors.white54, size: 18),
                                Icon(Icons.copy_rounded,
                                    color: Colors.white54, size: 18),
                                Icon(Icons.translate_rounded,
                                    color: Colors.white54, size: 18),
                              ],
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
