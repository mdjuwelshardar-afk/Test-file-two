import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_colors.dart';
import '../widgets/glass_card.dart';
import '../widgets/islamic_watermark.dart';

/// Screen 17 — SETTINGS
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _autoDarkMode = true;
  bool _prayerNotifications = true;
  bool _dailyHadith = true;
  bool _dailyDhikr = true;
  bool _islamicEvents = true;
  bool _fridayReminder = true;
  final String _language = 'English';
  final String _theme = 'Dark';
  final double _fontSize = 14;

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
                    Text('Settings',
                        style: GoogleFonts.poppins(
                            color: AppColors.lightGold,
                            fontSize: 17,
                            fontWeight: FontWeight.w600)),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(16, 4, 16, 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // User Preferences
                      _sectionTitle('USER PREFERENCES'),
                      const SizedBox(height: 8),
                      GlassCard(
                        margin: const EdgeInsets.only(bottom: 12),
                        child: Column(
                          children: [
                            _settingRow('Language', _language, () {}),
                            const Divider(color: AppColors.glassBorder, height: 1),
                            _settingRow('Theme', _theme, () {}),
                            const Divider(color: AppColors.glassBorder, height: 1),
                            _settingRow('Font Size', '${_fontSize.toInt()}', () {}),
                            const Divider(color: AppColors.glassBorder, height: 1),
                            _toggleRow('Auto Dark Mode', _autoDarkMode, (v) {
                              setState(() => _autoDarkMode = v);
                            }),
                          ],
                        ),
                      ),

                      // Prayer Settings
                      _sectionTitle('PRAYER SETTINGS'),
                      const SizedBox(height: 8),
                      GlassCard(
                        margin: const EdgeInsets.only(bottom: 12),
                        child: Column(
                          children: [
                            _settingRow('Fajr', 'Azan Name', () {}),
                            const Divider(color: AppColors.glassBorder, height: 1),
                            _settingRow('Dhuhr', 'Azan Name', () {}),
                            const Divider(color: AppColors.glassBorder, height: 1),
                            _settingRow('Asr', 'Azan Name', () {}),
                            const Divider(color: AppColors.glassBorder, height: 1),
                            _settingRow('Maghrib', 'Azan Name', () {}),
                            const Divider(color: AppColors.glassBorder, height: 1),
                            _settingRow('Isha', 'Azan Name', () {}),
                          ],
                        ),
                      ),

                      // Quran Settings
                      _sectionTitle('QURAN SETTINGS'),
                      const SizedBox(height: 8),
                      GlassCard(
                        margin: const EdgeInsets.only(bottom: 12),
                        child: Column(
                          children: [
                            _settingRow('Arabic Font Size', '4', () {}),
                            const Divider(color: AppColors.glassBorder, height: 1),
                            _settingRow('Translation Font Size', '2', () {}),
                            const Divider(color: AppColors.glassBorder, height: 1),
                            _settingRow('Auto Bookmark', '-', () {}),
                            const Divider(color: AppColors.glassBorder, height: 1),
                            _settingRow('Last Read Position', 'Last Read', () {}),
                          ],
                        ),
                      ),

                      // Notification Settings
                      _sectionTitle('NOTIFICATION SETTINGS'),
                      const SizedBox(height: 8),
                      GlassCard(
                        margin: const EdgeInsets.only(bottom: 12),
                        child: Column(
                          children: [
                            _toggleRow('Prayer Notifications', _prayerNotifications,
                                (v) => setState(() => _prayerNotifications = v)),
                            const Divider(color: AppColors.glassBorder, height: 1),
                            _toggleRow('Daily Hadith', _dailyHadith,
                                (v) => setState(() => _dailyHadith = v)),
                            const Divider(color: AppColors.glassBorder, height: 1),
                            _toggleRow('Daily Dhikr', _dailyDhikr,
                                (v) => setState(() => _dailyDhikr = v)),
                            const Divider(color: AppColors.glassBorder, height: 1),
                            _toggleRow('Islamic Events', _islamicEvents,
                                (v) => setState(() => _islamicEvents = v)),
                            const Divider(color: AppColors.glassBorder, height: 1),
                            _toggleRow('Friday Reminder', _fridayReminder,
                                (v) => setState(() => _fridayReminder = v)),
                          ],
                        ),
                      ),

                      // App Settings
                      _sectionTitle('APP SETTINGS'),
                      const SizedBox(height: 8),
                      GlassCard(
                        margin: const EdgeInsets.only(bottom: 12),
                        child: Column(
                          children: [
                            _settingRow('Clear Cache', 'Offline Data', () {}),
                            const Divider(color: AppColors.glassBorder, height: 1),
                            _settingRow('Privacy Policy', '', () {}),
                            const Divider(color: AppColors.glassBorder, height: 1),
                            _settingRow('About Minarah', '', () {}),
                            const Divider(color: AppColors.glassBorder, height: 1),
                            _settingRow('App Version', '1.0.0', () {}),
                          ],
                        ),
                      ),

                      // Backup & Restore
                      _sectionTitle('BACKUP & RESTORE'),
                      const SizedBox(height: 8),
                      GlassCard(
                        margin: const EdgeInsets.only(bottom: 12),
                        child: Column(
                          children: [
                            _settingRow('Backup Data', '', () {}),
                            const Divider(color: AppColors.glassBorder, height: 1),
                            _settingRow('Restore Data', '', () {}),
                            const Divider(color: AppColors.glassBorder, height: 1),
                            _settingRow('Export Settings', '', () {}),
                            const Divider(color: AppColors.glassBorder, height: 1),
                            _settingRow('Import Settings', '', () {}),
                          ],
                        ),
                      ),

                      // Developer Info
                      _sectionTitle('DEVELOPER INFO'),
                      const SizedBox(height: 8),
                      GlassCard(
                        margin: const EdgeInsets.only(bottom: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Minarah',
                                style: TextStyle(
                                    color: AppColors.lightGold,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold)),
                            const SizedBox(height: 4),
                            const Text('Version 1.0.0',
                                style: TextStyle(
                                    color: Colors.white60, fontSize: 10)),
                            const SizedBox(height: 4),
                            const Text('Developer: Info@Minarah.com',
                                style: TextStyle(
                                    color: Colors.white60, fontSize: 10)),
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

  Widget _sectionTitle(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Text(text,
          style: GoogleFonts.poppins(
              color: AppColors.lightGold,
              fontSize: 11,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5)),
    );
  }

  Widget _settingRow(String label, String value, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 4),
        child: Row(
          children: [
            Expanded(
              child: Text(label,
                  style: const TextStyle(color: Colors.white, fontSize: 12)),
            ),
            if (value.isNotEmpty) ...[
              Text(value,
                  style: const TextStyle(
                      color: AppColors.accentGold,
                      fontSize: 12,
                      fontWeight: FontWeight.w600)),
              const SizedBox(width: 4),
            ],
            const Icon(Icons.chevron_right_rounded,
                color: Colors.white38, size: 16),
          ],
        ),
      ),
    );
  }

  Widget _toggleRow(String label, bool value, ValueChanged<bool> onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
      child: Row(
        children: [
          Expanded(
            child: Text(label,
                style: const TextStyle(color: Colors.white, fontSize: 12)),
          ),
          Switch(
            value: value,
            activeColor: AppColors.accentGold,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
