import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_colors.dart';
import '../widgets/glass_card.dart';
import '../widgets/islamic_watermark.dart';

/// Screen 08 — PRAYER SETTINGS
class PrayerSettingsScreen extends StatefulWidget {
  const PrayerSettingsScreen({super.key});

  @override
  State<PrayerSettingsScreen> createState() => _PrayerSettingsScreenState();
}

class _PrayerSettingsScreenState extends State<PrayerSettingsScreen> {
  bool _globalAlarm = true;
  String _expanded = 'Asr';

  final List<Map<String, String>> _prayers = [
    {'name': 'Fajr', 'time': '04:12 AM'},
    {'name': 'Dhuhr', 'time': '12:08 PM'},
    {'name': 'Asr', 'time': '03:45 PM'},
    {'name': 'Maghrib', 'time': '06:21 PM'},
    {'name': 'Isha', 'time': '07:38 PM'},
  ];

  final Map<String, bool> _alarmToggles = {
    'Fajr': true,
    'Dhuhr': true,
    'Asr': true,
    'Maghrib': true,
    'Isha': true,
  };

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
                    Text('Prayer Settings',
                        style: GoogleFonts.poppins(
                            color: AppColors.lightGold,
                            fontSize: 16,
                            fontWeight: FontWeight.w600)),
                    const Spacer(),
                    const Icon(Icons.settings_outlined,
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
                      // Edit Prayer Times
                      GlassCard(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text('Edit Prayer Times',
                                    style: GoogleFonts.poppins(
                                        color: AppColors.lightGold,
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold)),
                                const Spacer(),
                                Switch(
                                  value: _globalAlarm,
                                  activeColor: AppColors.accentGold,
                                  onChanged: (v) =>
                                      setState(() => _globalAlarm = v),
                                ),
                              ],
                            ),
                            const Divider(
                                color: AppColors.glassBorder, height: 18),
                            ..._prayers.map((p) => Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 6),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Text(p['name']!,
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 13)),
                                      ),
                                      Text(p['time']!,
                                          style: const TextStyle(
                                              color: AppColors.accentGold,
                                              fontSize: 13,
                                              fontWeight: FontWeight.w600)),
                                      const SizedBox(width: 10),
                                      const Icon(Icons.edit_outlined,
                                          color: Colors.white38, size: 15),
                                    ],
                                  ),
                                )),
                          ],
                        ),
                      ),
                      const SizedBox(height: 14),

                      // Alarm and Adhan
                      GlassCard(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Alarm and Adhan',
                                style: GoogleFonts.poppins(
                                    color: AppColors.lightGold,
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold)),
                            const SizedBox(height: 10),
                            ..._prayers.map((p) {
                              final name = p['name']!;
                              final isExpanded = _expanded == name;
                              return Column(
                                children: [
                                  InkWell(
                                    onTap: () => setState(() => _expanded =
                                        _expanded == name ? '' : name),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 6),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Text(name,
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 13)),
                                          ),
                                          Switch(
                                            value:
                                                _alarmToggles[name] ?? true,
                                            activeColor: AppColors.accentGold,
                                            onChanged: (v) => setState(() =>
                                                _alarmToggles[name] = v),
                                          ),
                                          const SizedBox(width: 4),
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 6),
                                            decoration: BoxDecoration(
                                              color: AppColors.primaryGreen,
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              border: Border.all(
                                                  color: AppColors.glassBorder),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                const Text('Adhan Sound',
                                                    style: TextStyle(
                                                        color: AppColors
                                                            .lightGold,
                                                        fontSize: 10)),
                                                const SizedBox(width: 4),
                                                Icon(
                                                  isExpanded
                                                      ? Icons.keyboard_arrow_up_rounded
                                                      : Icons.keyboard_arrow_down_rounded,
                                                  color: AppColors.accentGold,
                                                  size: 16,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  if (isExpanded)
                                    Container(
                                      width: double.infinity,
                                      margin: const EdgeInsets.only(
                                          bottom: 8, top: 4),
                                      padding: const EdgeInsets.all(12),
                                      decoration: BoxDecoration(
                                        color: AppColors.primaryDark,
                                        borderRadius:
                                            BorderRadius.circular(10),
                                        border: Border.all(
                                            color: AppColors.glassBorder),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              const Text('Current Adhan',
                                                  style: TextStyle(
                                                      color: Colors.white70,
                                                      fontSize: 11)),
                                              const Spacer(),
                                              TextButton(
                                                onPressed: () {},
                                                child: const Text('Preview',
                                                    style: TextStyle(
                                                        color: AppColors
                                                            .accentGold,
                                                        fontSize: 11)),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              const Text('Alarm Toggle',
                                                  style: TextStyle(
                                                      color: Colors.white70,
                                                      fontSize: 11)),
                                              const Spacer(),
                                              Switch(
                                                value:
                                                    _alarmToggles[name] ??
                                                        true,
                                                activeColor:
                                                    AppColors.accentGold,
                                                onChanged: (v) => setState(
                                                    () =>
                                                        _alarmToggles[name] =
                                                            v),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 4),
                                          const Text('Custom Adhan',
                                              style: TextStyle(
                                                  color: Colors.white70,
                                                  fontSize: 11)),
                                          const SizedBox(height: 6),
                                          SizedBox(
                                            width: double.infinity,
                                            child: OutlinedButton.icon(
                                              onPressed: () {},
                                              icon: const Icon(
                                                  Icons.upload_file_rounded,
                                                  color: AppColors.lightGold,
                                                  size: 15),
                                              label: const Text(
                                                  'Upload file from device',
                                                  style: TextStyle(
                                                      color: AppColors
                                                          .lightGold,
                                                      fontSize: 11)),
                                              style: OutlinedButton.styleFrom(
                                                side: const BorderSide(
                                                    color:
                                                        AppColors.glassBorder),
                                                padding: const EdgeInsets
                                                    .symmetric(vertical: 10),
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8)),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                ],
                              );
                            }),
                          ],
                        ),
                      ),
                      const SizedBox(height: 22),
                      // Save button
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
                                  Icon(Icons.save_outlined,
                                      color: AppColors.primaryDark, size: 18),
                                  SizedBox(width: 8),
                                  Text('Save Changes',
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
