import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_colors.dart';
import '../widgets/glass_card.dart';
import 'ai_chat_screen.dart';
import 'quran_reader_screen.dart';
import 'zakat_screen.dart';
import 'tasbih_screen.dart';
import 'qibla_screen.dart';
import 'calendar_screen.dart';
import 'radio_screen.dart';
import 'dua_screen.dart';
import 'hadith_screen.dart';

/// Screen 01 — HOME DASHBOARD
/// Pixel-perfect replication of reference "Screen 01 HOME DASHBOARD"
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
      child: Column(
        children: [
          _topBar(context),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.fromLTRB(16, 10, 16, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _heroBanner(),
                  const SizedBox(height: 12),
                  _dateInfoRow(),
                  const SizedBox(height: 14),
                  _nextPrayerCard(),
                  const SizedBox(height: 12),
                  _prayerGrid(),
                  const SizedBox(height: 16),
                  _aiChatCard(context),
                  const SizedBox(height: 22),
                  _quickAccessSection(context),
                  const SizedBox(height: 22),
                  _sectionTitle("Today's Ayah"),
                  const SizedBox(height: 10),
                  _todaysAyahCard(),
                  const SizedBox(height: 18),
                  _sectionTitle("Today's Hadith"),
                  const SizedBox(height: 10),
                  _todaysHadithCard(),
                  const SizedBox(height: 18),
                  _sectionTitle('Featured Posts'),
                  const SizedBox(height: 10),
                  _featuredPosts(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _topBar(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 8, 10, 4),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: AppColors.glassBorder.withOpacity(0.25),
            width: 0.5,
          ),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: AppColors.cardBg,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.glassBorder),
            ),
            child: const Icon(Icons.menu_rounded,
                color: AppColors.lightGold, size: 19),
          ),
          const SizedBox(width: 10),
          Text(
            'MINARAH - Islamic Hub BD',
            style: GoogleFonts.poppins(
              color: AppColors.lightGold,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Spacer(),
          Container(
            width: 34,
            height: 34,
            decoration: BoxDecoration(
              color: AppColors.cardBg,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.glassBorder),
            ),
            child: const Icon(Icons.notifications_none_rounded,
                color: AppColors.accentGold, size: 18),
          ),
          const SizedBox(width: 8),
          Container(
            width: 34,
            height: 34,
            decoration: BoxDecoration(
              color: AppColors.cardBg,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.glassBorder),
            ),
            child: const Icon(Icons.settings_outlined,
                color: AppColors.accentGold, size: 18),
          ),
        ],
      ),
    );
  }

  Widget _heroBanner() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.primaryGreen.withOpacity(0.9),
            AppColors.darkSurface,
          ],
        ),
        border: Border.all(color: AppColors.glassBorder, width: 0.8),
        boxShadow: [
          BoxShadow(
            color: AppColors.accentGold.withOpacity(0.08),
            blurRadius: 20,
          ),
        ],
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Assalamu Alaikum',
                style: GoogleFonts.poppins(
                  color: AppColors.lightGold,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'May Allah bless you and\nyour family',
                style: GoogleFonts.poppins(
                  color: Colors.white70,
                  fontSize: 12,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 32),
            ],
          ),
          Positioned(
            right: -8,
            bottom: -8,
            child: Opacity(
              opacity: 0.25,
              child: Image.asset(
                AppColors.mosqueSilhouette,
                width: 120,
                height: 60,
                fit: BoxFit.contain,
                errorBuilder: (_, __, ___) => Icon(
                  Icons.mosque_rounded,
                  color: AppColors.accentGold.withOpacity(0.35),
                  size: 46,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _dateInfoRow() {
    return Row(
      children: [
        Expanded(
          child: GlassCard(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: Row(
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: AppColors.accentGold.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.brightness_2_rounded,
                      color: AppColors.accentGold, size: 16),
                ),
                const SizedBox(width: 8),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('23 Shawwal 1445',
                          style: TextStyle(
                              color: AppColors.lightGold,
                              fontSize: 11,
                              fontWeight: FontWeight.w600)),
                      Text('Thursday',
                          style: TextStyle(color: Colors.white60, fontSize: 10)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: GlassCard(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: Row(
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: AppColors.accentGold.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.location_on_outlined,
                      color: AppColors.accentGold, size: 16),
                ),
                const SizedBox(width: 8),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('02 May 2024',
                          style: TextStyle(
                              color: AppColors.lightGold,
                              fontSize: 11,
                              fontWeight: FontWeight.w600)),
                      Text('Dhaka, Bangladesh',
                          style: TextStyle(color: Colors.white60, fontSize: 10)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _nextPrayerCard() {
    return GlassCard(
      glow: true,
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Next Prayer',
                    style: TextStyle(color: Colors.white70, fontSize: 11)),
                SizedBox(height: 4),
                Text('Dhuhr  12:08 PM',
                    style: TextStyle(
                        color: AppColors.lightGold,
                        fontSize: 17,
                        fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            decoration: BoxDecoration(
              color: AppColors.accentGold.withOpacity(0.12),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.accentGold, width: 0.8),
            ),
            child: Column(
              children: [
                Text('02:16:34',
                    style: GoogleFonts.poppins(
                        color: AppColors.accentGold,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
                const SizedBox(height: 2),
                const Text('Remaining',
                    style: TextStyle(color: Colors.white60, fontSize: 9)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _prayerGrid() {
    return Row(
      children: _prayerTimes.map((p) {
        final bool active = p['name'] == 'Dhuhr';
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
                color: active ? AppColors.accentGold : AppColors.glassBorder,
                width: active ? 1 : 0.8,
              ),
              boxShadow: active
                  ? [
                      BoxShadow(
                        color: AppColors.accentGold.withOpacity(0.12),
                        blurRadius: 10,
                      ),
                    ]
                  : null,
            ),
            child: Column(
              children: [
                Text(p['icon']!, style: const TextStyle(fontSize: 15)),
                const SizedBox(height: 5),
                Text(
                  p['name']!,
                  style: TextStyle(
                    color: active ? AppColors.accentGold : Colors.white70,
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  p['time']!,
                  style: TextStyle(
                    color: active ? AppColors.lightGold : Colors.white60,
                    fontSize: 11,
                    fontWeight: active ? FontWeight.w600 : FontWeight.w400,
                  ),
                ),
                Text(
                  p['ampm']!,
                  style: const TextStyle(color: Colors.white38, fontSize: 8),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _aiChatCard(BuildContext context) {
    return GlassCard(
      glow: true,
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (_) => const AiChatScreen())),
      child: Row(
        children: [
          Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              color: AppColors.accentGold.withOpacity(0.15),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.smart_toy_rounded,
                color: AppColors.accentGold, size: 22),
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('MINARAH AI ASSISTANT',
                    style: TextStyle(
                        color: AppColors.lightGold,
                        fontSize: 12,
                        fontWeight: FontWeight.bold)),
                SizedBox(height: 3),
                Text(
                    'Ask your questions on Quran, Hadith,\nand Islamic knowledge. 24/7.',
                    style: TextStyle(
                        color: Colors.white60,
                        fontSize: 10,
                        height: 1.3)),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
            decoration: BoxDecoration(
              color: AppColors.accentGold,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Text('START CHAT',
                style: TextStyle(
                    color: AppColors.primaryDark,
                    fontSize: 9,
                    fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  Widget _quickAccessSection(BuildContext context) {
    final items = [
      ('Quran', Icons.menu_book_rounded, () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => const QuranReaderScreen(
                  surahName: 'Surah Al-Fatihah')))),
      ('Hadith', Icons.auto_stories_rounded, () => Navigator.push(
          context, MaterialPageRoute(builder: (_) => const HadithScreen()))),
      ('Dua', Icons.volunteer_activism_rounded, () => Navigator.push(
          context, MaterialPageRoute(builder: (_) => const DuaScreen()))),
      ('Tasbih', Icons.fingerprint_rounded, () => Navigator.push(
          context, MaterialPageRoute(builder: (_) => const TasbihScreen()))),
      ('Qibla', Icons.explore_rounded, () => Navigator.push(
          context, MaterialPageRoute(builder: (_) => const QiblaScreen()))),
      ('Calendar', Icons.calendar_month_rounded, () => Navigator.push(
          context, MaterialPageRoute(builder: (_) => const CalendarScreen()))),
      ('Zakat', Icons.savings_rounded, () => Navigator.push(
          context, MaterialPageRoute(builder: (_) => const ZakatScreen()))),
      ('Radio', Icons.radio_rounded, () => Navigator.push(
          context, MaterialPageRoute(builder: (_) => const RadioScreen()))),
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _sectionTitle('Quick Access'),
            const Text('View All',
                style:
                    TextStyle(color: AppColors.accentGold, fontSize: 10)),
          ],
        ),
        const SizedBox(height: 10),
        GridView.count(
          crossAxisCount: 4,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisSpacing: 10,
          mainAxisSpacing: 12,
          childAspectRatio: 0.82,
          children: items
              .map((it) => InkWell(
                    onTap: it.$3,
                    borderRadius: BorderRadius.circular(14),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: AppColors.cardBg,
                            borderRadius: BorderRadius.circular(14),
                            border:
                                Border.all(color: AppColors.glassBorder),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.accentGold
                                    .withOpacity(0.06),
                                blurRadius: 8,
                              ),
                            ],
                          ),
                          child: Icon(it.$2,
                              color: AppColors.accentGold, size: 21),
                        ),
                        const SizedBox(height: 6),
                        Text(it.$1,
                            style: const TextStyle(
                                color: Colors.white70, fontSize: 10)),
                      ],
                    ),
                  ))
              .toList(),
        ),
      ],
    );
  }

  Widget _sectionTitle(String text) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        color: AppColors.lightGold,
        fontSize: 13,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _todaysAyahCard() {
    return GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              'الَّذِينَ يُؤْمِنُونَ بِالْغَيْبِ وَيُقِيمُونَ الصَّلَاةَ وَمِمَّا رَزَقْنَاهُمْ يُنفِقُونَ',
              textAlign: TextAlign.right,
              style: GoogleFonts.amiri(
                color: AppColors.accentGold,
                fontSize: 18,
                height: 1.9,
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'যারা অদৃশ্যে বিশ্বাস করে, নামাজ প্রতিষ্ঠা করে\nএবং আমি তাদের যে রিজিক দিয়েছি তা থেকে ব্যয় করে',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 11,
              height: 1.6,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Surah Al-Baqarah, Ayah 3',
            style: TextStyle(color: AppColors.accentGold, fontSize: 10),
          ),
        ],
      ),
    );
  }

  Widget _todaysHadithCard() {
    return GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.accentGold),
                ),
                child: const Center(
                  child: Icon(Icons.auto_stories_rounded,
                      color: AppColors.accentGold, size: 12),
                ),
              ),
              const SizedBox(width: 8),
              const Text('Sahih Bukhari',
                  style: TextStyle(
                      color: AppColors.lightGold,
                      fontSize: 11,
                      fontWeight: FontWeight.w600)),
            ],
          ),
          const SizedBox(height: 10),
          const Text(
            '"Actions are judged by intentions, and every person will get the reward according to what he has intended."',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 12,
              fontStyle: FontStyle.italic,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 8),
          const Text('— Sahih Bukhari, Hadith 1',
              style: TextStyle(color: AppColors.accentGold, fontSize: 10)),
        ],
      ),
    );
  }

  Widget _featuredPosts() {
    final posts = [
      ('The Power of Dua', Icons.front_hand_rounded),
      ('Zakat Calculation\nMade Easy', Icons.calculate_rounded),
      ('The Beauty of\nRamadan', Icons.nights_stay_rounded),
    ];
    return SizedBox(
      height: 110,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: posts.length,
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemBuilder: (context, i) {
          return Container(
            width: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: AppColors.glassBorder, width: 0.8),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppColors.primaryGreen.withOpacity(0.8),
                  AppColors.darkSurface,
                ],
              ),
            ),
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 34,
                  height: 34,
                  decoration: BoxDecoration(
                    color: AppColors.accentGold.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(posts[i].$2,
                      color: AppColors.accentGold, size: 18),
                ),
                const Spacer(),
                Text(
                  posts[i].$1,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: AppColors.lightGold,
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    height: 1.3,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
