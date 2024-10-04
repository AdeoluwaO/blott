import 'package:blott/core/utils/app_enums.dart';
import 'package:blott/features/finance_digest/data/finance_digest_impl.dart';
import 'package:blott/features/finance_digest/notifier/finance_digest_notifier_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FinanceDigestNotifier extends StateNotifier<FinanceDigestNotifierState> {
  FinanceDigestNotifier() : super(FinanceDigestNotifierState.initialState());

  Future getGeneralDigestNews() async {
    try {
      state = state.copyWith(loadState: LoadState.loading);
      final response = await FinanceDigestImpl().getGeneralDigest();
      state =
          state.copyWith(loadState: LoadState.success, digestNews: response);
    } catch (e) {
      state = state.copyWith(loadState: LoadState.error, errorMessage: '$e');
    } 
  }
}

final generalDigestProvider =
    StateNotifierProvider<FinanceDigestNotifier, FinanceDigestNotifierState>(
  (_) => FinanceDigestNotifier(),
);
