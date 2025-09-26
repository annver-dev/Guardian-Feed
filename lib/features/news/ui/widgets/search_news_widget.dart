import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:places_search/assets/images/app_svg_icons.dart';
import 'package:places_search/features/news/ui/screens/news_wm.dart';
import 'package:places_search/uikit/themes/colors/app_color_theme.dart';

class SearchNewsWidget extends StatefulWidget {
  const SearchNewsWidget({super.key, required this.wm});

  final INewsWM wm;

  @override
  State<SearchNewsWidget> createState() => _SearchNewsWidgetState();
}

class _SearchNewsWidgetState extends State<SearchNewsWidget> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _clearSearch() {
    _controller.clear();
    widget.wm.loadNews();
  }

  @override
  Widget build(BuildContext context) {
    final theme = AppColorTheme.of(context);
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
      child: TextField(
        controller: _controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: theme.neutralWhite,
          hintText: 'Поиск по названию',
          hintStyle: textTheme.bodySmall,
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SvgPicture.asset(
              width: 20,
              height: 20,
              AppSvgIcons.icSearch,
              colorFilter: ColorFilter.mode(
                theme.textSecondary,
                BlendMode.srcIn,
              ),
            ),
          ),
          suffixIcon: GestureDetector(
            onTap: _clearSearch,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SvgPicture.asset(
                width: 20,
                height: 20,
                AppSvgIcons.icClear,
                colorFilter: ColorFilter.mode(
                  theme.textSecondary,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
        ),
        onChanged: (value) {
          if (value.isNotEmpty) {
            widget.wm.searchNews(value);
          } else {
            widget.wm.loadNews();
          }
        },
      ),
    );
  }
}
