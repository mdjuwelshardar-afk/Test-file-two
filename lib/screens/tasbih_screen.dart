import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_colors.dart';
import '../widgets/islamic_watermark.dart';
import '../widgets/glass_card.dart';

/// Screen 13 — TASBIH COUNTER with 99 Names & Dhikr List
class TasbihScreen extends StatefulWidget {
  const TasbihScreen({super.key});

  @override
  State<TasbihScreen> createState() => _TasbihScreenState();
}

class _TasbihScreenState extends State<TasbihScreen> {
  int _count = 0;
  final int _target = 33;
  final int _round = 1;
  String _currentDhikr = 'Subhanallah';

  final List<Map<String, String>> _dhikrList = [
    {'name': 'Subhanallah', 'arabic': 'سُبْحَانَ اللَّهِ'},
    {'name': 'Alhamdulillah', 'arabic': 'الْحَمْدُ لِلَّهِ'},
    {'name': 'Allahu Akbar', 'arabic': 'اللَّهُ أَكْبَرُ'},
    {'name': 'La ilaha illallah', 'arabic': 'لَا إِلَٰهَ إِلَّا اللَّهُ'},
    {'name': 'Astaghfirullah', 'arabic': 'أَسْتَغْفِرُ اللَّهَ'},
    {'name': 'Subhanallahi wa bihamdihi', 'arabic': 'سُبْحَانَ اللَّهِ وَبِحَمْدِهِ'},
  ];

  final List<Map<String, String>> _names99 = [
    {'no': '01', 'ar': 'الرَّحْمَٰنُ', 'en': 'Ar-Rahman', 'bn': 'পরম করুণাময়'},
    {'no': '02', 'ar': 'الرَّحِيمُ', 'en': 'Ar-Rahim', 'bn': 'অসীম দয়ালু'},
    {'no': '03', 'ar': 'الْمَلِكُ', 'en': 'Al-Malik', 'bn': 'সার্বভৌম রাজা'},
    {'no': '04', 'ar': 'الْقُدُّوسُ', 'en': 'Al-Quddus', 'bn': 'পবিত্রতম'},
    {'no': '05', 'ar': 'السَّلَامُ', 'en': 'As-Salam', 'bn': 'শান্তিদাতা'},
    {'no': '06', 'ar': 'الْمُؤْمِنُ', 'en': 'Al-Mu\'min', 'bn': 'নিরাপত্তাদাতা'},
    {'no': '07', 'ar': 'الْمُهَيْمِنُ', 'en': 'Al-Muhaymin', 'bn': 'রক্ষাকর্তা'},
    {'no': '08', 'ar': 'الْعَزِيزُ', 'en': 'Al-Aziz', 'bn': 'পরাক্রমশালী'},
    {'no': '09', 'ar': 'الْجَبَّارُ', 'en': 'Al-Jabbar', 'bn': 'মহাপ্রতাপশালী'},
    {'no': '10', 'ar': 'الْمُتَكَبِّرُ', 'en': 'Al-Mutakabbir', 'bn': 'গৌরবান্বিত'},
  ];

  void _increment() {
    setState(() {
      _count++;
    });
  }

  void _saveCount() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$_currentDhikr count $_count saved!'),
        backgroundColor: AppColors.accentGold,
      ),
    );
  }

  void _reset() {
    setState(() {
      _count = 0;
    });
  }

  void _show99Names() {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.primaryDark,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(22)),
      ),
      builder: (ctx) => Container(
        height: MediaQuery.of(context).size.height * 0.75,
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
        child: Column(
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                margin: const EdgeInsets.only(bottom: 14),
                decoration: BoxDecoration(
                  color: AppColors.glassBorderStrong,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
            Text('99 Names of Allah (Asmaul Husna)',
                style: GoogleFonts.poppins(
                    color: AppColors.lightGold,
                    fontSize: 15,
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            TextField(
              style: const TextStyle(color: Colors.white, fontSize: 13),
              decoration: InputDecoration(
                hintText: 'Search a name...',
                hintStyle: const TextStyle(color: Colors.white38, fontSize: 12),
                prefixIcon: const Icon(Icons.search, color: AppColors.accentGold, size: 18),
                fillColor: AppColors.cardBg,
                filled: true,
                contentPadding: const EdgeInsets.symmetric(vertical: 10),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: AppColors.glassBorder),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: AppColors.accentGold),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 14),
            Expanded(
              child: ListView.separated(
                itemCount: _names99.length,
                separatorBuilder: (_, __) => const SizedBox(height: 8),
                itemBuilder: (context, i) {
                  final n = _names99[i];
                  return GlassCard(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      children: [
                        Container(
                          width: 36,
                          height: 36,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: AppColors.primaryGreen,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: AppColors.glassBorder),
                          ),
                          child: Text(n['no']!,
                              style: const TextStyle(color: AppColors.accentGold, fontWeight: FontWeight.bold, fontSize: 12)),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(n['en']!,
                                  style: const TextStyle(color: AppColors.lightGold, fontSize: 12, fontWeight: FontWeight.w600)),
                              Text(n['bn']!,
                                  style: const TextStyle(color: Colors.white60, fontSize: 10)),
                            ],
                          ),
                        ),
                        Text(n['ar']!,
                            style: GoogleFonts.amiri(color: AppColors.accentGold, fontSize: 20)),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

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
          const IslamicWatermark(alignment: Alignment.topRight, size: 280, opacity: 0.06),
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
                    Text('Tasbih Counter',
                        style: GoogleFonts.poppins(
                            color: AppColors.lightGold,
                            fontSize: 17,
                            fontWeight: FontWeight.w600)),
                    const Spacer(),
                    const Icon(Icons.settings_outlined,
                        color: AppColors.accentGold, size: 19),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.fromLTRB(16, 4, 16, 20),
                  child: Column(
                    children: [
                      // Current Dhikr display
                      GlassCard(
                        glow: true,
                        child: Column(
                          children: [
                            Text(_dhikrList.firstWhere((d) => d['name'] == _currentDhikr)['arabic']!,
                                style: GoogleFonts.amiri(
                                    color: AppColors.lightGold,
                                    fontSize: 22,
                                    height: 1.8)),
                            const SizedBox(height: 6),
                            Text(_currentDhikr,
                                style: GoogleFonts.poppins(
                                    color: AppColors.accentGold,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 28),

                      // Large counter
                      Text(
                        '$_count',
                        style: GoogleFonts.poppins(
                          fontSize: 80,
                          fontWeight: FontWeight.bold,
                          color: AppColors.accentGold,
                          shadows: [
                            Shadow(
                              color: AppColors.accentGold.withOpacity(0.4),
                              blurRadius: 30,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Round $_round / Target $_target',
                        style: const TextStyle(
                            color: Colors.white54, fontSize: 11),
                      ),
                      const SizedBox(height: 24),

                      // Tap button
                      GestureDetector(
                        onTap: _increment,
                        child: Container(
                          width: 130,
                          height: 130,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.accentGold,
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.accentGold.withOpacity(0.45),
                                blurRadius: 28,
                                spreadRadius: 6,
                              ),
                            ],
                          ),
                          child: Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(Icons.touch_app_rounded,
                                    color: AppColors.primaryDark, size: 28),
                                const SizedBox(height: 4),
                                Text('TAP',
                                    style: GoogleFonts.poppins(
                                      color: AppColors.primaryDark,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 28),

                      // Save / Reset buttons
                      Row(
                        children: [
                          Expanded(
                            child: OutlinedButton(
                              onPressed: _saveCount,
                              style: OutlinedButton.styleFrom(
                                side: const BorderSide(
                                    color: AppColors.accentGold),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 12),
                              ),
                              child: const Text('Save Count',
                                  style: TextStyle(
                                      color: AppColors.accentGold,
                                      fontSize: 12)),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: OutlinedButton(
                              onPressed: _reset,
                              style: OutlinedButton.styleFrom(
                                side: const BorderSide(
                                    color: AppColors.glassBorderStrong),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 12),
                              ),
                              child: const Text('Reset',
                                  style: TextStyle(
                                      color: Colors.white54, fontSize: 12)),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),

                      // Dhikr list
                      Text('Dhikr List',
                          style: GoogleFonts.poppins(
                              color: AppColors.lightGold,
                              fontSize: 13,
                              fontWeight: FontWeight.bold)),
                      const SizedBox(height: 10),
                      ..._dhikrList.map((d) => GlassCard(
                            margin: const EdgeInsets.only(bottom: 8),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 14, vertical: 12),
                            onTap: () => setState(() {
                              _currentDhikr = d['name']!;
                              _count = 0;
                            }),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(d['name']!,
                                          style: const TextStyle(
                                              color: AppColors.lightGold,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600)),
                                      Text(d['arabic']!,
                                          style: GoogleFonts.amiri(
                                              color: Colors.white54,
                                              fontSize: 13)),
                                    ],
                                  ),
                                ),
                                Text(
                                    'Count ${d['name'] == _currentDhikr ? _count : 0}',
                                    style: const TextStyle(
                                        color: AppColors.accentGold,
                                        fontSize: 11)),
                              ],
                            ),
                          )),
                      const SizedBox(height: 18),

                      // 99 Names card
                      GlassCard(
                        glow: true,
                        onTap: _show99Names,
                        child: Row(
                          children: [
                            Container(
                              width: 46,
                              height: 46,
                              decoration: BoxDecoration(
                                color: AppColors.accentGold.withOpacity(0.12),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Icon(Icons.list_alt_rounded,
                                  color: AppColors.accentGold, size: 22),
                            ),
                            const SizedBox(width: 12),
                            const Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('99 Names of Allah',
                                      style: TextStyle(
                                          color: AppColors.lightGold,
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold)),
                                  Text('Asmaul Husna',
                                      style: TextStyle(
                                          color: Colors.white60,
                                          fontSize: 10)),
                                ],
                              ),
                            ),
                            const Icon(Icons.arrow_forward_ios_rounded,
                                color: AppColors.accentGold, size: 14),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                      Center(
                        child: TextButton(
                          onPressed: _show99Names,
                          child: const Text('View All 99 Names',
                              style: TextStyle(
                                  color: AppColors.accentGold, fontSize: 11)),
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
