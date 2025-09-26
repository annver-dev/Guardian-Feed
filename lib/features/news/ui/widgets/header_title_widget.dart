import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:places_search/assets/strings/app_strings.dart';
import 'package:places_search/features/news/ui/screens/news_wm.dart';
import 'package:places_search/features/news/ui/widgets/search_news_widget.dart';
import 'package:places_search/uikit/themes/colors/app_color_theme.dart';
import 'package:provider/provider.dart';

class HeaderTitle extends StatelessWidget {
  const HeaderTitle({super.key, required this.progress});
  final double progress;

  @override
  Widget build(BuildContext context) {
    final theme = AppColorTheme.of(context);
    final textTheme = Theme.of(context).textTheme;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      padding: EdgeInsets.lerp(
        const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        const EdgeInsets.only(bottom: 16),
        progress,
      ),
      alignment: Alignment.lerp(
        Alignment.bottomLeft,
        Alignment.bottomCenter,
        progress,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.bottomRight,
            child: Flexible(
              child: SvgPicture.asset(
                'assets/icons/news_logo.svg',
                width: 50,
                height: 50,
                colorFilter: ColorFilter.mode(
                  theme.neutralWhite,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
          Flexible(
            child: Text(
              AppStrings.placesScreenAppBarTitle,
              style: TextStyle.lerp(
                textTheme.titleLarge!.copyWith(
                  color: theme.neutralWhite,
                  fontWeight: FontWeight.bold,
                ),
                textTheme.titleMedium!.copyWith(
                  color: theme.neutralWhite,
                  fontWeight: FontWeight.bold,
                ),
                progress,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(height: 4),
          Flexible(child: SearchNewsWidget(wm: context.read<INewsWM>())),
        ],
      ),
    );
  }
}
