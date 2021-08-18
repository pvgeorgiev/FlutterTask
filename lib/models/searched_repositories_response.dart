import 'package:flutter_task/models/repository.dart';
import 'package:json_annotation/json_annotation.dart';

part 'searched_repositories_response.g.dart';

@JsonSerializable()
class SearchedRepositoriesResponse {

  @JsonKey(name: "total_count")
  int totalCount;

  List<Repository> items;

  SearchedRepositoriesResponse({required this.items, required this.totalCount});

  factory SearchedRepositoriesResponse.fromJson(Map<String, dynamic> json) => _$SearchedRepositoriesResponseFromJson(json);
  Map<String, dynamic> toJson() => _$SearchedRepositoriesResponseToJson(this);
}