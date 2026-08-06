import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_colors.dart';
import '../widgets/islamic_watermark.dart';

/// Screen 03/04 — QURAN READER (Bangla + English toggle mode)
class QuranReaderScreen extends StatefulWidget {
  final String surahName;
  const QuranReaderScreen({super.key, required this.surahName});

  @override
  State<QuranReaderScreen> createState() => _QuranReaderScreenState();
}

class _QuranReaderScreenState extends State<QuranReaderScreen> {
  bool _englishMode = false;
  bool _playing = false;
  int _ayahIndex = 1;

  static const List<Map<String, String>> _ayahs = [
    {
      'ar': 'بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ',
      'bnTranslit': 'বিসমিল্লাহির রহমানির রহিম',
      'bnTrans': 'পরম করুণাময় অসীম দয়ালু আল্লাহর নামে (শুরু করছি)।',
      'enTranslit': 'Bismillahir-rahmanir-rahim',
      'enTrans': 'In the name of Allah, the Most Gracious, the Most Merciful.',
    },
    {
      'ar': 'الْحَمْدُ لِلَّهِ رَبِّ الْعَالَمِينَ',
      'bnTranslit': 'আলহামদু লিল্লাহি রাব্বিল আলামীন',
      'bnTrans': 'সমস্ত প্রশংসা আল্লাহর জন্য, যিনি সকল জগতের প্রতিপালক।',
      'enTranslit': "Alhamdu lillahi rabbil-'alamin",
      'enTrans': 'All praise is due to Allah, Lord of all the worlds.',
    },
    {
      'ar': 'الرَّحْمَٰنِ الرَّحِيمِ',
      'bnTranslit': 'আর-রহমানির রহীম',
      'bnTrans': 'যিনি পরম করুণাময়, অসীম দয়ালু।',
      'enTranslit': 'Ar-rahmanir-rahim',
      'enTrans': 'The Most Gracious, the Most Merciful.',
    },
    {
      'ar': 'مَالِكِ يَوْمِ الدِّينِ',
      'bnTranslit': 'মালিকি ইয়াওমিদ্দীন',
      'bnTrans': 'যিনি বিচার দিবসের মালিক।',
      'enTranslit': 'Maliki yawmid-din',
      'enTrans': 'Master of the Day of Judgment.',
    },
    {
      'ar': 'إِيَّاكَ نَعْبُدُ وَإِيَّاكَ نَسْتَعِينُ',
      'bnTranslit': "ইয়্যাকা না'বুদু ওয়া ইয়্যাকা নাস্তাঈন",
      'bnTrans': 'আমরা শুধু তোমারই ইবাদত করি এবং শুধু তোমার কাছেই সাহায্য প্রার্থনা করি।',
      'enTranslit': "Iyyaka na'budu wa-iyyaka nasta'in",
      'enTrans': 'It is You we worship and You we ask for help.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final ayah = _ayahs[_ayahIndex - 1];

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
          const IslamicWatermark(alignment: Alignment.topRight, size: 240),
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
                    Expanded(
                      child: Text(
                        _englishMode ? 'QURAN READER (ENG)' : 'QURAN READER',
                        style: GoogleFonts.poppins(
                            color: AppColors.lightGold,
                            fontSize: 15,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 6),
                      decoration: BoxDecoration(
                        color: AppColors.cardBg,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: AppColors.accentGold),
                      ),
                      child: InkWell(
                        onTap: () =>
                            setState(() => _englishMode = !_englishMode),
                        child: Text(
                          _englishMode ? 'বাংলা' : 'EN',
                          style: const TextStyle(
                              color: AppColors.accentGold, fontSize: 11),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Icon(Icons.settings_outlined,
                        color: AppColors.accentGold, size: 18),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(16, 4, 16, 20),
                  child: Column(
                    children: [
                      // Surah info card
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: AppColors.cardBg,
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(color: AppColors.glassBorder),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  Text(widget.surahName,
                                      style: GoogleFonts.poppins(
                                          color: AppColors.lightGold,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold)),
                                  const Text('The Opening',
                                      style: TextStyle(
                                          color: Colors.white54,
                                          fontSize: 10)),
                                  const Text('7 Ayahs • Makki',
                                      style: TextStyle(
                                          color: Colors.white38,
                                          fontSize: 10)),
                                ],
                              ),
                            ),
                            Text('الْفَاتِحَةِ',
                                style: GoogleFonts.amiri(
                                    color: AppColors.accentGold,
                                    fontSize: 24)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Ayah card with gold glow border
                      _ornateAyahCard(ayah),
                      const SizedBox(height: 16),

                      // Audio player
                      // Audio player
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                        decoration: BoxDecoration(
                          color: AppColors.cardBg,
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(color: AppColors.glassBorder),
                        ),
                        child: Column(
                          children: [
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
                            Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                              children: [
                                const Icon(Icons.shuffle_rounded,
                                    color: Colors.white54, size: 18),
                                const Icon(Icons.skip_previous_rounded,
                                    color: AppColors.lightGold, size: 24),
                                GestureDetector(
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
                                      size: 24,
                                    ),
                                  ),
                                ),
                                const Icon(Icons.skip_next_rounded,
                                    color: AppColors.lightGold, size: 24),
                                const Icon(Icons.repeat_rounded,
                                    color: Colors.white54, size: 18),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 18),

                      // Action buttons
                      Row(
                        children: [
                          Expanded(
                            child: OutlinedButton.icon(
                              onPressed: () {},
                              icon: const Icon(Icons.bookmark_border,
                                  color: AppColors.lightGold, size: 16),
                              label: const Text('Bookmark',
                                  style: TextStyle(
                                      color: AppColors.lightGold,
                                      fontSize: 11)),
                              style: OutlinedButton.styleFrom(
                                side: const BorderSide(
                                    color: AppColors.glassBorder),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: OutlinedButton.icon(
                              onPressed: () {},
                              icon: const Icon(Icons.copy_rounded,
                                  color: AppColors.lightGold, size: 16),
                              label: const Text('Copy',
                                  style: TextStyle(
                                      color: AppColors.lightGold,
                                      fontSize: 11)),
                              style: OutlinedButton.styleFrom(
                                side: const BorderSide(
                                    color: AppColors.glassBorder),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: OutlinedButton.icon(
                              onPressed: () {},
                              icon: const Icon(Icons.share_outlined,
                                  color: AppColors.lightGold, size: 16),
                              label: const Text('Share',
                                  style: TextStyle(
                                      color: AppColors.lightGold,
                                      fontSize: 11)),
                              style: OutlinedButton.styleFrom(
                                side: const BorderSide(
                                    color: AppColors.glassBorder),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 14),

                      // Previous / Next Ayah
                      Row(
                        children: [
                          Expanded(
                            child: OutlinedButton(
                              onPressed: _ayahIndex > 1
                                  ? () =>
                                      setState(() => _ayahIndex--)
                                  : null,
                              style: OutlinedButton.styleFrom(
                                side: const BorderSide(
                                    color: AppColors.glassBorderStrong),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 12),
                              ),
                              child: const Text('← Previous Ayah',
                                  style: TextStyle(
                                      color: AppColors.lightGold,
                                      fontSize: 12)),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: _ayahIndex < _ayahs.length
                                  ? () =>
                                      setState(() => _ayahIndex++)
                                  : null,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.accentGold,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 12),
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(8)),
                              ),
                              child: const Text('Next Ayah →',
                                  style: TextStyle(
                                      color: AppColors.primaryDark,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12)),
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

  Widget _ornateAyahCard(Map<String, String> ayah) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.accentGold, width: 1.4),
        boxShadow: [
          BoxShadow(
            color: AppColors.accentGold.withOpacity(0.18),
            blurRadius: 18,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        children: [
          // Ayah number badge
          Container(
            width: 34,
            height: 34,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                  color: AppColors.accentGold, width: 1.2),
            ),
            child: Text('$_ayahIndex',
                style: const TextStyle(
                    color: AppColors.accentGold,
                    fontWeight: FontWeight.bold,
                    fontSize: 13)),
          ),
          const SizedBox(height: 20),

          // Arabic text
          Text(
            ayah['ar']!,
            textAlign: TextAlign.center,
            style: GoogleFonts.amiri(
                color: AppColors.lightGold,
                fontSize: 26,
                height: 1.9),
          ),
          const SizedBox(height: 18),

          // Transliteration
          Text(
            _englishMode ? ayah['enTranslit']! : ayah['bnTranslit']!,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              color: AppColors.accentGold,
              fontSize: 13,
              fontStyle: FontStyle.italic,
            ),
          ),
          const SizedBox(height: 12),

          // Translation
          Text(
            _englishMode ? ayah['enTrans']! : ayah['bnTrans']!,
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Colors.white70, fontSize: 12, height: 1.5),
          ),
        ],
      ),
    );
  }
}
