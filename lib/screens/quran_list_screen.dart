import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_colors.dart';
import '../widgets/glass_card.dart';
import '../widgets/islamic_watermark.dart';
import 'quran_reader_screen.dart';

/// Screen 02 — QURAN SURAH LIST
class QuranListScreen extends StatefulWidget {
  const QuranListScreen({super.key});

  @override
  State<QuranListScreen> createState() => _QuranListScreenState();
}

class _QuranListScreenState extends State<QuranListScreen> {
  final TextEditingController _search = TextEditingController();

  static const List<Map<String, String>> _surahs = [
    {'no': '1', 'ar': 'سُورَةُ الْفَاتِحَةِ', 'bn': 'আল-ফাতিহা', 'en': 'Surah Al-Fatihah', 'ayahs': '7 Ayahs', 'revelation': 'Makki'},
    {'no': '2', 'ar': 'سُورَةُ الْبَقَرَةِ', 'bn': 'আল-বাকারাহ', 'en': 'Surah Al-Baqarah', 'ayahs': '286 Ayahs', 'revelation': 'Madani'},
    {'no': '3', 'ar': 'سُورَةُ آلِ عِمْرَانَ', 'bn': 'আলে ইমরান', 'en': "Surah Ali 'Imran", 'ayahs': '200 Ayahs', 'revelation': 'Madani'},
    {'no': '4', 'ar': 'سُورَةُ النِّسَاءِ', 'bn': 'আন-নিসা', 'en': "Surah An-Nisa'", 'ayahs': '176 Ayahs', 'revelation': 'Madani'},
    {'no': '5', 'ar': 'سُورَةُ الْمَائِدَةِ', 'bn': 'আল-মায়িদাহ', 'en': "Surah Al-Ma'idah", 'ayahs': '120 Ayahs', 'revelation': 'Madani'},
    {'no': '6', 'ar': 'سُورَةُ الْأَنْعَامِ', 'bn': 'আল-আনআম', 'en': "Surah Al-An'am", 'ayahs': '165 Ayahs', 'revelation': 'Makki'},
    {'no': '7', 'ar': 'سُورَةُ الْأَعْرَافِ', 'bn': 'আল-আরাফ', 'en': "Surah Al-A'raf", 'ayahs': '206 Ayahs', 'revelation': 'Makki'},
    {'no': '8', 'ar': 'سُورَةُ الْأَنْفَالِ', 'bn': 'আল-আনফাল', 'en': 'Surah Al-Anfal', 'ayahs': '75 Ayahs', 'revelation': 'Madani'},
    {'no': '9', 'ar': 'سُورَةُ التَّوْبَةِ', 'bn': 'আত-তাওবাহ', 'en': 'Surah At-Tawbah', 'ayahs': '129 Ayahs', 'revelation': 'Madani'},
    {'no': '10', 'ar': 'سُورَةُ يُونُسَ', 'bn': 'ইউনুস', 'en': 'Surah Yunus', 'ayahs': '109 Ayahs', 'revelation': 'Makki'},
    {'no': '11', 'ar': 'سُورَةُ هُودٍ', 'bn': 'হুদ', 'en': 'Surah Hud', 'ayahs': '123 Ayahs', 'revelation': 'Makki'},
    {'no': '12', 'ar': 'سُورَةُ يُوسُفَ', 'bn': 'ইউসুফ', 'en': 'Surah Yusuf', 'ayahs': '111 Ayahs', 'revelation': 'Makki'},
    {'no': '13', 'ar': 'سُورَةُ الرَّعْدِ', 'bn': 'আর-রাদ', 'en': "Surah Ar-Ra'd", 'ayahs': '43 Ayahs', 'revelation': 'Madani'},
    {'no': '14', 'ar': 'سُورَةُ إِبْرَاهِيمَ', 'bn': 'ইব্রাহীম', 'en': 'Surah Ibrahim', 'ayahs': '52 Ayahs', 'revelation': 'Makki'},
  ];

  @override
  Widget build(BuildContext context) {
    final query = _search.text.trim().toLowerCase();
    final filtered = query.isEmpty
        ? _surahs
        : _surahs
            .where((s) =>
                s['en']!.toLowerCase().contains(query) ||
                s['bn']!.contains(query) ||
                s['ar']!.contains(query))
            .toList();

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
              // Header
              Padding(
                padding: const EdgeInsets.fromLTRB(4, 8, 16, 4),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back_ios_new_rounded,
                          color: AppColors.lightGold, size: 18),
                      onPressed: () => Navigator.maybePop(context),
                    ),
                    Text('QURAN',
                        style: GoogleFonts.poppins(
                            color: AppColors.lightGold,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1)),
                    const Spacer(),
                    const Icon(Icons.search_rounded,
                        color: AppColors.accentGold, size: 20),
                    const SizedBox(width: 10),
                    const Icon(Icons.filter_list_rounded,
                        color: AppColors.accentGold, size: 20),
                  ],
                ),
              ),
              // Search field
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  controller: _search,
                  onChanged: (_) => setState(() {}),
                  style: const TextStyle(color: Colors.white, fontSize: 13),
                  decoration: InputDecoration(
                    hintText: 'Search Surah...',
                    hintStyle:
                        const TextStyle(color: Colors.white38, fontSize: 12),
                    prefixIcon: const Icon(Icons.search,
                        color: AppColors.accentGold, size: 18),
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 12),
                    filled: true,
                    fillColor: AppColors.cardBg,
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: AppColors.glassBorder),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: AppColors.accentGold),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              // Surah list
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.fromLTRB(16, 4, 16, 20),
                  itemCount: filtered.length,
                  itemBuilder: (context, i) {
                    final s = filtered[i];
                    return GlassCard(
                      margin: const EdgeInsets.only(bottom: 10),
                      padding: const EdgeInsets.all(14),
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => QuranReaderScreen(
                              surahName: s['en']!),
                        ),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 44,
                            height: 44,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: AppColors.primaryGreen,
                              borderRadius: BorderRadius.circular(10),
                              border:
                                  Border.all(color: AppColors.glassBorder),
                            ),
                            child: Text(s['no']!,
                                style: const TextStyle(
                                    color: AppColors.accentGold,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13)),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(s['bn']!,
                                    style: const TextStyle(
                                        color: AppColors.lightGold,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600)),
                                Text(s['en']!,
                                    style: const TextStyle(
                                        color: Colors.white54,
                                        fontSize: 10)),
                                Row(
                                  children: [
                                    Text(s['ayahs']!,
                                        style: const TextStyle(
                                            color: Colors.white38,
                                            fontSize: 10)),
                                    const SizedBox(width: 8),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 6, vertical: 2),
                                      decoration: BoxDecoration(
                                        color: AppColors.accentGold
                                            .withOpacity(0.1),
                                        borderRadius:
                                            BorderRadius.circular(4),
                                      ),
                                      child: Text(s['revelation']!,
                                          style: const TextStyle(
                                              color: AppColors.accentGold,
                                              fontSize: 8)),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              Text(s['ar']!,
                                  style: GoogleFonts.amiri(
                                      color: AppColors.accentGold,
                                      fontSize: 18)),
                              const SizedBox(height: 4),
                              const Icon(Icons.bookmark_border_rounded,
                                  color: Colors.white38, size: 16),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
