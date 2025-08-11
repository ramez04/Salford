
import 'package:clean_archi/presentation/widgets/light_black_text.dart';
import 'package:clean_archi/util/app_general.dart';
import 'package:flutter/material.dart';

class SignInMethods extends StatelessWidget {
  const SignInMethods({super.key, required this.method, required this.image});
  final String method;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppGeneral.width! * .9,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image, scale: 1.4),
          SizedBox(width: 10),
          LightBlackText(
            text: "Sign in with $method",
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ],
      ),
    );
  }
}
