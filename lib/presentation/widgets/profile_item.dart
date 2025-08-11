
import 'package:clean_archi/presentation/widgets/clickable_row.dart';
import 'package:clean_archi/util/app_general.dart';
import 'package:flutter/material.dart';

class ProfileItem extends StatelessWidget {
  const ProfileItem({super.key, required this.title, required this.function});
  final String title;
  final VoidCallback function;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppGeneral.width,
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: ClickableRow(
        function: function,
        title: title,
        fontSize: 20,
        angle: 1,
      ),
    );
  }
}
