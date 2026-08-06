import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

/// The rounded translucent "glassmorphism" card used everywhere in the
/// reference designs — dhikr rows, hadith cards, dua cards, FAQ items, etc.
class GlassCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry? margin;
  final double radius;
  final Color? color;
  final Color? borderColor;
  final List<Color>? gradientColors;
  final bool glow;
  final double glowIntensity;
  final VoidCallback? onTap;

  const GlassCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(16),
    this.margin,
    this.radius = 16,
    this.color,
    this.borderColor,
    this.gradientColors,
    this.glow = false,
    this.glowIntensity = 0.18,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final card = Container(
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        gradient: gradientColors != null
            ? LinearGradient(
                colors: gradientColors!,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )
            : null,
        color: gradientColors == null ? (color ?? AppColors.cardBg) : null,
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(
          color: borderColor ?? AppColors.glassBorder,
          width: 0.8,
        ),
        boxShadow: glow
            ? [
                BoxShadow(
                  color: AppColors.accentGold.withOpacity(glowIntensity),
                  blurRadius: 18,
                  spreadRadius: 1,
                ),
              ]
            : null,
      ),
      child: child,
    );

    if (onTap == null) return card;
    return InkWell(
      borderRadius: BorderRadius.circular(radius),
      onTap: onTap,
      child: card,
    );
  }
}

/// Gold filled primary button used for main actions.
class GoldButton extends StatelessWidget {
  final String label;
  final VoidCallback? onTap;
  final IconData? icon;
  final bool outlined;
  final double height;
  final double fontSize;

  const GoldButton({
    super.key,
    required this.label,
    this.onTap,
    this.icon,
    this.outlined = false,
    this.height = 48,
    this.fontSize = 14,
  });

  @override
  Widget build(BuildContext context) {
    if (outlined) {
      return SizedBox(
        width: double.infinity,
        height: height,
        child: OutlinedButton(
          onPressed: onTap,
          style: OutlinedButton.styleFrom(
            side: const BorderSide(color: AppColors.glassBorderStrong),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)),
            foregroundColor: AppColors.lightGold,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) ...[
                Icon(icon, size: 18, color: AppColors.lightGold),
                const SizedBox(width: 8),
              ],
              Text(label,
                  style: TextStyle(
                      color: AppColors.lightGold,
                      fontWeight: FontWeight.w600,
                      fontSize: fontSize)),
            ],
          ),
        ),
      );
    }
    return SizedBox(
      width: double.infinity,
      height: height,
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: const LinearGradient(colors: AppColors.goldButtonGradient),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [AppColors.goldGlowButton],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: onTap,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (icon != null) ...[
                  Icon(icon, color: AppColors.primaryDark, size: 18),
                  const SizedBox(width: 8),
                ],
                Text(
                  label,
                  style: TextStyle(
                    color: AppColors.primaryDark,
                    fontWeight: FontWeight.bold,
                    fontSize: fontSize,
                    letterSpacing: 0.3,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
