import 'package:blott/features/finance_digest/domain/api.dart';
import 'package:blott/features/finance_digest/domain/model.dart';
import 'package:blott/features/finance_digest/domain/repositiories.dart';

class FinanceDigestImpl implements FinanceDigestRepo {
  @override
  Future<List<DigestNews>> getGeneralDigest() async {
    final digestNews = await FinanceDigestDomain.getGeneralDigest();
    return digestNews ?? [];
  }
}
