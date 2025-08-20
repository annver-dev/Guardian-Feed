class NewsItemEntity {
  final String id; // Кастомный тип вместо String
  final String title; // Валидируемый объект-значение
  // final Url url; // Обертка над String
  // final DateTime publicationDate;
  // final Option<String> thumbnailUrl; // Используем Option из dartz
  // final NewsContent content;

  NewsItemEntity({
    required this.id,
    required this.title,
    // required this.url,
    // required this.publicationDate,
    // required this.thumbnailUrl,
    // required this.content,
  });
}
