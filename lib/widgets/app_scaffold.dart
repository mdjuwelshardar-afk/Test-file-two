import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_colors.dart';

/// Common page frame used by every inner screen.
/// Uses mosque background image + dark green overlay.
class AppScaffold extends StatelessWidget {
  final String? title;
  final bool showBack;
  final List<Widget>? headerActions;
  final Widget body;
  final bool showWatermark;
  final EdgeInsetsGeometry bodyPadding;
  final bool scrollable;
  final Widget? floatingActionButton;
  final Widget? bottomWidget;

  const AppScaffold({
    super.key,
    this.title,
    this.showBack = true,
    this.headerActions,
    required this.body,
    this.showWatermark = true,
    this.bodyPadding = const EdgeInsets.fromLTRB(16, 8, 16, 24),
    this.scrollable = true,
    this.floatingActionButton,
    this.bottomWidget,
  });

  @override
  Widget build(BuildContext context) {
    final content = Padding(padding: bodyPadding, child: body);

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
          // Mosque background image
          Positioned.fill(
            child: Opacity(
              opacity: 0.06,
              child: Image.asset(
                AppColors.mosqueBgImage,
                fit: BoxFit.cover,
                alignment: Alignment.bottomCenter,
                errorBuilder: (_, __, ___) => const SizedBox.shrink(),
              ),
            ),
          ),
          Column(
            children: [
              if (title != null)
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(4, 8, 16, 4),
                    child: Row(
                      children: [
                        if (showBack)
                          IconButton(
                            icon: const Icon(Icons.arrow_back_ios_new_rounded,
                                color: AppColors.lightGold, size: 18),
                            onPressed: () => Navigator.maybePop(context),
                          )
                        else
                          const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            title!,
                            style: GoogleFonts.poppins(
                              color: AppColors.lightGold,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        if (headerActions != null) ...headerActions!,
                      ],
                    ),
                  ),
                ),
              Expanded(
                child: scrollable
                    ? SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: content,
                      )
                    : content,
              ),
              if (bottomWidget != null) bottomWidget!,
            ],
          ),
        ],
      ),
    );
  }
}
