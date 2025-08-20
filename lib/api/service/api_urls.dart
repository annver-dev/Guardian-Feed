/// Класс с URL-адресами API.
abstract class ApiUrls {
  /// Получение списка мест
  static const String places = '/search';
  static const String search = '/places/search';
  static const String details = '/places/{id}';
}
