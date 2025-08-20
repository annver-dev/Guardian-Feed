import 'package:places_search/core/domain/entities/failure/network/network_failure.dart';

/// Ошибка, возникающая при истечении времени ожидания запроса.
final class TimeoutException extends NetworkFailure {
  const TimeoutException() : super(message: 'Timeout');
}
