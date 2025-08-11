import 'package:clean_archi/util/app_colors.dart';
import 'package:flutter/material.dart';

class ClickableRow extends StatelessWidget {
  const ClickableRow({
    super.key,
    required this.function,
    required this.title,
    this.fontSize, this.angle,
  });

  final VoidCallback function;
  final String title;
  final double? fontSize;
  final double? angle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GestureDetector(
        onTap: function,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: fontSize ?? 24,
              ),
            ),
            Transform.rotate(
              angle: angle??1.9,
              child: CircleAvatar(
                radius: 20,
                backgroundColor: AppColors.mainColorDarker,
                child: Center(
                  child: Icon(Icons.arrow_upward_outlined, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
