import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:flutter_task/models/repository.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: "https://api.github.com/")
abstract class RestClient {

  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/search/repositories")
  Future<List<Repository>> getRepositories(@Query("q") String q);

  @GET("/repositories")
  Future<List<Repository>> getAllRepositories();
}