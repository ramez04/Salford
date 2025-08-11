import 'package:flutter/material.dart';

class ActionIcon extends StatelessWidget {
  const ActionIcon({super.key, this.function, required this.widget, this.backgroundImage});
  final VoidCallback? function;
  final Widget widget;
  final ImageProvider? backgroundImage;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: function,
      icon: CircleAvatar(
        backgroundColor: Colors.white,
        backgroundImage: backgroundImage,
        child: Center(child: widget),
      ),
    );
  }
}
