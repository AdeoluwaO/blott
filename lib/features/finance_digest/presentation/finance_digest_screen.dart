import 'package:blott/core/routers/route_generator.dart';
import 'package:blott/core/store/profile_store/profile_store.dart';
import 'package:blott/core/utils/index.dart';
import 'package:blott/features/finance_digest/notifier/finance_digest_notifier.dart';
import 'package:blott/features/finance_digest/notifier/finance_digest_notifier_state.dart';
import 'package:blott/features/finance_digest/presentation/widgets/news_item_widget.dart';
import 'package:blott/features/in_app_webview/domain/model.dart';
import 'package:blott/general_widgets.dart/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FinanceDigestScreen extends ConsumerStatefulWidget {
  const FinanceDigestScreen({super.key});

  @override
  ConsumerState<FinanceDigestScreen> createState() =>
      _FinanceDigestScreenState();
}

class _FinanceDigestScreenState extends ConsumerState<FinanceDigestScreen> {
  User? user;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        ref.read(generalDigestProvider.notifier).getGeneralDigestNews();
        final response = await UserStore.getStoredProfile();
        setState(() {
          user = response;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final digestState = ref.watch(generalDigestProvider);
    return AppScaffold(
      appBar: AppBar(
        title: AppText(
          text: 'Hey ${user?.firstName} ${user?.lastName}',
          style: AppTextStyle.headlineLarge.copyWith(color: AppColors.white),
        ),
        automaticallyImplyLeading: false,
        centerTitle: false,
        backgroundColor: AppColors.prupleBlack,
        // toolbarHeight: 181,
      ),
      applySafeArea: false,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      backgroundColor: AppColors.primary,
      body: _buildWidget(digestState),
    );
  }

  Widget _buildWidget(FinanceDigestNotifierState digestState) {
    switch (digestState.loadState) {
      case null:
        return const AppLoadingIndicator();
      case LoadState.loading:
        return const AppLoadingIndicator();
      case LoadState.success:
        return AppListViewBuilder(
          itemCount: digestState.digestNews?.length ?? 0,
          itemBuilder: (context, index) {
            final digest = digestState.digestNews?[index];
            return NewsItemWidget(
              source: digest?.source ?? '',
              image: digest?.image ?? '',
              headline: digest?.headline ?? '',
              date: digest?.datetime ?? DateTime.now(),
              onTap: () {
                Navigator.pushNamed(context, RouteGenerator.inAppWebview,
                    arguments: InAppWebViewModel(
                        title: digest?.source, url: digest?.url));
              },
            );
          },
        );
      case LoadState.error:
        return AppErrorIndicator(
          onTapTryAgain: () {
            ref.read(generalDigestProvider.notifier).getGeneralDigestNews();
          },
        );
      case LoadState.loadmore:
      case LoadState.none:
        return const AppLoadingIndicator();
      default:
        return const AppLoadingIndicator();
    }
  }
}
