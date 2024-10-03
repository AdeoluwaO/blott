// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class Spacing extends StatelessWidget {
  final double height;
  final double width;

  const Spacing.height(this.height) : width = 0;
  const Spacing.width(this.width) : height = 0;
  const Spacing.empty()
      : width = 0,
        height = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height, width: width);
  }
}