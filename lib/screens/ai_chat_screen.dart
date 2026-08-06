import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_colors.dart';
import '../widgets/glass_card.dart';
import '../widgets/islamic_watermark.dart';

/// Screen 16 — AI CHAT / ISLAMIC AI ASSISTANT
class AiChatScreen extends StatefulWidget {
  const AiChatScreen({super.key});

  @override
  State<AiChatScreen> createState() => _AiChatScreenState();
}

class _AiChatScreenState extends State<AiChatScreen> {
  final TextEditingController _controller = TextEditingController();
  // ignore: unused_field
  final bool _hasResponse = true;

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
          const IslamicWatermark(alignment: Alignment.topRight, size: 240, opacity: 0.05),
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
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('MINARAH AI Assistant',
                              style: TextStyle(
                                  color: AppColors.lightGold,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600)),
                          Text('Islamic Knowledge 24/7',
                              style: TextStyle(
                                  color: Colors.white54, fontSize: 9)),
                        ],
                      ),
                    ),
                    const Icon(Icons.more_vert_rounded,
                        color: AppColors.accentGold, size: 20),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(16, 6, 16, 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Greeting
                      GlassCard(
                        padding: const EdgeInsets.all(12),
                        child: Row(
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: AppColors.accentGold.withOpacity(0.15),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Icon(Icons.smart_toy_rounded,
                                  color: AppColors.accentGold, size: 20),
                            ),
                            const SizedBox(width: 10),
                            const Text(
                              'Assalamu Alaikum. How can I\nhelp you today?',
                              style: TextStyle(
                                  color: Colors.white70, fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),

                      // Query bubble
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          constraints: BoxConstraints(
                              maxWidth:
                                  MediaQuery.of(context).size.width * 0.7),
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: AppColors.primaryGreen,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Text(
                            'Q: Show me the Ayah about patience.',
                            style: TextStyle(
                                color: AppColors.lightGold, fontSize: 11),
                          ),
                        ),
                      ),
                      const SizedBox(height: 14),

                      // Answer card
                      GlassCard(
                        glow: true,
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 28,
                                  height: 28,
                                  decoration: BoxDecoration(
                                    color: AppColors.accentGold
                                        .withOpacity(0.15),
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(Icons.smart_toy_rounded,
                                      color: AppColors.accentGold, size: 15),
                                ),
                                const SizedBox(width: 8),
                                const Text('MINARAH AI',
                                    style: TextStyle(
                                        color: AppColors.lightGold,
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold)),
                                const Spacer(),
                                const Icon(Icons.bookmark_border_rounded,
                                    color: Colors.white54, size: 16),
                              ],
                            ),
                            const SizedBox(height: 14),

                            // Brief Answer
                            _answerSection('BRIEF ANSWER (সংক্ষিপ্ত উত্তর)',
                                'A concise, impactful summary of the concept of patience. Patience (Sabr) is one of the most emphasized virtues in the Quran.'),
                            const SizedBox(height: 12),

                            // Detailed
                            _answerSection('DETAILED EXPLANATION (বিস্তারিত ব্যাখ্যা)',
                                'The concept of patience is central in Islam. Patience consolidates the reward in the afterlife and is mentioned over 90 times in the Quran. Allah promises the patient ones unimaginable reward without measure.'),
                            const SizedBox(height: 12),

                            // Quran Reference
                            Text('REFERENCE FROM QURAN (কুরআন রেফারেন্স)',
                                style: GoogleFonts.poppins(
                                    color: AppColors.accentGold,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold)),
                            const SizedBox(height: 6),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                'إِنَّ الَّذِينَ قَالُوا رَبُّنَا اللَّهُ ثُمَّ اسْتَقَامُوا تَتَنَزَّلُ عَلَيْهِمُ الْمَلَائِكَةُ',
                                textAlign: TextAlign.right,
                                style: GoogleFonts.amiri(
                                    color: AppColors.lightGold,
                                    fontSize: 17,
                                    height: 1.8),
                              ),
                            ),
                            const SizedBox(height: 4),
                            const Text('Surah Al-Baqarah 153. (2:153)',
                                style: TextStyle(
                                    color: AppColors.accentGold,
                                    fontSize: 10)),
                            const SizedBox(height: 12),

                            // Hadith Reference
                            Text('REFERENCE FROM HADITH (হাদিস থেকে)',
                                style: GoogleFonts.poppins(
                                    color: AppColors.accentGold,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold)),
                            const SizedBox(height: 4),
                            const Text(
                                'The Prophet (SAW) said: "No one has been given anything better than patience."',
                                style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 11,
                                    height: 1.5)),
                            const Text('Sahih Bukhari, Book 24, Number 1209',
                                style: TextStyle(
                                    color: Colors.white54, fontSize: 9)),
                            const SizedBox(height: 12),

                            // Source
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: AppColors.primaryDark,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: AppColors.glassBorder),
                              ),
                              child: const Text(
                                'SOURCE: Verified Islamic APIs (Al-Quran Cloud, Fawaz Ahmed Hadith)\nAyah: 123353',
                                style: TextStyle(
                                    color: Colors.white54, fontSize: 9),
                              ),
                            ),
                            const SizedBox(height: 8),

                            // Advisory
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: AppColors.accentGold.withOpacity(0.08),
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                    color: AppColors.accentGold
                                        .withOpacity(0.3)),
                              ),
                              child: const Row(
                                children: [
                                  Icon(Icons.info_outline_rounded,
                                      color: AppColors.accentGold, size: 14),
                                  SizedBox(width: 6),
                                  Expanded(
                                    child: Text(
                                      'ADVISORY: For complex issues, consult an Islamic scholar.',
                                      style: TextStyle(
                                          color: Colors.white70, fontSize: 9),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 14),

                      // Smart Follow-Up Questions
                      Text('SMART FOLLOW-UP QUESTIONS',
                          style: GoogleFonts.poppins(
                              color: AppColors.accentGold,
                              fontSize: 10,
                              fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8),
                      Wrap(
                        spacing: 6,
                        runSpacing: 6,
                        children: [
                          _chip('১. কিয়ামতে ধৈর্যের পুরস্কার কী?'),
                          _chip('২. কীভাবে ধৈর্য বাড়াতে পারি?'),
                          _chip('৩. প্রাসঙ্গিক দোয়া'),
                        ],
                      ),
                      const SizedBox(height: 14),

                      // Knowledge base search
                      Text('SEARCH ISLAMIC KNOWLEDGE BASE',
                          style: GoogleFonts.poppins(
                              color: AppColors.accentGold,
                              fontSize: 10,
                              fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8),
                      GridView.count(
                        crossAxisCount: 3,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                        childAspectRatio: 1.2,
                        children: [
                          _searchTile('FAQ\nSearch', Icons.help_outline_rounded),
                          _searchTile('Quran\nSearch', Icons.menu_book_rounded),
                          _searchTile('Hadith\nSearch', Icons.auto_stories_rounded),
                          _searchTile('Dua\nSearch', Icons.volunteer_activism_rounded),
                          _searchTile('Library\nSearch', Icons.local_library_rounded),
                          _searchTile('99 Names', Icons.format_list_numbered_rounded),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              // Input
              Container(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
                decoration: BoxDecoration(
                  color: AppColors.primaryDark,
                  border: Border(
                    top: BorderSide(
                        color: AppColors.glassBorder.withOpacity(0.3)),
                  ),
                ),
                child: TextField(
                  controller: _controller,
                  style: const TextStyle(color: Colors.white, fontSize: 13),
                  decoration: InputDecoration(
                    hintText: 'Write your question...',
                    hintStyle:
                        const TextStyle(color: Colors.white38, fontSize: 12),
                    filled: true,
                    fillColor: AppColors.primaryGreen,
                    suffixIcon: const Padding(
                      padding: EdgeInsets.all(8),
                      child: Icon(Icons.send_rounded,
                          color: AppColors.accentGold, size: 20),
                    ),
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: AppColors.glassBorder),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: AppColors.accentGold),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _answerSection(String title, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: GoogleFonts.poppins(
                color: AppColors.accentGold,
                fontSize: 10,
                fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        Text(content,
            style: const TextStyle(
                color: Colors.white70, fontSize: 11, height: 1.5)),
      ],
    );
  }

  Widget _chip(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.primaryGreen,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.glassBorder),
      ),
      child: Text(label,
          style: GoogleFonts.notoSansBengali(
              fontSize: 10, color: Colors.white70)),
    );
  }

  Widget _searchTile(String label, IconData icon) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cardBg,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.glassBorder),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: AppColors.accentGold, size: 18),
          const SizedBox(height: 4),
          Text(label,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white70, fontSize: 9)),
        ],
      ),
    );
  }
}
