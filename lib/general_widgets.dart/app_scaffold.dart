import 'package:blott/core/helpers/helper_functions.dart';
import 'package:blott/core/utils/index.dart';
import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    super.key,
    required this.body,
    this.backgroundColor,
    this.appBar,
    this.padding,
    this.applySafeArea = true,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
  });
  final Widget body;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final Widget? bottomNavigationBar;
  final PreferredSizeWidget? appBar;
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor;
  final bool applySafeArea;

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: appBar,
      backgroundColor: backgroundColor ?? AppColors.white,
      body: Padding(
        padding: (HelperFunctions.isAndroid() && applySafeArea) // BOTTOM SAFE AREA SETUP FOR ANDROID 
            ? const EdgeInsets.only(bottom: 16)
            : EdgeInsets.zero,
        child: SafeArea(
          left: false,
          right: false,
          top: applySafeArea,
          bottom: applySafeArea,
          child: Padding(
            padding: padding ?? const EdgeInsets.symmetric(horizontal: 24),
            child: body,
          ),
        ),
        
      ),
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation,  
    );
  }
}