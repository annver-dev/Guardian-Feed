import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:places_search/uikit/themes/colors/app_color_theme.dart';

Color getSectionColor(String sectionName, BuildContext context) {
  final colorTheme = AppColorTheme.of(context);
  switch (sectionName.toLowerCase()) {
    case 'politics':
      return colorTheme.newsUrgent;
    case 'sport':
      return Colors.green;
    case 'технологии':
      return Colors.blue;
    case 'food':
      return Colors.purple;
    case 'football':
      return Colors.teal;
    default:
      return colorTheme.newsHeaderDark;
  }
}
