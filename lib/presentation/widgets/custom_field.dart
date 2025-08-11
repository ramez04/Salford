import 'package:clean_archi/util/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomField extends StatelessWidget {
  const CustomField({
    super.key,
    this.controller,
    required this.hint,
    this.suffix,
    required this.preffix,
    this.obsecure,
    this.borderRadius,
    this.borderColor,
    this.onChanged,
    this.keyboardType,
    this.maxLength,
    this.inputFormatters,
  });
  final TextEditingController? controller;
  final String hint;
  final Widget? suffix;
  final Widget preffix;
  final bool? obsecure;
  final double? borderRadius;
  final Color? borderColor;
  final ValueChanged? onChanged;
  final TextInputType? keyboardType;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obsecure ?? false,
      onChanged: onChanged,
      maxLength: maxLength,
      inputFormatters: inputFormatters ?? [],
      buildCounter: (
        BuildContext context, {
        required int currentLength,
        required int? maxLength,
        required bool isFocused,
      }) {
        return null;
      },
      keyboardType: keyboardType ?? TextInputType.name,
      decoration: InputDecoration(
        hintText: hint,
        fillColor: Colors.white,
        filled: true,
        prefixIcon: preffix,
        suffixIcon: suffix ?? SizedBox(),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 16),
          borderSide: BorderSide(color: Colors.transparent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 16),
          borderSide: BorderSide(
            color: borderColor ?? AppColors.mainColorDarker,
          ),
        ),
      ),
    );
  }
}
