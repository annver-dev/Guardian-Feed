import 'package:json_annotation/json_annotation.dart';

part 'filter_news_request_dto.g.dart';

@JsonSerializable()
class NewsFilters {
  final String? section;
  final DateTime? fromDate;
  final DateTime? toDate;
  final String? orderBy;

  NewsFilters({this.section, this.fromDate, this.toDate, this.orderBy});

  factory NewsFilters.fromJson(Map<String, dynamic> json) =>
      _$NewsFiltersFromJson(json);
}
