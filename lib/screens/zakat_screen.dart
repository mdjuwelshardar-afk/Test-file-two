import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_colors.dart';
import '../widgets/glass_card.dart';
import '../widgets/islamic_watermark.dart';

/// Screen 09 — ZAKAT CALCULATOR with Gold/Silver Unit Popups
class ZakatScreen extends StatefulWidget {
  const ZakatScreen({super.key});

  @override
  State<ZakatScreen> createState() => _ZakatScreenState();
}

class _ZakatScreenState extends State<ZakatScreen> {
  String _goldUnit = 'Bhori';
  String _silverUnit = 'Tola';

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
                    Text('Zakat Calculator',
                        style: GoogleFonts.poppins(
                            color: AppColors.lightGold,
                            fontSize: 16,
                            fontWeight: FontWeight.w600)),
                    const Spacer(),
                    const Icon(Icons.refresh_rounded,
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
                      // Zakat Inputs
                      Text('Zakat Inputs',
                          style: GoogleFonts.poppins(
                              color: AppColors.lightGold,
                              fontSize: 14,
                              fontWeight: FontWeight.bold)),
                      const SizedBox(height: 12),

                      // Gold Input
                      _unitInputRow('Gold', '10 bhori', _goldUnit, Icons.diamond_rounded, () {
                        _showUnitPopup('Gold', ['Gram', 'Bhori', 'Ana', 'Rati', 'Tola'],
                            (unit) => setState(() => _goldUnit = unit));
                      }),
                      // Silver Input
                      _unitInputRow('Silver', '20 tola', _silverUnit, Icons.brightness_3_rounded, () {
                        _showUnitPopup('Silver', ['Gram', 'Bhori', 'Ana', 'Tola'],
                            (unit) => setState(() => _silverUnit = unit));
                      }),
                      // Regular inputs
                      _regularInput('Cash', '৳ 250,000', Icons.payments_outlined),
                      _regularInput('Business', '৳ 150,000', Icons.business_center_outlined),
                      _regularInput('Investment', '৳ 80,000', Icons.show_chart_rounded),
                      _regularInput('Debt (Deductible)', '৳ 20,000', Icons.cancel_outlined),

                      const SizedBox(height: 20),

                      // Calculate button
                      SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                                colors: AppColors.goldButtonGradient),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [AppColors.goldGlowButton],
                          ),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(10),
                              onTap: () {},
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.calculate_rounded,
                                      color: AppColors.primaryDark, size: 18),
                                  SizedBox(width: 8),
                                  Text('Calculate Zakat',
                                      style: TextStyle(
                                          color: AppColors.primaryDark,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14)),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 18),

                      // Result Card
                      GlassCard(
                        glow: true,
                        padding: const EdgeInsets.all(18),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Total Assets: ৳ 500,000',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500)),
                            const SizedBox(height: 8),
                            Text('Zakat Payable (2.5%): ৳ 12,500',
                                style: GoogleFonts.poppins(
                                    color: AppColors.accentGold,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold)),
                            const SizedBox(height: 8),
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color:
                                    AppColors.success.withOpacity(0.12),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: const Row(
                                children: [
                                  Icon(Icons.check_circle_outline_rounded,
                                      color: AppColors.success, size: 16),
                                  SizedBox(width: 8),
                                  Text('You are eligible to pay Zakat.',
                                      style: TextStyle(
                                          color: AppColors.success,
                                          fontSize: 11)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 22),

                      // FAQ
                      Text('Zakat Rules & FAQ',
                          style: GoogleFonts.poppins(
                              color: AppColors.lightGold,
                              fontSize: 13,
                              fontWeight: FontWeight.bold)),
                      const SizedBox(height: 10),
                      _faqItem(
                        'Who is eligible to pay Zakat?',
                        'You are eligible if your total wealth meets or exceeds the Nisab threshold for an entire lunar year.',
                      ),
                      _faqItem(
                        'What counts as assets for Zakat?',
                        'All liquid assets including Gold, Silver, Cash in savings, investments, and business trade inventory.',
                      ),
                      _faqItem(
                        'How is Nisab determined?',
                        'Nisab equals 87.48 grams of Gold or 612.36 grams of Silver value.',
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

  Widget _unitInputRow(String label, String hint, String unit, IconData icon,
      VoidCallback onUnitTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              style: const TextStyle(color: Colors.white, fontSize: 12),
              decoration: InputDecoration(
                labelText: label,
                labelStyle:
                    const TextStyle(color: AppColors.lightGold, fontSize: 12),
                hintText: hint,
                hintStyle:
                    const TextStyle(color: Colors.white38, fontSize: 11),
                prefixIcon:
                    Icon(icon, color: AppColors.accentGold.withOpacity(0.7), size: 18),
                contentPadding: const EdgeInsets.symmetric(
                    horizontal: 12, vertical: 12),
                filled: true,
                fillColor: AppColors.cardBg,
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
          const SizedBox(width: 8),
          InkWell(
            onTap: onUnitTap,
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 14, vertical: 13),
              decoration: BoxDecoration(
                color: AppColors.primaryGreen,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.glassBorder),
              ),
              child: Row(
                children: [
                  Text(unit,
                      style: const TextStyle(
                          color: AppColors.accentGold,
                          fontSize: 12,
                          fontWeight: FontWeight.bold)),
                  const Icon(Icons.arrow_drop_down,
                      color: AppColors.accentGold, size: 18),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _regularInput(String label, String hint, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextField(
        style: const TextStyle(color: Colors.white, fontSize: 12),
        decoration: InputDecoration(
          labelText: label,
          labelStyle:
              const TextStyle(color: AppColors.lightGold, fontSize: 12),
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.white38, fontSize: 11),
          suffixIcon:
              Icon(icon, color: AppColors.accentGold.withOpacity(0.6), size: 18),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          filled: true,
          fillColor: AppColors.cardBg,
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
    );
  }

  Widget _faqItem(String question, String answer) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: AppColors.primaryGreen,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.glassBorder),
      ),
      child: ExpansionTile(
        title: Text(question,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w500)),
        iconColor: AppColors.accentGold,
        collapsedIconColor: Colors.white54,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 14, right: 14, bottom: 12),
            child: Text(answer,
                style: const TextStyle(
                    color: Colors.white70, fontSize: 11, height: 1.3)),
          ),
        ],
      ),
    );
  }

  void _showUnitPopup(
      String title, List<String> units, ValueChanged<String> onSelect) {
    final selected = title == 'Gold' ? _goldUnit : _silverUnit;
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.primaryDark,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(22)),
      ),
      builder: (ctx) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: AppColors.glassBorderStrong,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
              Text('Select $title Unit',
                  style: GoogleFonts.poppins(
                      color: AppColors.lightGold,
                      fontSize: 16,
                      fontWeight: FontWeight.bold)),
              const SizedBox(height: 18),
              ...units.map((u) {
                final isSel = u == selected;
                return Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  decoration: BoxDecoration(
                    color: isSel ? AppColors.primaryGreen : AppColors.cardBg,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: isSel
                          ? AppColors.accentGold
                          : AppColors.glassBorder,
                      width: isSel ? 1.2 : 0.8,
                    ),
                  ),
                  child: ListTile(
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 14),
                    title: Text(u,
                        style: const TextStyle(
                            color: Colors.white, fontSize: 13)),
                    trailing: isSel
                        ? const Icon(Icons.check_circle,
                            color: AppColors.accentGold)
                        : null,
                    onTap: () {
                      onSelect(u);
                      Navigator.pop(ctx);
                    },
                  ),
                );
              }),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.pop(ctx),
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(
                            color: AppColors.glassBorderStrong),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                      child: const Text('Cancel',
                          style: TextStyle(
                              color: AppColors.lightGold, fontSize: 13)),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: SizedBox(
                      height: 46,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                              colors: AppColors.goldButtonGradient),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(10),
                            onTap: () => Navigator.pop(ctx),
                            child: const Center(
                              child: Text('Apply',
                                  style: TextStyle(
                                      color: AppColors.primaryDark,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13)),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
