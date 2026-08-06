import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_colors.dart';
import '../widgets/glass_card.dart';
import '../widgets/islamic_watermark.dart';

/// Screen 14 — ISLAMIC CALENDAR
class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  int _selectedDay = 15;
  final String _currentHijriMonth = 'Shawwal 1445 H';
  final String _currentGregorianMonth = 'May 2024 G';

  final List<String> _weekDays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
  final List<int> _days = List.generate(31, (i) => i + 1);

  final List<Map<String, String>> _events = [
    {
      'title': 'Fasts of Shawwal (6 days)',
      'date': 'Shawwal 27',
      'gregorian': 'May 27',
    },
    {
      'title': 'Potential moon sighting',
      'date': 'Shawwal 29/30',
      'gregorian': 'May 27',
    },
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
          const IslamicWatermark(alignment: Alignment.topRight, size: 260, opacity: 0.05),
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
                    Text('Islamic Calendar',
                        style: GoogleFonts.poppins(
                            color: AppColors.lightGold,
                            fontSize: 17,
                            fontWeight: FontWeight.w600)),
                    const Spacer(),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(16, 4, 16, 20),
                  child: Column(
                    children: [
                      // Month header
                      GlassCard(
                        glow: true,
                        padding: const EdgeInsets.all(18),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.chevron_left_rounded,
                                      color: AppColors.accentGold, size: 24),
                                  onPressed: () {},
                                ),
                                Column(
                                  children: [
                                    Text(_currentHijriMonth,
                                        style: GoogleFonts.amiri(
                                            color: AppColors.lightGold,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold)),
                                    const SizedBox(height: 4),
                                    Text(_currentGregorianMonth,
                                        style: const TextStyle(
                                            color: Colors.white60, fontSize: 11)),
                                  ],
                                ),
                                IconButton(
                                  icon: const Icon(Icons.chevron_right_rounded,
                                      color: AppColors.accentGold, size: 24),
                                  onPressed: () {},
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 14),
                      // Calendar grid
                      GlassCard(
                        padding: const EdgeInsets.all(14),
                        child: Column(
                          children: [
                            // Week day headers
                            Row(
                              children: _weekDays
                                  .map((d) => Expanded(
                                        child: Center(
                                          child: Text(d,
                                              style: const TextStyle(
                                                  color: Colors.white54,
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w600)),
                                        ),
                                      ))
                                  .toList(),
                            ),
                            const SizedBox(height: 8),
                            // Day grid
                            GridView.count(
                              crossAxisCount: 7,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              childAspectRatio: 1,
                              mainAxisSpacing: 4,
                              crossAxisSpacing: 4,
                              children: _days.map((day) {
                                final isToday = day == 15;
                                final isSelected = day == _selectedDay;
                                final isFriday = (day - 3) % 7 == 0;
                                return GestureDetector(
                                  onTap: () => setState(() => _selectedDay = day),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: isSelected
                                          ? AppColors.accentGold.withOpacity(0.2)
                                          : null,
                                      borderRadius: BorderRadius.circular(8),
                                      border: isToday
                                          ? Border.all(color: AppColors.accentGold, width: 1.5)
                                          : null,
                                      boxShadow: isToday
                                          ? [
                                              BoxShadow(
                                                color: AppColors.accentGold.withOpacity(0.2),
                                                blurRadius: 6,
                                              ),
                                            ]
                                          : null,
                                    ),
                                    child: Center(
                                      child: Text(
                                        '$day',
                                        style: TextStyle(
                                          color: isSelected || isToday
                                              ? AppColors.accentGold
                                              : isFriday
                                                  ? Colors.white70
                                                  : Colors.white54,
                                          fontSize: 12,
                                          fontWeight: isToday
                                              ? FontWeight.bold
                                              : FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      // Events
                      Text('Islamic Events',
                          style: GoogleFonts.poppins(
                              color: AppColors.lightGold,
                              fontSize: 13,
                              fontWeight: FontWeight.bold)),
                      const SizedBox(height: 10),
                      ..._events.map((e) => GlassCard(
                            margin: const EdgeInsets.only(bottom: 8),
                            padding: const EdgeInsets.all(14),
                            child: Row(
                              children: [
                                Container(
                                  width: 42,
                                  height: 42,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: AppColors.accentGold.withOpacity(0.12),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Text(e['gregorian']!.substring(3),
                                      style: const TextStyle(
                                          color: AppColors.accentGold,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 11)),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(e['title']!,
                                          style: const TextStyle(
                                              color: AppColors.lightGold,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600)),
                                      Text(e['date']!,
                                          style: const TextStyle(
                                              color: Colors.white54,
                                              fontSize: 10)),
                                    ],
                                  ),
                                ),
                                const Icon(Icons.event_note_rounded,
                                    color: Colors.white38, size: 18),
                              ],
                            ),
                          )),
                      const SizedBox(height: 14),
                      // Add custom event
                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.add_circle_outline_rounded,
                              color: AppColors.lightGold, size: 16),
                          label: const Text('Add Custom Dhikr',
                              style: TextStyle(
                                  color: AppColors.lightGold, fontSize: 12)),
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: AppColors.glassBorder),
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
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
