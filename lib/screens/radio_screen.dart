import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_colors.dart';
import '../widgets/glass_card.dart';
import '../widgets/islamic_watermark.dart';

/// Screen 15 — ISLAMIC RADIO
class RadioScreen extends StatefulWidget {
  const RadioScreen({super.key});

  @override
  State<RadioScreen> createState() => _RadioScreenState();
}

class _RadioScreenState extends State<RadioScreen> {
  bool _isPlaying = false;
  String _currentStation = 'Quran Kareem FM';
  String _currentReciter = 'Sheikh Menshawi';
  final String _currentSurah = 'Surah Rahman';

  final List<Map<String, String>> _stations = [
    {
      'name': 'Quran Kareem FM',
      'reciter': 'Sheikh Menshawi',
      'genre': 'Quran Recitation',
    },
    {
      'name': 'Reciter FM',
      'reciter': 'Sheikh Menshawi',
      'genre': 'Quran Recitation',
    },
    {
      'name': 'Surah Bhalo FM',
      'reciter': 'Sheikh Menshawi',
      'genre': 'Bangla Tafsir',
    },
    {
      'name': 'Hadith Radio',
      'reciter': 'Various Scholars',
      'genre': 'Hadith Lectures',
    },
    {
      'name': 'Islamic Nasheed FM',
      'reciter': 'Various Artists',
      'genre': 'Nasheed',
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
                    Text('Islamic Radio',
                        style: GoogleFonts.poppins(
                            color: AppColors.lightGold,
                            fontSize: 17,
                            fontWeight: FontWeight.w600)),
                    const Spacer(),
                    const Icon(Icons.search_rounded,
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
                      // Station list
                      Text('Station List',
                          style: GoogleFonts.poppins(
                              color: AppColors.lightGold,
                              fontSize: 13,
                              fontWeight: FontWeight.bold)),
                      const SizedBox(height: 10),
                      ..._stations.map((s) => GlassCard(
                            margin: const EdgeInsets.only(bottom: 8),
                            padding: const EdgeInsets.all(12),
                            onTap: () => setState(() {
                              _currentStation = s['name']!;
                              _currentReciter = s['reciter']!;
                              _isPlaying = true;
                            }),
                            child: Row(
                              children: [
                                Container(
                                  width: 46,
                                  height: 46,
                                  decoration: BoxDecoration(
                                    color: _currentStation == s['name']
                                        ? AppColors.accentGold.withOpacity(0.15)
                                        : AppColors.cardBg,
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: _currentStation == s['name']
                                          ? AppColors.accentGold
                                          : AppColors.glassBorder,
                                    ),
                                  ),
                                  child: Icon(
                                    Icons.radio_rounded,
                                    color: _currentStation == s['name']
                                        ? AppColors.accentGold
                                        : Colors.white54,
                                    size: 22,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(s['name']!,
                                          style: const TextStyle(
                                              color: AppColors.lightGold,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600)),
                                      const SizedBox(height: 2),
                                      Text(s['reciter']!,
                                          style: const TextStyle(
                                              color: Colors.white60,
                                              fontSize: 10)),
                                      Text(s['genre']!,
                                          style: const TextStyle(
                                              color: Colors.white38,
                                              fontSize: 9)),
                                    ],
                                  ),
                                ),
                                if (_currentStation == s['name'] && _isPlaying)
                                  Container(
                                    width: 8,
                                    height: 8,
                                    decoration: const BoxDecoration(
                                      color: AppColors.gpsGreen,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                              ],
                            ),
                          )),
                      const SizedBox(height: 18),

                      // Current stream player
                      if (_isPlaying) ...[
                        GlassCard(
                          glow: true,
                          padding: const EdgeInsets.all(18),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 10,
                                    height: 10,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFFFF3B30),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  const SizedBox(width: 6),
                                  const Text('LIVE',
                                      style: TextStyle(
                                          color: Colors.white70,
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold)),
                                  const Spacer(),
                                  Text(_currentStation,
                                      style: const TextStyle(
                                          color: AppColors.lightGold,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600)),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Text('$_currentSurah - $_currentReciter',
                                  style: const TextStyle(
                                      color: Colors.white60, fontSize: 10)),
                              const SizedBox(height: 16),
                              // Progress bar
                              Row(
                                children: [
                                  const Text('0:05',
                                      style: TextStyle(
                                          color: Colors.white54, fontSize: 10)),
                                  Expanded(
                                    child: Slider(
                                      value: 0.3,
                                      onChanged: (_) {},
                                      activeColor: AppColors.accentGold,
                                      inactiveColor: AppColors.glassBorder,
                                    ),
                                  ),
                                  const Text('1:50',
                                      style: TextStyle(
                                          color: Colors.white54, fontSize: 10)),
                                ],
                              ),
                              const SizedBox(height: 8),
                              // Playback controls
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  const Icon(Icons.shuffle_rounded,
                                      color: Colors.white54, size: 20),
                                  const Icon(Icons.skip_previous_rounded,
                                      color: AppColors.lightGold, size: 26),
                                  GestureDetector(
                                    onTap: () =>
                                        setState(() => _isPlaying = !_isPlaying),
                                    child: Container(
                                      width: 50,
                                      height: 50,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: AppColors.accentGold,
                                        boxShadow: [
                                          BoxShadow(
                                            color: AppColors.accentGold,
                                            blurRadius: 16,
                                            spreadRadius: 2,
                                          ),
                                        ],
                                      ),
                                      child: Icon(
                                        _isPlaying
                                            ? Icons.pause_rounded
                                            : Icons.play_arrow_rounded,
                                        color: AppColors.primaryDark,
                                        size: 26,
                                      ),
                                    ),
                                  ),
                                  const Icon(Icons.skip_next_rounded,
                                      color: AppColors.lightGold, size: 26),
                                  const Icon(Icons.repeat_rounded,
                                      color: Colors.white54, size: 20),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 18),

                        // Recommended
                        Text('Recommended Stations',
                            style: GoogleFonts.poppins(
                                color: AppColors.lightGold,
                                fontSize: 13,
                                fontWeight: FontWeight.bold)),
                        const SizedBox(height: 10),
                        SizedBox(
                          height: 90,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: 4,
                            separatorBuilder: (_, __) => const SizedBox(width: 10),
                            itemBuilder: (context, i) {
                              return Container(
                                width: 140,
                                decoration: BoxDecoration(
                                  color: AppColors.cardBg,
                                  borderRadius: BorderRadius.circular(14),
                                  border: Border.all(color: AppColors.glassBorder),
                                ),
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Icon(Icons.radio_rounded,
                                        color: AppColors.accentGold, size: 18),
                                    const Spacer(),
                                    Text(
                                      ['Quran Live', 'Hadith FM', 'Nasheed', 'Tafsir'][i],
                                      style: const TextStyle(
                                          color: AppColors.lightGold,
                                          fontSize: 10,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
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
