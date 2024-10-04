import 'package:blott/core/services/network/api_endpoints.dart';
import 'package:blott/core/services/network/api_setup.dart';
import 'package:blott/features/finance_digest/domain/model.dart';

class FinanceDigestDomain {
  static Future<List<DigestNews>?> getGeneralDigest() async {
    try {
      final response = await sendRequest(
        method: 'gEt',
        endpoint: ApiEndpoints.news,
        queryParams: {'category': 'general'},
        requiresAuth: false,
      );
      final modeledResponse =
          (response as List).map((digest) => DigestNews.fromJson(digest)).toList();
      return modeledResponse;
    } catch (err) {
      return null;
    }
  }
}
