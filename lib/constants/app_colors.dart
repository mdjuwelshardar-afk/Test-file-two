import 'package:flutter/material.dart';

/// MINARAH Islamic Hub BD — Locked Design System Colors
/// Pixel-perfect reproduction from reference screenshots
class AppColors {
  // ── Primary Palette (LOCKED) ──
  static const Color primaryDark = Color(0xFF0B3D2E);
  static const Color primaryGreen = Color(0xFF116149);
  static const Color darkSurface = Color(0xFF083327);
  static const Color cardBgSolid = Color(0xFF0E4A38);

  // ── Gold Accents (LOCKED) ──
  static const Color accentGold = Color(0xFFD4AF37);
  static const Color goldGlow = Color(0xFFE6C45A);
  static const Color lightGold = Color(0xFFF5E8B0);
  static const Color lightGoldAlt = Color(0xFFF3E9C6);

  // ── Text Colors (LOCKED) ──
  static const Color primaryText = Color(0xFFF5E8B0);
  static const Color secondaryText = Color(0xFFD8D8D8);
  static const Color textMuted = Color(0xB3FFFFFF);
  static const Color textFaint = Color(0x66FFFFFF);

  // ── Status Colors ──
  static const Color success = Color(0xFF3E9C6C);
  static const Color gpsGreen = Color(0xFF4CD964);

  // ── Surface / Glass Colors ──
  static const Color cardBg = Color(0x33116149);       // translucent glass
  static const Color cardBgMedium = Color(0x4D116149); // medium translucent
  static const Color glassBorder = Color(0x4DD4AF37);  // gold border ~30%
  static const Color glassBorderStrong = Color(0x99D4AF37);
  static const Color scrimBlack = Color(0x66000000);
  static const Color scrimHeavy = Color(0x99000000);

  // ── Background Gradients ──
  static const List<Color> bgGradient = [
    Color(0xFF0B3D2E),
    Color(0xFF07281E),
  ];

  static const List<Color> cardGradient = [
    Color(0x4D116149),
    Color(0x330B3D2E),
  ];

  // ── Gold Button Gradient ──
  static const List<Color> goldButtonGradient = [
    Color(0xFFE8CA6B),
    Color(0xFFD4AF37),
  ];

  // ── Glow Shadow Colors ──
  static const Color glowShadowLight = Color(0x2ED4AF37);
  static const Color glowShadowMedium = Color(0x59D4AF37);

  // ── Glow Shadows ──
  static const BoxShadow goldGlowShadow = BoxShadow(
    color: glowShadowLight,
    blurRadius: 18,
    spreadRadius: 1,
  );

  static const BoxShadow goldGlowStrong = BoxShadow(
    color: glowShadowMedium,
    blurRadius: 24,
    spreadRadius: 2,
  );

  static const BoxShadow goldGlowButton = BoxShadow(
    color: glowShadowMedium,
    blurRadius: 12,
    offset: Offset(0, 4),
  );

  // ── Mosque Silhouette Background Image ──
  static const String mosqueBgImage = 'assets/images/mosque_background.png';
  static const String mosqueSilhouette = 'assets/images/mosque_silhouette.png';
}
