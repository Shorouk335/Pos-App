import 'package:e_ticket_app/core/constant/constant.dart';
import 'package:dio/dio.dart';
import 'package:e_ticket_app/core/data_service/hive/hive.dart';
import 'package:e_ticket_app/shared/widgets/showSmartDialog.dart';

class DioService {
  Dio myDio = Dio();

  DioService() {
    myDio = Dio(BaseOptions(
      baseUrl: kBaseUrl,
      headers: {
        "Accept": "application/json",
        'Content-Type': "application/json",
        'Authorization': 'Bearer ${HiveService.getUserToken()}'
      },
      contentType: "application/json",
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(seconds: 30),
    ))
      ..interceptors.add(
        LogInterceptor(
          responseBody: true,
          requestBody: true,
        ),
      );
  }

  Future<Response> get(
      {required String url, Map<String, dynamic>? queryParameters}) async {
    try {
      Response response = await myDio.get(
        url,
        queryParameters: queryParameters,
      );
      return response;
    } on DioException {
      rethrow;
    } catch (ex) {
      throw Exception(ex);
    }
  }

  Future<Response> post(
      {required String url,
      required Map<String, dynamic> body,
      Map<String, dynamic>? queryParameters}) async {
    ShowSmartDialog.show();
    try {
      Response response =
          await myDio.post(url, data: body, queryParameters: queryParameters);

      ShowSmartDialog.dismes();
      return response;
    } on DioException {
      ShowSmartDialog.dismes();
      rethrow;
    } catch (ex) {
      ShowSmartDialog.dismes();
      throw Exception(ex);
    }
  }

  Future<Response> put({
    required String url,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? body,
  }) async {
    try {
      Response response = await myDio.put(
        url,
        data: body,
        queryParameters: queryParameters,
      );
      return response;
    } on DioException {
      rethrow;
    } catch (ex) {
      throw Exception(ex);
    }
  }

  Future<Response> delete({
    required String url,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? body,
  }) async {
    try {
      Response response = await myDio.delete(
        url,
        data: body,
        queryParameters: queryParameters,
      );
      return response;
    } on DioException {
      rethrow;
    } catch (ex) {
      throw Exception(ex);
    }
  }
}
