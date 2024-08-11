import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:freelancer_app/core/constants/app_storage.dart';

class ApiService {
  final _baseUrl = 'http://192.168.1.9:8000/api/';

  final Dio _dio;

  static var storage = const FlutterSecureStorage();
  ApiService(this._dio);

  Future<Map<String, dynamic>> get({
    required String endPoint,
    String? id,
  }) async {
    String? token = await AppStorage.getToken();
    _dio.options.headers['Accept'] = 'application/json';
    _dio.options.headers['Authorization'] = 'Bearer $token';

    String uri = id == null ? '$_baseUrl$endPoint' : '$_baseUrl$endPoint$id';

    var response = await _dio.get(uri);
    return response.data;
  }

  Future<Map<String, dynamic>> post({
    required String endPoint,
    Map<String, dynamic>? body,
  }) async {
    String? token = await AppStorage.getToken();
    _dio.options.headers['Accept'] = 'application/json';
    _dio.options.headers['Authorization'] = 'Bearer $token';

    var response = await _dio.post('$_baseUrl$endPoint', data: body);

    return response.data;
  }

  Future<Map<String, dynamic>> delete({
    required String endPoint,
  }) async {
    String? token = await AppStorage.getToken();
    _dio.options.headers['Accept'] = 'application/json';
    _dio.options.headers['Authorization'] = 'Bearer $token';
    var response = await _dio.delete('$_baseUrl$endPoint');

    return response.data;
  }
}
