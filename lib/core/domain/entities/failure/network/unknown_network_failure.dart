import 'package:places_search/core/domain/entities/failure/network/network_failure.dart';

/// Неизвестная ошибка сети.
final class UnknownNetworkFailure extends NetworkFailure {
  const UnknownNetworkFailure(Exception exception)
    : super(parentException: exception);
}
