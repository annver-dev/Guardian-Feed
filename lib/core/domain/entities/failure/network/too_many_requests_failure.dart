import 'package:places_search/core/domain/entities/failure/network/network_failure.dart';

/// Ошибка, возникающая при слишком большом количестве запросов.
final class TooManyRequestsFailure extends NetworkFailure {
  const TooManyRequestsFailure({
    super.message,
    super.parentException,
    super.stackTrace,
  });
}
