import 'package:dio/dio.dart';

import 'api_exception.dart';

/// Thin read-only client for `https://bergmann-florian.ch/api/v1`.
class PortfolioApi {
  PortfolioApi(this._dio);

  /// Base URL without a trailing slash: `/api/v1/` answers with a redirect.
  static const baseUrl = 'https://bergmann-florian.ch/api/v1';

  factory PortfolioApi.create() {
    final dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 15),
        responseType: ResponseType.json,
        headers: {'Accept': 'application/json'},
      ),
    );
    return PortfolioApi(dio);
  }

  final Dio _dio;

  /// Fetches [path] (e.g. `/profile`) in [lang] and returns the decoded JSON.
  ///
  /// Throws an [ApiException] on failure.
  Future<Object?> get(String path, {required String lang}) async {
    try {
      final response = await _dio.get<Object?>(
        path,
        queryParameters: {'lang': lang},
      );
      return response.data;
    } on DioException catch (error) {
      throw ApiException.fromDio(error);
    }
  }
}
