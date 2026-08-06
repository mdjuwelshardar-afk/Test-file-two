import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import '../constants/app_colors.dart';

/// Top scrolling "((•)) LIVE: ..." notice bar shown on every screen.
/// Exact match to reference screenshots.
class LiveNoticeBar extends StatelessWidget {
  final String message;
  final bool showDotIndicator;

  const LiveNoticeBar({
    super.key,
    this.message = "Important announcement from Sheikh [Name] - [Event Title]",
    this.showDotIndicator = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 28,
      color: Colors.black.withOpacity(0.38),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: [
          if (showDotIndicator) ...[
            Container(
              width: 8,
              height: 8,
              margin: const EdgeInsets.only(right: 6),
              decoration: const BoxDecoration(
                color: Color(0xFF4CD964),
                shape: BoxShape.circle,
              ),
            ),
          ],
          const Icon(Icons.podcasts_rounded,
              color: AppColors.accentGold, size: 13),
          const SizedBox(width: 6),
          Expanded(
            child: Marquee(
              text: "LIVE: $message",
              style: const TextStyle(
                color: AppColors.accentGold,
                fontSize: 10.5,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.2,
              ),
              scrollAxis: Axis.horizontal,
              blankSpace: 80,
              velocity: 35,
              pauseAfterRound: const Duration(seconds: 1),
              startPadding: 0,
              accelerationDuration: const Duration(milliseconds: 400),
              decelerationDuration: const Duration(milliseconds: 400),
            ),
          ),
        ],
      ),
    );
  }
}
