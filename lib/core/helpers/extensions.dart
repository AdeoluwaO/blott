import 'package:flutter/material.dart';


extension IconExtension on Icon {
  Widget addTapGesture({required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: this,
    );
  }
}

extension StatelessExtension on StatelessWidget {
  Widget addTapGesture({required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: this,
    );
  }
}

extension StringExtension on String {
  obscureStringCharacters({String? obscureCharater}) {
    return replaceAll(RegExp(r'.'), obscureCharater ?? "*");
  }
}
