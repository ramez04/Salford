
import 'package:clean_archi/presentation/widgets/custom_back_button.dart';
import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          CustomBackButton(),
          Spacer(),
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 26),
          ),
          Spacer(),
          GestureDetector(
            onTap: () {},
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 20,
              child: Center(child: Icon(Icons.notifications)),
            ),
          ),
        ],
      ),
    );
  }
}
