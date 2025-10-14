import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:places_search/api/data/error_response_dto.dart';
import 'package:places_search/core/data/repositories/base_repository.dart';
import 'package:places_search/core/domain/entities/failure/network/bad_request_failure.dart';
import 'package:places_search/core/domain/entities/failure/network/internal_server_failure.dart';
import 'package:places_search/core/domain/entities/failure/network/no_network_failure.dart';
import 'package:places_search/core/domain/entities/failure/network/server_not_responding_failure.dart';
import 'package:places_search/core/domain/entities/failure/network/too_many_requests_failure.dart';
import 'package:places_search/core/domain/entities/failure/network/unauthorized_failure.dart';
import 'package:places_search/core/domain/entities/failure/network/unknown_network_failure.dart';
import 'package:places_search/core/domain/entities/result/result.dart';

// Тестовый класс для доступа к protected методам BaseRepository
final class TestRepository extends BaseRepository {
  const TestRepository();

  // Публичный метод для тестирования makeApiCall
  Future<Result<String, dynamic>> testMakeApiCall(
    Future<String> Function() call,
  ) {
    return makeApiCall(call);
  }

  // Публичный метод для тестирования unwrapDioException
  dynamic testUnwrapDioException(DioException exception) {
    return unwrapDioException(exception, trace: StackTrace.current);
  }
}

void main() {
  group('BaseRepository', () {
    late TestRepository repository;

    setUp(() {
      repository = const TestRepository();
    });

    group('makeApiCall', () {
      test('должен возвращать Result.ok при успешном вызове', () async {
        const expectedData = 'test data';
        Future<String> successCall() async => expectedData;

        final result = await repository.testMakeApiCall(successCall);

        expect(result, isA<ResultOk<String, dynamic>>());
        final okResult = result as ResultOk<String, dynamic>;
        expect(okResult.data, equals(expectedData));
      });

      test('должен возвращать Result.failed при DioException', () async {
        final dioException = DioException(
          requestOptions: RequestOptions(path: '/test'),
          type: DioExceptionType.connectionTimeout,
        );

        Future<String> failingCall() async => throw dioException;

        final result = await repository.testMakeApiCall(failingCall);

        expect(result, isA<ResultFailed<String, dynamic>>());
        final failedResult = result as ResultFailed<String, dynamic>;
        expect(failedResult.error, isA<ServerNotRespondingFailure>());
      });
    });

    group('unwrapDioException', () {
      test(
        'должен возвращать ServerNotRespondingFailure для connectionTimeout',
        () {
          final exception = DioException(
            requestOptions: RequestOptions(path: '/test'),
            type: DioExceptionType.connectionTimeout,
          );

          final result = repository.testUnwrapDioException(exception);

          expect(result, isA<ServerNotRespondingFailure>());
        },
      );

      test('должен возвращать NoNetworkFailure для sendTimeout', () {
        final exception = DioException(
          requestOptions: RequestOptions(path: '/test'),
          type: DioExceptionType.sendTimeout,
        );
        final result = repository.testUnwrapDioException(exception);

        expect(result, isA<NoNetworkFailure>());
      });

      test('должен возвращать NoNetworkFailure для receiveTimeout', () {
        final exception = DioException(
          requestOptions: RequestOptions(path: '/test'),
          type: DioExceptionType.receiveTimeout,
        );

        final result = repository.testUnwrapDioException(exception);

        expect(result, isA<NoNetworkFailure>());
      });

      test('должен возвращать NoNetworkFailure для connectionError', () {
        final exception = DioException(
          requestOptions: RequestOptions(path: '/test'),
          type: DioExceptionType.connectionError,
        );

        final result = repository.testUnwrapDioException(exception);
        expect(result, isA<NoNetworkFailure>());
      });

      test(
        'должен возвращать BadRequestFailure для badResponse со статусом 400',
        () {
          final exception = DioException(
            requestOptions: RequestOptions(path: '/test'),
            type: DioExceptionType.badResponse,
            response: Response(
              requestOptions: RequestOptions(path: '/test'),
              statusCode: 400,
              data: {'code': 400, 'detail': 'Bad request'},
            ),
          );

          final result = repository.testUnwrapDioException(exception);

          expect(result, isA<BadRequestFailure>());
          final badRequestFailure = result as BadRequestFailure;
          expect(badRequestFailure.message, equals('Bad request'));
        },
      );

      test(
        'должен возвращать UnauthorizedFailure для badResponse со статусом 401',
        () {
          final exception = DioException(
            requestOptions: RequestOptions(path: '/test'),
            type: DioExceptionType.badResponse,
            response: Response(
              requestOptions: RequestOptions(path: '/test'),
              statusCode: 401,
            ),
          );

          final result = repository.testUnwrapDioException(exception);

          expect(result, isA<UnauthorizedFailure>());
        },
      );

      test(
        'должен возвращать BadRequestFailure для badResponse со статусом 404',
        () {
          final exception = DioException(
            requestOptions: RequestOptions(path: '/test'),
            type: DioExceptionType.badResponse,
            response: Response(
              requestOptions: RequestOptions(path: '/test'),
              statusCode: 404,
              data: {'code': 404, 'detail': 'Not found'},
            ),
          );

          final result = repository.testUnwrapDioException(exception);

          expect(result, isA<BadRequestFailure>());
          final badRequestFailure = result as BadRequestFailure;
          expect(badRequestFailure.message, equals('Not found'));
        },
      );

      test(
        'должен возвращать TooManyRequestsFailure для badResponse со статусом 429',
        () {
          final exception = DioException(
            requestOptions: RequestOptions(path: '/test'),
            type: DioExceptionType.badResponse,
            response: Response(
              requestOptions: RequestOptions(path: '/test'),
              statusCode: 429,
              data: {'code': 429, 'detail': 'Too many requests'},
            ),
          );

          final result = repository.testUnwrapDioException(exception);

          expect(result, isA<TooManyRequestsFailure>());
          final tooManyRequestsFailure = result as TooManyRequestsFailure;
          expect(tooManyRequestsFailure.message, equals('Too many requests'));
        },
      );

      test(
        'должен возвращать InternalServerFailure для badResponse со статусом 500',
        () {
          final exception = DioException(
            requestOptions: RequestOptions(path: '/test'),
            type: DioExceptionType.badResponse,
            response: Response(
              requestOptions: RequestOptions(path: '/test'),
              statusCode: 500,
            ),
          );

          final result = repository.testUnwrapDioException(exception);

          expect(result, isA<InternalServerFailure>());
        },
      );

      test(
        'должен возвращать UnknownNetworkFailure для badResponse с неизвестным статусом',
        () {
          final exception = DioException(
            requestOptions: RequestOptions(path: '/test'),
            type: DioExceptionType.badResponse,
            response: Response(
              requestOptions: RequestOptions(path: '/test'),
              statusCode: 418, // I'm a teapot
            ),
          );

          final result = repository.testUnwrapDioException(exception);

          // Assert
          expect(result, isA<UnknownNetworkFailure>());
        },
      );

      test(
        'должен возвращать UnknownNetworkFailure для неизвестного типа исключения',
        () {
          // Arrange
          final exception = DioException(
            requestOptions: RequestOptions(path: '/test'),
            type: DioExceptionType.unknown,
          );

          // Act
          final result = repository.testUnwrapDioException(exception);

          // Assert
          expect(result, isA<UnknownNetworkFailure>());
        },
      );

      test('должен обрабатывать badResponse без данных ответа', () {
        // Arrange
        final exception = DioException(
          requestOptions: RequestOptions(path: '/test'),
          type: DioExceptionType.badResponse,
          response: Response(
            requestOptions: RequestOptions(path: '/test'),
            statusCode: 400,
            data: null,
          ),
        );

        // Act
        final result = repository.testUnwrapDioException(exception);

        // Assert
        expect(result, isA<BadRequestFailure>());
        final badRequestFailure = result as BadRequestFailure;
        expect(badRequestFailure.message, isNull);
      });

      test('должен обрабатывать badResponse с некорректными данными JSON', () {
        // Arrange
        final exception = DioException(
          requestOptions: RequestOptions(path: '/test'),
          type: DioExceptionType.badResponse,
          response: Response(
            requestOptions: RequestOptions(path: '/test'),
            statusCode: 400,
            data: 'invalid json string',
          ),
        );

        // Act
        final result = repository.testUnwrapDioException(exception);

        // Assert
        expect(result, isA<BadRequestFailure>());
        final badRequestFailure = result as BadRequestFailure;
        expect(badRequestFailure.message, isNull);
      });
    });
  });
}
