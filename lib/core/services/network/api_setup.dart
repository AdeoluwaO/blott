import 'package:blott/core/services/network/network_exceptions_handler.dart';
import 'package:blott/core/utils/index.dart';
import 'package:blott/general_widgets.dart/index.dart';
import 'package:dio/dio.dart';

Future<T?> sendRequest<T>({
  required String method,
  required String endpoint,
  Map<String, dynamic>? data,
  Map<String, dynamic>? queryParams,
  Options? options,
  bool requiresAuth = true,
}) async {
  final methodToUppercase = method.toUpperCase();
  try {
    final baseApiSetup =
        Dio(BaseOptions(baseUrl: 'https://finnhub.io/api/v1'));
    const demoToken = 'Paul';
    final response = await baseApiSetup.request(
      endpoint,
      queryParameters: {
        ...?queryParams,
        'token': AppConstants.apiKey,
      },
      options: options ??
          Options(
            method: methodToUppercase,
            headers:
                requiresAuth ? {"Authorization": "Bearer $demoToken"} : null,
          ),
      data: data ?? {},
    );
    return response.data as T;
  } on DioException catch (err) {
    final handledError = AppException.handleError(err);
    showToast(message: handledError.message.toString(), isError: true);
    return handledError as T;
  }
}
