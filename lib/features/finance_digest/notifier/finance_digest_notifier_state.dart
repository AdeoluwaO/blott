import 'package:blott/core/utils/app_enums.dart';
import 'package:blott/features/finance_digest/domain/model.dart';

class FinanceDigestNotifierState {
  final LoadState? loadState;
  final String? errorMessage;
  final List<DigestNews>? digestNews;

  FinanceDigestNotifierState({
    required this.loadState,
    this.errorMessage,
    this.digestNews,
  });

  factory FinanceDigestNotifierState.initialState() {
    return FinanceDigestNotifierState(
      loadState: LoadState.none,
      errorMessage: null,
      digestNews: null,
    );
  }

  FinanceDigestNotifierState copyWith({
    LoadState? loadState,
    String? errorMessage,
    List<DigestNews>? digestNews
  }) {
    return FinanceDigestNotifierState(
      loadState: loadState ?? this.loadState,
      errorMessage: errorMessage ?? this.errorMessage,
      digestNews: digestNews ?? this.digestNews,
    );
  }

}
