import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../constants/app_colors.dart';
import '../models/navigation_provider.dart';

class NavDestination {
  final IconData icon;
  final IconData? activeIcon;
  final String label;
  const NavDestination(this.icon, this.label, {this.activeIcon});
}

/// Fixed 5-tab bottom footer: Home / Quran / Hadith / Tools / More.
/// Exact match to reference screenshots.
class BottomNavFooter extends StatelessWidget {
  final void Function(int index)? onTap;

  const BottomNavFooter({super.key, this.onTap});

  static const List<NavDestination> destinations = [
    NavDestination(Icons.home_rounded, 'Home'),
    NavDestination(Icons.menu_book_rounded, 'Quran'),
    NavDestination(Icons.auto_stories_rounded, 'Hadith'),
    NavDestination(Icons.apps_rounded, 'Tools'),
    NavDestination(Icons.more_horiz_rounded, 'More'),
  ];

  @override
  Widget build(BuildContext context) {
    final nav = context.watch<NavigationProvider>();
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primaryDark,
        border: Border(
          top: BorderSide(
            color: AppColors.glassBorder.withOpacity(0.5),
            width: 0.8,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      padding: const EdgeInsets.only(top: 6, bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(destinations.length, (i) {
          final bool active = nav.currentIndex == i;
          final dest = destinations[i];
          return InkWell(
            onTap: () => onTap != null ? onTap!(i) : nav.setIndex(i),
            borderRadius: BorderRadius.circular(12),
            splashColor: AppColors.accentGold.withOpacity(0.1),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: active ? AppColors.accentGold.withOpacity(0.12) : null,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    dest.icon,
                    size: 20,
                    color: active ? AppColors.accentGold : Colors.white54,
                  ),
                  const SizedBox(height: 3),
                  Text(
                    dest.label,
                    style: GoogleFonts.poppins(
                      fontSize: 9.5,
                      color:
                          active ? AppColors.accentGold : Colors.white54,
                      fontWeight:
                          active ? FontWeight.w600 : FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
