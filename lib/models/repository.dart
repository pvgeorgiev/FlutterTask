import 'package:flutter_task/models/owner.dart';
import 'package:json_annotation/json_annotation.dart';

part 'repository.g.dart';

@JsonSerializable()
class Repository {

  int? id;
  String? name;
  Owner owner;

  @JsonKey(name: "node_id")
  String? nodeId;

  @JsonKey(name: "full_name")
  String? fullName;

  Repository({this.id, this.name, this.fullName, required this.owner, this.nodeId});

  factory Repository.fromJson(Map<String, dynamic> json) => _$RepositoryFromJson(json);
  Map<String, dynamic> toJson() => _$RepositoryToJson(this);
}