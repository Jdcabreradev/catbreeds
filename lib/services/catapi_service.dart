import 'package:catbreeds/env/env.dart';
import 'package:catbreeds/models/cat_entity.dart';
import 'package:dio/dio.dart';

class CatAPIService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.thecatapi.com/v1',
      headers: {'x-api-key': API_KEY},
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
    ),
  );

  Future<List<CatEntity>> fetchBreeds({int limit = 10, int page = 0}) async {
    return _makeRequest(
      '/breeds',
      queryParameters: {'limit': limit, 'page': page},
    );
  }

  Future<List<CatEntity>> searchBreeds({required String query}) async {
    return _makeRequest('/breeds/search', queryParameters: {'q': query});
  }

  Future<List<CatEntity>> _makeRequest(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _dio.get<List<dynamic>>(
        endpoint,
        queryParameters: queryParameters,
      );

      final data = response.data;
      if (data == null || data.isEmpty) return <CatEntity>[];

      return data
          .map((json) => CatEntity.fromJson(json as Map<String, dynamic>))
          .toList();
    } on DioException {
      return <CatEntity>[];
    }
  }
}
