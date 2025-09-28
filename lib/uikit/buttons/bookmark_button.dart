import 'package:flutter/material.dart';
import 'package:places_search/uikit/themes/colors/app_color_theme.dart';

class BookmarkButton extends StatelessWidget {
  const BookmarkButton({super.key, required this.isFavorite});

  final bool isFavorite;

  @override
  Widget build(BuildContext context) {
    final colorTheme = AppColorTheme.of(context);
    return Icon(
      isFavorite ? Icons.bookmark : Icons.bookmark_border,
      color: isFavorite ? colorTheme.newsHeaderDark : colorTheme.inactive,
      size: 20,
    );
  }
}
