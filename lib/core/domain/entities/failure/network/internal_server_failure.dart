import 'package:places_search/core/domain/entities/failure/network/network_failure.dart';

/// Ошибка сервера.
final class InternalServerFailure extends NetworkFailure {
  const InternalServerFailure() : super(message: 'Internal server error');
}
