import 'package:clean_archi/util/app_colors.dart';
import 'package:flutter/material.dart';

class ThickBlueText extends StatelessWidget {
  const ThickBlueText({super.key, required this.text, this.fontSize});
  final String text;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: AppColors.mainColorLighter,
        fontSize: fontSize?? 60,
        fontWeight: FontWeight.w900,
      ),
    );
  }
}
