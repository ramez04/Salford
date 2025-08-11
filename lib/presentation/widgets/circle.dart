
import 'package:flutter/material.dart';

class Circle extends StatelessWidget {
  const Circle({super.key, required this.color, required this.widget});
  final Color color;
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(60),
      width: MediaQuery.sizeOf(context).width * 1.5,
      height: MediaQuery.sizeOf(context).width * 1.5,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      child: widget,
    );
  }
}
