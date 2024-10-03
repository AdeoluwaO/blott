import 'package:flutter/material.dart';


class AppListView extends StatelessWidget {
  const AppListView({
    super.key,
    required this.children,
    this.shrinkWrap = false,
    this.padding,
    this.scrollDirection,
    this.scrollController,
    this.height,
    this.width,
    this.physics,
    this.keyboardDismissBehavior,
  });
  final List<Widget> children;
  final bool shrinkWrap;
  final EdgeInsets? padding;
  final Axis? scrollDirection;
  final ScrollController? scrollController;
  final ScrollPhysics? physics;
 final double? height,width;
  final ScrollViewKeyboardDismissBehavior? keyboardDismissBehavior;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ListView(
        shrinkWrap: shrinkWrap,
        physics: physics,
        controller: scrollController,
        keyboardDismissBehavior:
            keyboardDismissBehavior ?? ScrollViewKeyboardDismissBehavior.onDrag,
        scrollDirection: scrollDirection ?? Axis.vertical,
        padding: padding,
        children: children,
      ),
    );
  }
}

class AppListViewBuilder extends StatelessWidget {
  const AppListViewBuilder({
    super.key,
    required this.itemBuilder,
    required this.itemCount,
    this.shrinkWrap = false,
    this.padding,
    this.physics,
    this.scrollDirection,
    this.scrollController,
    this.height,
    this.width,
    this.decoration,
    this.alignSelf,
    this.alignContent,
    this.keyboardDismissBehavior,
  });
  final Widget? Function(BuildContext context, int index) itemBuilder;
  final int? itemCount;
  final bool shrinkWrap;
  final EdgeInsetsGeometry? padding;
  final ScrollPhysics? physics;
  final Axis? scrollDirection;
  final ScrollController? scrollController;
  final double? height, width;
  final BoxDecoration? decoration;
  final AlignmentGeometry? alignSelf, alignContent;
  final ScrollViewKeyboardDismissBehavior? keyboardDismissBehavior;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignSelf ?? Alignment.topLeft,
      child: Container(
        alignment: alignContent,
        height: height,
        width: width,
        decoration: decoration,
        child: ListView.builder(
          itemBuilder: itemBuilder,
          itemCount: itemCount ?? 0,
          padding: padding,
          scrollDirection: scrollDirection ?? Axis.vertical,
          keyboardDismissBehavior: keyboardDismissBehavior ??
              ScrollViewKeyboardDismissBehavior.manual,
          controller: scrollController,
          shrinkWrap: shrinkWrap,
          physics: physics,
        ),
      ),
    );
  }
}

class AppListViewSeperated extends StatelessWidget {
  const AppListViewSeperated({
    super.key,
    required this.itemBuilder,
    required this.itemCount,
    required this.separatorBuilder,
    this.shrinkWrap = false,
    this.padding,
    this.physics,
    this.scrollDirection,
    this.scrollController,
    this.height,
    this.width,
    this.decoration,
    this.alignSelf,
    this.alignContent,
    this.keyboardDismissBehavior,
  });
  final Widget? Function(BuildContext context, int index) itemBuilder;
  final Widget Function(BuildContext context, int index) separatorBuilder;
  final int? itemCount;
  final EdgeInsetsGeometry? padding;
  final bool shrinkWrap;
  final ScrollPhysics? physics;
  final Axis? scrollDirection;
  final ScrollController? scrollController;
  final double? height, width;
  final BoxDecoration? decoration;
  final AlignmentGeometry? alignSelf, alignContent;
  final ScrollViewKeyboardDismissBehavior? keyboardDismissBehavior;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignSelf ?? Alignment.topLeft,
      child: Container(
        height: height,
        width: width,
        alignment: alignContent,
        decoration: decoration,
        child: ListView.separated(
          itemBuilder: itemBuilder,
          padding: padding,
          itemCount: itemCount ?? 0,
          shrinkWrap: shrinkWrap,
          controller: scrollController,
          scrollDirection: scrollDirection ?? Axis.vertical,
          keyboardDismissBehavior: keyboardDismissBehavior ??
              ScrollViewKeyboardDismissBehavior.manual,
          physics: physics,
          separatorBuilder: separatorBuilder,
        ),
      ),
    );
  }
}
