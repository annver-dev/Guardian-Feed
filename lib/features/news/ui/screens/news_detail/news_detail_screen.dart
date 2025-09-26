import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places_search/features/news/domain/enitites/news_item_entity.dart';
import 'package:places_search/features/news/ui/screens/news_detail/news_detail_wm.dart';
import 'package:places_search/uikit/themes/colors/app_color_theme.dart';
import 'package:places_search/uikit/themes/text/app_text_theme.dart';

class NewsDetailScreen extends StatelessWidget {
  final INewsDetailWM wm;
  final NewsItemEntity news;

  const NewsDetailScreen({super.key, required this.wm, required this.news});

  @override
  Widget build(BuildContext context) {
    final colorTheme = AppColorTheme.of(context);
    final textTheme = AppTextTheme.of(context);

    return Scaffold(
      backgroundColor: colorTheme.scaffold,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: [
                  if (news.fields?.thumbnail != null &&
                      news.fields!.thumbnail!.isNotEmpty)
                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(news.fields!.thumbnail!),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  // Header content
                  Positioned(
                    bottom: 20,
                    left: 16,
                    right: 16,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: _getSectionColor(news.sectionName),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            news.sectionName.toUpperCase(),
                            style: textTheme.superSmall.copyWith(
                              color: colorTheme.neutralWhite,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              ValueListenableBuilder<List<NewsItemEntity>>(
                valueListenable: wm.favoritesListenable,
                builder: (context, favorites, child) {
                  final isFavorite = wm.isFavorite(news);
                  return Container(
                    margin: const EdgeInsets.only(right: 8),
                    decoration: BoxDecoration(
                      color: colorTheme.neutralWhite,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color:
                            isFavorite
                                ? colorTheme.newsUrgent
                                : colorTheme.neutralWhite,
                      ),
                      onPressed: () => wm.onLikePressed(news),
                    ),
                  );
                },
              ),
            ],
          ),

          SliverToBoxAdapter(
            child: Container(
              color: colorTheme.scaffold,
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: colorTheme.newsCardBackground,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Title
                          Text(
                            news.title,
                            style: textTheme.title.copyWith(
                              color: colorTheme.newsText,
                              fontWeight: FontWeight.bold,
                              height: 1.3,
                            ),
                          ),
                          const SizedBox(height: 16),

      
                          Row(
                            children: [
                              Icon(
                                Icons.access_time,
                                size: 16,
                                color: colorTheme.newsSubtext,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                _formatDate(news.publicationDate),
                                style: textTheme.small.copyWith(
                                  color: colorTheme.newsSubtext,
                                ),
                              ),
                              if (news.fields?.author != null) ...[
                                const SizedBox(width: 16),
                                Icon(
                                  Icons.person,
                                  size: 16,
                                  color: colorTheme.newsSubtext,
                                ),
                                const SizedBox(width: 4),
                                Expanded(
                                  child: Text(
                                    news.fields!.author!,
                                    style: textTheme.small.copyWith(
                                      color: colorTheme.newsSubtext,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ],
                          ),

                          if (news.fields?.body != null) ...[
                            const SizedBox(height: 24),
                            Html(
                              data: news.fields!.body!,
                              style: {
                                "body": Style(
                                  margin: Margins.zero,
                                  padding: HtmlPaddings.zero,
                                  fontSize: FontSize(textTheme.text.fontSize ?? 16),
                                  color: colorTheme.newsText,
                                  lineHeight: const LineHeight(1.6),
                                ),
                                "p": Style(
                                  margin: Margins.only(bottom: 12),
                                  fontSize: FontSize(textTheme.text.fontSize ?? 16),
                                  color: colorTheme.newsText,
                                  lineHeight: const LineHeight(1.6),
                                ),
                                "a": Style(
                                  color: colorTheme.newsHeaderDark,
                                  textDecoration: TextDecoration.underline,
                                ),
                                "strong": Style(
                                  fontWeight: FontWeight.bold,
                                ),
                                "em": Style(
                                  fontStyle: FontStyle.italic,
                                ),
                                "h1, h2, h3, h4, h5, h6": Style(
                                  fontWeight: FontWeight.bold,
                                  margin: Margins.only(top: 16, bottom: 8),
                                ),
                              },
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),

               
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: colorTheme.newsCardBackground,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Дополнительная информация',
                            style: textTheme.subtitle.copyWith(
                              color: colorTheme.newsText,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 16),
                          _buildInfoRow(
                            'Тип:',
                            news.type,
                            colorTheme,
                            textTheme,
                          ),
                          _buildInfoRow(
                            'Раздел:',
                            '${news.sectionName} (${news.pillarName})',
                            colorTheme,
                            textTheme,
                          ),
                          _buildInfoRow('ID:', news.id, colorTheme, textTheme),
                          if (news.isHosted)
                            _buildInfoRow(
                              'Статус:',
                              'Размещено',
                              colorTheme,
                              textTheme,
                            ),
                        ],
                      ),
                    ),
                  ),

                  // Action button
                  Container(
                    margin: const EdgeInsets.all(16),
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Ссылка: ${news.webUrl}'),
                            backgroundColor: colorTheme.newsHeaderDark,
                            action: SnackBarAction(
                              label: 'Скопировать',
                              textColor: colorTheme.neutralWhite,
                              onPressed: () {},
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: colorTheme.newsHeaderDark,
                        foregroundColor: colorTheme.neutralWhite,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 4,
                      ),
                      icon: const Icon(Icons.open_in_new),
                      label: Text(
                        'Читать полную статью',
                        style: textTheme.button.copyWith(
                          color: colorTheme.neutralWhite,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(
    String label,
    String value,
    AppColorTheme colorTheme,
    AppTextTheme textTheme,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 80,
            child: Text(
              label,
              style: textTheme.small.copyWith(
                fontWeight: FontWeight.w600,
                color: colorTheme.newsSubtext,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: textTheme.small.copyWith(color: colorTheme.newsText),
            ),
          ),
        ],
      ),
    );
  }

  Color _getSectionColor(String sectionName) {
    switch (sectionName.toLowerCase()) {
      case 'политика':
      case 'politics':
        return const Color(0xffE74C3C);
      case 'спорт':
      case 'sport':
        return const Color(0xff27AE60);
      case 'технологии':
      case 'technology':
        return const Color(0xff3498DB);
      case 'культура':
      case 'culture':
        return const Color(0xff9B59B6);
      default:
        return const Color(0xff95A5A6);
    }
  }

  String _formatDate(DateTime date) {
    final months = [
      'янв',
      'фев',
      'мар',
      'апр',
      'май',
      'июн',
      'июл',
      'авг',
      'сен',
      'окт',
      'ноя',
      'дек',
    ];

    return '${date.day} ${months[date.month - 1]} ${date.year}';
  }
}
