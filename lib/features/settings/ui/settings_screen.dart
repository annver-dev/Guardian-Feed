import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places_search/features/settings/ui/settings_wm.dart';
import 'package:places_search/uikit/themes/colors/app_color_theme.dart';
import 'package:places_search/uikit/themes/text/app_text_theme.dart';

class SettingsScreen extends StatefulWidget {
  final ISettingsWM wm;

  const SettingsScreen({super.key, required this.wm});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final colorTheme = AppColorTheme.of(context);
    final textTheme = AppTextTheme.of(context);

    return Scaffold(
      backgroundColor: colorTheme.scaffold,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 120,
            floating: false,
            pinned: true,
            backgroundColor: colorTheme.newsHeaderDark,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          colorTheme.newsHeaderDark,
                          colorTheme.newsHeaderLight,
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    left: 16,
                    right: 16,
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/settings_full.svg',
                          width: 32,
                          height: 32,
                          colorFilter: ColorFilter.mode(
                            colorTheme.neutralWhite,
                            BlendMode.srcIn,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          'Настройки',
                          style: textTheme.title.copyWith(
                            color: colorTheme.neutralWhite,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Settings Content
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  Container(
                    decoration: BoxDecoration(
                      color: colorTheme.newsCardBackground,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            'Внешний вид',
                            style: textTheme.subtitle.copyWith(
                              color: colorTheme.textPrimary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        // Theme Toggle
                        ValueListenableBuilder<ThemeMode>(
                          valueListenable: widget.wm.themeModeListenable,
                          builder: (context, themeMode, child) {
                            return Container(
                              margin: const EdgeInsets.symmetric(
                                horizontal: 16,
                              ),
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: colorTheme.scaffold,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: colorTheme.accent.withValues(
                                        alpha: 0.1,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Icon(
                                      themeMode == ThemeMode.dark
                                          ? Icons.dark_mode
                                          : Icons.light_mode,
                                      color: colorTheme.accent,
                                      size: 24,
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Тема приложения',
                                          style: textTheme.text.copyWith(
                                            color: colorTheme.textPrimary,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          themeMode == ThemeMode.dark
                                              ? 'Темная тема'
                                              : 'Светлая тема',
                                          style: textTheme.small.copyWith(
                                            color: colorTheme.textSecondary,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Switch(
                                    value: themeMode == ThemeMode.dark,
                                    onChanged: (value) {
                                      widget.wm.onThemeToggle();
                                    },
                                    activeColor: colorTheme.accent,
                                    inactiveThumbColor: colorTheme.inactive,
                                    inactiveTrackColor: colorTheme.inactive
                                        .withValues(alpha: 0.3),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Additional Settings Section (placeholder)
                  Container(
                    decoration: BoxDecoration(
                      color: colorTheme.newsCardBackground,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            'О приложении',
                            style: textTheme.subtitle.copyWith(
                              color: colorTheme.textPrimary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 16),
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: colorTheme.scaffold,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: colorTheme.accent.withValues(
                                    alpha: 0.1,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Icon(
                                  Icons.info_outline,
                                  color: colorTheme.accent,
                                  size: 24,
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Версия приложения',
                                      style: textTheme.text.copyWith(
                                        color: colorTheme.textPrimary,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      '1.0.0',
                                      style: textTheme.small.copyWith(
                                        color: colorTheme.textSecondary,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
