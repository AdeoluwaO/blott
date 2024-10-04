import 'package:blott/core/routers/route_generator.dart';
import 'package:blott/core/store/profile_store/profile_store.dart';
import 'package:blott/core/utils/index.dart';
import 'package:blott/general_widgets.dart/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        final navigator = Navigator.of(context); // USE CONTEXT BEFORE ASYNC GAP 
        final User? user = await UserStore.getStoredProfile();
        if (user?.isLoggedIn ?? false) {
          navigator.pushReplacementNamed(RouteGenerator.news);
        } else {
          navigator.pushReplacementNamed(RouteGenerator.auth);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: SvgPicture.asset(AppImages.logo),
      ),
    );
  }
}
