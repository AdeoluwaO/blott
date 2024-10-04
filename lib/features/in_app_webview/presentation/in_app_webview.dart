import 'package:blott/core/utils/index.dart';
import 'package:blott/features/in_app_webview/domain/index.dart';
import 'package:blott/general_widgets.dart/index.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class InAppWebView extends StatefulWidget {
  static const String route = 'inappwebview_screen';

  const InAppWebView({super.key, required this.item});
  final InAppWebViewModel item;
  @override
  State<InAppWebView> createState() => _InAppWebViewState();
}

class _InAppWebViewState extends State<InAppWebView> {
  late WebViewController controller;

  bool isLoading = true;
  bool urlHasError = false;

  @override
  void initState() {
    super.initState();
    final url = widget.item.url;
    final isValidUrl = url != null && url.isNotEmpty;
    if (isValidUrl) {
      controller = WebViewController()
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..setBackgroundColor(const Color(0x00000000))
        ..setNavigationDelegate(
          NavigationDelegate(
            onProgress: (int progress) {
              if (progress == 100) {
                setState(() {
                  isLoading = false;
                });
              }
            },
            onPageStarted: (String url) {},
            onPageFinished: (String url) {},
            onHttpError: (HttpResponseError error) {
              setState(() {
                urlHasError = true;
                isLoading = false;
              });
            },
            onWebResourceError: (WebResourceError error) {
              setState(() {
                urlHasError = true;
                isLoading = false;
              });
            },
            onNavigationRequest: (NavigationRequest request) {
              if (request.url.startsWith('https://www.youtube.com/')) {
                return NavigationDecision.prevent;
              }
              return NavigationDecision.navigate;
            },
          ),
        )
        ..loadRequest(Uri.parse(widget.item.url!));
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      backgroundColor: AppColors.prupleBlack,
      appBar: AppBar(
        title: AppText(
          text: widget.item.title ?? 'Webview',
          style: AppTextStyle.headlineLarge.copyWith(color: AppColors.white),
        ),
        foregroundColor: AppColors.white,
        backgroundColor: AppColors.prupleBlack,
      ),
      body: _buildWidget(),
      floatingActionButton: urlHasError
          ? AppIconButton(
              icon: Icons.public_rounded,
              height: 56,
              width: 56,
              borderRadius: BorderRadius.circular(27),
              paddingSelf: const EdgeInsets.only(bottom: 24),
              onTap: () {
                launchUrl(Uri.parse(widget.item.url!),
                    mode: LaunchMode.externalApplication);
              },
            )
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }

  _buildWidget() {
    if (isLoading) {
      return const AppLoadingIndicator();
    } else if (urlHasError) {
      return AppErrorIndicator(
        errorMessaage: 'Oops !!! \n\nLink maybe be broken\nTry Browser',
        onTapTryAgain: () {
          setState(() {
            isLoading = true;
            urlHasError = false;
          });
          controller.loadRequest(Uri.parse(widget.item.url!));
        },
      );
    } else {
      return WebViewWidget(controller: controller);
    }
  }
}
