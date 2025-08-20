import 'package:json_annotation/json_annotation.dart';

part 'error_response_dto.g.dart';

/// Содержит себе всю информацию о произошедшей в логике на сервере ошибке.
@JsonSerializable(includeIfNull: false)
class ErrorResponseDto {
  /// Код ошибки.
  final int code;
  final String? detail;
  const ErrorResponseDto({required this.code, this.detail});

  factory ErrorResponseDto.fromJson(Map<String, dynamic> json) =>
      _$ErrorResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorResponseDtoToJson(this);
}
