import 'dart:io';

import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';


import '../../platform/env_config.dart';
import '../../utils/logger.dart';
import 'network_config.dart';
import 'network_exceptions.dart';
import 'network_interceptor.dart';
import 'network_service.dart';
import 'network_service_response.dart';

/// Basic HTTP request service wrapper around the common
/// HTTP Methods: GET, POST, PUT, PATCH, DELETE
class NetworkServiceImpl implements NetworkService {
  static var networkSetupOptions = BaseOptions(
    //include request timeout of 60secs to through exception
    connectTimeout:  const Duration(seconds: 3000),
    followRedirects: true,
    baseUrl: EnvConfig.instance!.values!.baseUrl,
  );

  NetworkConfig? _networkConfiguration;
  final Dio _dio = Dio(networkSetupOptions);


  ///  Instantiate [NetworkServiceImpl] without [NetworkInterceptor]s
  ///
  ///  '''
  ///   You can instantiate the [NetworkServiceImpl] using its named
  ///   constructor withInterceptors eg.
  ///      List<NetworkInterceptor>  interceptors;
  ///      NetworkServices.withInterceptors(interceptors);
  ///
  ///  '''
  ///  Instantiate [NetworkServiceImpl] with [NetworkInterceptor]s
  NetworkServiceImpl({
    NetworkConfig? networkConfiguration,
    NetworkInterceptor? interceptor,
  }) {
    try {
      _networkConfiguration = networkConfiguration!;
      registerInterceptor(interceptor!);
    } catch (e) {
      logger.e("Error while registering interceptors");
    }
  }

  /// Add an interceptor to the internal network request handler
  registerInterceptor(NetworkInterceptor? interceptor) {
    if (interceptor == null) {
      throw Exception(
        "Interceptor cannot be null",
      );
    }
    if (_dio.interceptors.contains(interceptor)) return;
    _dio.interceptors.add(interceptor);
  }

  /// Add list of interceptors to the internal network request handler
  registerInterceptors(List<NetworkInterceptor>? interceptors) {
    if (interceptors == null) {
      throw Exception(
        "Interceptors cannot be null",
      );
    }

    for (var interceptor in interceptors) {
      if (!_dio.interceptors.contains(interceptor)) {
        _dio.interceptors.add(interceptor);
      }
    }
  }

  @override
  Future<NetworkServiceResponse> get(String url,
      {Map<String, dynamic>? queryParameters}) async {
    Response response;
    try {
      response = await _dio.get(
        url,
        options: Options(headers: _networkConfiguration!.headers),
        queryParameters: queryParameters,
      );

      return NetworkServiceResponse(
          result: NetworkResult.SUCCESS, data: response.data);
    } on DioException catch (e, trace) {
      logger.e(e);
      return handleException(e, trace);
    }
  }

  @override
  Future<NetworkServiceResponse> post(String url, {Map<String, dynamic>? body, Map<String, dynamic>? queryParameters}) async {
    Response response;
    try {
      response = await _dio.post(
        url,
        options: Options(headers: _networkConfiguration!.headers),
        queryParameters: queryParameters,
        data: body,
      );

      return NetworkServiceResponse(
        result: NetworkResult.SUCCESS,
        data: response.data,
      );
    } on DioException catch (e, trace) {
      logger.e(e,stackTrace: trace);
      return handleException(e, trace);
    }
  }

  @override
  Future<NetworkServiceResponse> delete(String url, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
  }) async {
    Response response;
    try {
      response = await _dio.delete(
        url,
        options: Options(headers: _networkConfiguration!.headers),
        queryParameters: queryParameters,
        data: body,
      );
      return NetworkServiceResponse(
        result: NetworkResult.SUCCESS,
        data: response.data,
      );
    } on DioException catch (e, trace) {
      logger.e(e);
      return handleException(e, trace);
    }
  }

  @override
  Future<NetworkServiceResponse> patch(String url, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
  }) async {
    Response response;
    try {
      response = await _dio.patch(
        url,
        options: Options(headers: _networkConfiguration!.headers),
        queryParameters: queryParameters,
        data: body,
      );

      return NetworkServiceResponse(
        result: NetworkResult.SUCCESS,
        data: response.data,
      );
    } on DioException catch (e, trace) {
      logger.e(e);
      return handleException(e, trace);
    }
  }

  @override
  Future<NetworkServiceResponse> put(String url, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
  }) async {
    Response response;
    try {
      response = await _dio.put(
        url,
        options: Options(headers: _networkConfiguration!.headers),
        queryParameters: queryParameters,
        data: body,
      );
      return NetworkServiceResponse(
        result: NetworkResult.SUCCESS,
        data: response.data,
      );
    } on DioException catch (e, trace) {
      logger.e(e.message);
      return handleException(e, trace);
    }
  }


  @override
  Future<NetworkServiceResponse> postMultipart(
      String url, {
        required XFile file,
        String fileFieldName = "file",
        Map<String, dynamic>? fields,
        Map<String, dynamic>? queryParameters,
      }) async {
    try {
      final fileName = file.path.split('/').last;
      final formData = FormData.fromMap({
        if (fields != null) ...fields, // additional form fields
        fileFieldName: await MultipartFile.fromFile(
          file.path,
          filename: fileName,
        ),
      });

      final response = await _dio.post(
        url,
        data: formData,
        queryParameters: queryParameters,
        options: Options(
          headers: {
            "Content-Type": "multipart/form-data",
            "Accept": "application/json",
          },
        ),
      );

      return NetworkServiceResponse(
        result: NetworkResult.SUCCESS,
        data: response.data,
      );
    } on DioException catch (e, trace) {
      logger.e(e.message);
      return handleException(e, trace);
    }
  }

}
