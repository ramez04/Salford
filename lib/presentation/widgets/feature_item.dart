
import 'package:flutter/material.dart';

class SubscriptionFeature extends StatelessWidget {
  const SubscriptionFeature({
    super.key,
    required this.text,
    required this.featured,
  });
  final String text;
  final bool featured;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: featured ? Colors.white : Colors.redAccent,
          radius: 15,
          child: Center(
            child: Icon(
              featured ? Icons.check : Icons.close,
              color: featured ? Colors.black : Colors.white,
            ),
          ),
        ),
        SizedBox(width: 15),
        Text(
          text,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
