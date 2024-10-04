import 'package:blott/features/finance_digest/domain/model.dart';

abstract class FinanceDigestRepo {
  Future<List<DigestNews>> getGeneralDigest();
}