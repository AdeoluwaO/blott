import 'package:blott/features/in_app_webview/domain/model.dart';
import 'package:flutter/cupertino.dart';
import 'package:blott/core/routers/route_exports.dart';

class RouteGenerator {
  const RouteGenerator._();

  static const auth = "auth_screen";
  static const permissions = "permissions_screen";
  static const news = "news_screen";
  static const inAppWebview = "in_app_webview";

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case auth:
        return trasnsitionRouter(screenWidget: const CreateAccountScreen());
      case permissions:
        return trasnsitionRouter(screenWidget: const PermissionsScreen());
      case news:
        return trasnsitionRouter(screenWidget: const FinanceDigestScreen());
      case inAppWebview:
      final webviewItemModel = settings.arguments as InAppWebViewModel;
        return trasnsitionRouter(screenWidget:  InAppWebView(item: webviewItemModel), fullscreenDialog: true);
      default:
        throw UnimplementedError('Route not found');
    }
  }
}

trasnsitionRouter(
    {required Widget screenWidget, bool fullscreenDialog = false}) {
  return CupertinoPageRoute(
      fullscreenDialog: fullscreenDialog, builder: (context) => screenWidget);
}
