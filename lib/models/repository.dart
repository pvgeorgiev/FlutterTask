import 'package:json_annotation/json_annotation.dart';

part 'repository.g.dart';

@JsonSerializable()
class Repository {
  int? id;
  String? nodeId;
  String? name;
  String? fullName;

  Repository({this.id, this.nodeId, this.name, this.fullName});

  factory Repository.fromJson(Map<String, dynamic> json) => _$RepositoryFromJson(json);
  Map<String, dynamic> toJson() => _$RepositoryToJson(this);
}