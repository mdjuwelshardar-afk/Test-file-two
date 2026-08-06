import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_colors.dart';
import '../widgets/glass_card.dart';
import '../widgets/islamic_watermark.dart';

/// Screen 05 — HADITH MODULE
class HadithScreen extends StatefulWidget {
  const HadithScreen({super.key});

  @override
  State<HadithScreen> createState() => _HadithScreenState();
}

class _HadithScreenState extends State<HadithScreen> {
  String _collection = 'Sahih Bukhari';
  final List<String> _collections = [
    'Sahih Bukhari',
    'Sahih Muslim',
    'Sunan Abu Dawood',
    'Jami at-Tirmidhi',
    'Sunan an-Nasa\'i',
    'Sunan Ibn Majah',
  ];

  static const List<Map<String, String>> _hadiths = [
    {
      'no': '1',
      'ar': 'عَنْ عُمَرَ بْنَ الْخَطَّابِ رَضِيَ اللَّهُ عَنْهُ قَالَ: سَمِعْتُ رَسُولَ اللَّهِ صَلَّى اللَّهُ عَلَيْهِ وَسَلَّمَ يَقُولُ: إِنَّمَا الْأَعْمَالُ بِالنِّيَّاتِ، وَإِنَّمَا لِكُلِّ امْرِئٍ مَا نَوَى',
      'bn': 'উমর ইবনুল খাত্তাব (রা.) থেকে বর্ণিত, তিনি বলেন: আমি রাসূলুল্লাহ (সা.)-কে বলতে শুনেছি: সকল কাজ নিয়তের উপর নির্ভরশীল। আর প্রত্যেক ব্যক্তি তাই পাবে যা সে নিয়ত করেছে।',
      'source': 'সহীহ বুখারী, হাদিস নং: ১, কিতাবুল ঈমান',
    },
    {
      'no': '2',
      'ar': 'عَنْ أَبِي هُرَيْرَةَ رَضِيَ اللَّهُ عَنْهُ قَالَ: قَالَ رَسُولُ اللَّهِ صَلَّى اللَّهُ عَلَيْهِ وَسَلَّمَ: الْمُؤْمِنُ الْقَوِيُّ خَيْرٌ وَأَحَبُّ إِلَى اللَّهِ مِنَ الْمُؤْمِنِ الضَّعِيفِ',
      'bn': 'আবু হুরাইরা (রা.) থেকে বর্ণিত, রাসূলুল্লাহ (সা.) বলেছেন: শক্তিশালী মুমিন দুর্বল মুমিনের চেয়ে আল্লাহর কাছে অধিক প্রিয় ও উত্তম।',
      'source': 'সহীহ মুসলিম, হাদিস নং: ২৬৬৪',
    },
    {
      'no': '3',
      'ar': 'عَنْ أَبِي هُرَيْرَةَ رَضِيَ اللَّهُ عَنْهُ عَنِ النَّبِيِّ صَلَّى اللَّهُ عَلَيْهِ وَسَلَّمَ قَالَ: لَا يُلْدَغُ الْمُؤْمِنُ مِنْ جُحْرٍ وَاحِدٍ مَرَّتَيْنِ',
      'bn': 'আবু হুরাইরা (রা.) থেকে বর্ণিত, নবী (সা.) বলেছেন: মুমিন এক গর্তে দুইবার দংশিত হয় না।',
      'source': 'সহীহ বুখারী, হাদিস নং: ৬১৩৩',
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
                    Text('Hadith Collection',
                        style: GoogleFonts.poppins(
                            color: AppColors.lightGold,
                            fontSize: 16,
                            fontWeight: FontWeight.w600)),
                    const Spacer(),
                    const Icon(Icons.search_rounded,
                        color: AppColors.accentGold, size: 19),
                    const SizedBox(width: 12),
                    const Icon(Icons.filter_list_rounded,
                        color: AppColors.accentGold, size: 19),
                  ],
                ),
              ),
              // Collection selector
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  decoration: BoxDecoration(
                    color: AppColors.cardBg,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColors.accentGold, width: 0.8),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: _collection,
                      isExpanded: true,
                      dropdownColor: AppColors.primaryDark,
                      icon: const Icon(Icons.keyboard_arrow_down_rounded,
                          color: AppColors.accentGold),
                      style: const TextStyle(
                          color: AppColors.lightGold,
                          fontSize: 13,
                          fontWeight: FontWeight.w600),
                      items: _collections
                          .map((c) => DropdownMenuItem(
                              value: c,
                              child: Text(c,
                                  style: const TextStyle(fontSize: 13))))
                          .toList(),
                      onChanged: (v) => setState(() => _collection = v!),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
                  itemCount: _hadiths.length,
                  itemBuilder: (context, i) {
                    final h = _hadiths[i];
                    return GlassCard(
                      margin: const EdgeInsets.only(bottom: 12),
                      padding: const EdgeInsets.all(16),
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
                                      color: AppColors.accentGold,
                                      width: 1.2),
                                ),
                                child: Text(h['no']!,
                                    style: const TextStyle(
                                        color: AppColors.accentGold,
                                        fontSize: 11,
                                        fontWeight: FontWeight.bold)),
                              ),
                              const SizedBox(width: 8),
                              Text(_collection,
                                  style: const TextStyle(
                                      color: AppColors.lightGold,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600)),
                              const Spacer(),
                              Text('হাদিস নং: ${h['no']}',
                                  style: const TextStyle(
                                      color: Colors.white38, fontSize: 10)),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text(h['ar']!,
                                textAlign: TextAlign.right,
                                style: GoogleFonts.amiri(
                                    color: AppColors.lightGold,
                                    fontSize: 15,
                                    height: 1.9)),
                          ),
                          const SizedBox(height: 10),
                          Text(h['bn']!,
                              style: const TextStyle(
                                  color: Colors.white70,
                                  fontSize: 12,
                                  height: 1.6)),
                          const SizedBox(height: 8),
                          Text(h['source']!,
                              style: const TextStyle(
                                  color: AppColors.accentGold, fontSize: 10)),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              const Icon(Icons.bookmark_border_rounded,
                                  color: Colors.white54, size: 17),
                              const SizedBox(width: 16),
                              const Icon(Icons.search_rounded,
                                  color: Colors.white54, size: 17),
                              const SizedBox(width: 16),
                              const Icon(Icons.share_outlined,
                                  color: Colors.white54, size: 17),
                              const Spacer(),
                              if (i == 0)
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 14, vertical: 8),
                                  decoration: BoxDecoration(
                                    color: AppColors.accentGold,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: const Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(Icons.casino_rounded,
                                          color: AppColors.primaryDark,
                                          size: 14),
                                      SizedBox(width: 6),
                                      Text('Random Hadith',
                                          style: TextStyle(
                                              color: AppColors.primaryDark,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 10)),
                                    ],
                                  ),
                                ),
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
