import 'package:blott/core/services/config/base_response.dart';
import 'package:dio/dio.dart';

class AppException {
  //HANDLE ERROR
  static BaseResponse<T> handleError<T>(
    DioException e, {
    T? data,
  }) {
    if (DioExceptionType.connectionError == e.type) {
      return BaseResponse(
          statusCode: 99, data: data, message: 'No Internet Connection');
    } else if (e.response != null && DioExceptionType.badResponse == e.type) {
      if (e.response == null ||
          DioExceptionType.badResponse != e.type &&
              e.response!.statusCode! >= 500) {
        return BaseResponse(
          statusCode: e.response!.statusCode!,
          message: "A server error occurred",
          data: data,
        );
      }
      if (e.response?.data is Map<String, dynamic>) {
        return BaseResponse.fromJson(e.response?.data);
      } else if (e.response?.data is String) {
        return BaseResponse(
          statusCode: e.response!.statusCode,
          message: e.response?.data,
          data: data,
        );
      }
    }
    return BaseResponse(
      statusCode: e.response?.statusCode,
      data: data,
      message: _mapException(e.type),
    );
  }

  static _mapException(DioExceptionType? error) {
    if (DioExceptionType.connectionTimeout == error ||
        DioExceptionType.receiveTimeout == error ||
        DioExceptionType.sendTimeout == error) {
      return 'Connection Time Out';
    } else if (DioExceptionType.unknown == error) {
      return 'Please check your internet connection';
    }
    return "A server error occurred";
  }
}
