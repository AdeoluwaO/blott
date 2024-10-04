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
    final newsDigestData = ref.watch(generalDigestProvider);
    return AppScaffold(
      appBar: AppBar(
        title: AppText(
          text: 'Hey ${user?.firstName} ${user?.lastName}',
          style: AppTextStyle.headlineLarge.copyWith(color: AppColors.white),
        ),
        automaticallyImplyLeading: false,
        centerTitle: false,
        backgroundColor: AppColors.prupleBlack,
      ),
      applySafeArea: false,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      backgroundColor: AppColors.primary,
      body: _buildWidget(newsDigestData),
    );
  }

  Widget _buildWidget(FinanceDigestNotifierState newsDigestData) {
    switch (newsDigestData.loadState) {
      case null:
        return const AppLoadingIndicator();
      case LoadState.loading:
        return const AppLoadingIndicator();
      case LoadState.success:
        if ((newsDigestData.digestNews?.length ?? 0) > 0) {
          return RefreshIndicator(
            onRefresh: () async {
              ref.read(generalDigestProvider.notifier).getGeneralDigestNews();
            },
            child: AppListViewBuilder(
              itemCount: newsDigestData.digestNews?.length ?? 0,
              itemBuilder: (context, index) {
                final digest = newsDigestData.digestNews?[index];
                return NewsItemWidget(
                  source: digest?.source ?? '',
                  image: digest?.image ?? '',
                  headline: digest?.headline ?? '',
                  date: digest?.datetime ?? DateTime.now(),
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      RouteGenerator.inAppWebview,
                      arguments: InAppWebViewModel(
                        title: digest?.source,
                        url: digest?.url,
                      ),
                    );
                  },
                );
              },
            ),
          );
        } else {
          return AppErrorIndicator(
            errorMessaage: "Something went wrong. Please try again later.",
            buttonTitle: 'Retry',
            onTapTryAgain: () {
              ref.read(generalDigestProvider.notifier).getGeneralDigestNews();
            },
          );
        }
      case LoadState.error:
        return AppErrorIndicator(
          onTapTryAgain: () {
            ref.read(generalDigestProvider.notifier).getGeneralDigestNews();
          },
        );
      default:
        return const AppLoadingIndicator();
    }
  }
}
