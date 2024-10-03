import 'package:flutter/cupertino.dart';
import 'package:blott/core/routers/route_exports.dart';

class RouteGenerator {
  const RouteGenerator._();

  static const permissions = "permissions_screen";
  static const news = "news_screen";
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case permissions:
        return trasnsitionRouter(screenWidget: const PermissionsScreen());
      case news:
        return trasnsitionRouter(screenWidget: const NewsScreen());
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
