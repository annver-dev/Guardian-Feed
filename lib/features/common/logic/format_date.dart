String formatDate(DateTime date) {
  final now = DateTime.now();
  final difference = now.difference(date);
  if (difference.inDays > 0) {
    return '${difference.inDays} дн. назад';
  } else if (difference.inHours > 0) {
    return '${difference.inHours} ч. назад';
  } else if (difference.inMinutes > 0) {
    return '${difference.inMinutes} мин. назад';
  } else {
    return 'Только что';
  }
}
