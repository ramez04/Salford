import 'package:flutter/material.dart';

class LightBlackText extends StatelessWidget {
  const LightBlackText({
    super.key,
    required this.text,
    this.fontSize,
    this.fontWeight,
    this.letterSpacing,
  });
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? letterSpacing;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize ?? 26,
        fontWeight: fontWeight ?? FontWeight.w300,
        letterSpacing: letterSpacing ?? 3,
      ),
    );
  }
}
