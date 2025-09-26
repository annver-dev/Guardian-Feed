import 'package:flutter/material.dart';
import 'package:places_search/features/favorites/domain/i_favorites_repository.dart';
import 'package:places_search/features/favorites/ui/favorites_detail_wm.dart';
import 'package:provider/provider.dart';

class FavoritesDetailScreen extends StatefulWidget {
  final IFavoritesDetailWM wm;

  const FavoritesDetailScreen({super.key, required this.wm});

  @override
  State<FavoritesDetailScreen> createState() => _FavoritesDetailScreenState();
}

class _FavoritesDetailScreenState extends State<FavoritesDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Детали новости'),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              // wm.removeNews(news);
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: ValueListenableBuilder(
        valueListenable: widget.wm.favoritesListenable,
        builder: (context, value, child) {
          if (value.isEmpty) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.favorite_border, size: 64, color: Colors.grey),
                  SizedBox(height: 16),
                  Text(
                    'Нет избранных новостей',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Добавьте новости в избранное, чтобы они появились здесь',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: value.length,
            itemBuilder: (context, index) {
              final news = value[index];
              return Card(
                margin: const EdgeInsets.only(bottom: 12),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(16),
                  title: Text(
                    news.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 8),
                      Text(
                        news.sectionName,
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        _formatDate(news.publicationDate),
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.favorite, color: Colors.red),
                    onPressed: () {
                      widget.wm.onLikePressed(news);
                    },
                  ),
                  onTap: () {
                    // Можно добавить навигацию к детальному экрану новости
                  },
                ),
              );
            },
          );
        },
      ),
    );
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
