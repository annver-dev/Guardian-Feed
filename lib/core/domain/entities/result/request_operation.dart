import 'package:places_search/core/domain/entities/failure/failure.dart';
import 'package:places_search/core/domain/entities/result/result.dart';

typedef RequestOperation<T> = Future<Result<T, Failure>>;
