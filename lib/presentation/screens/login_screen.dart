import 'package:clean_archi/presentation/controller/login_controller.dart';
import 'package:clean_archi/presentation/widgets/button.dart';
import 'package:clean_archi/presentation/widgets/custom_field.dart';
import 'package:clean_archi/presentation/widgets/grey_text.dart';
import 'package:clean_archi/presentation/widgets/light_black_text.dart';
import 'package:clean_archi/presentation/widgets/sign_in_methods.dart';
import 'package:clean_archi/presentation/widgets/thick_blue_text.dart';
import 'package:clean_archi/util/Routes/route_strings.dart';
import 'package:clean_archi/util/app_colors.dart';
import 'package:clean_archi/util/app_general.dart';
import 'package:clean_archi/util/app_images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (con) {
        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: AppColors.backgroundColor,
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  SizedBox(height: AppGeneral.height! * .1),

                  ThickBlueText(text: 'Login', fontSize: 50),
                  GreyText(text: "Enter your details to log in"),
                  SizedBox(height: 50),

                  CustomField(
                    hint: "abc@gmail.com",
                    preffix: Image.asset(AppImages.mail),
                    controller: con.email.value,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 20),
                  Obx(
                    () => CustomField(
                      hint: "Enter password",
                      preffix: Image.asset(AppImages.lock),
                      controller: con.password.value,
                      obsecure: con.obsecure.value,
                      keyboardType: TextInputType.visiblePassword,

                      suffix: IconButton(
                        onPressed: () {
                          con.toggleObsecure();
                        },
                        icon: Icon(
                          con.obsecure.value
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 25),

                  GestureDetector(
                    onTap: () => con.login(),
                    child: Button(text: "Login", width: AppGeneral.width! * .9),
                  ),
                  Row(
                    children: [
                      Obx(
                        () => Transform.scale(
                          scale: .8,
                          child: Switch(
                            activeColor: Colors.white,
                            activeTrackColor: AppColors.mainColorDarker,
                            inactiveTrackColor: Colors.white,
                            inactiveThumbColor: AppColors.mainColorDarker,
                            value: con.rememberMe.value,
                            onChanged: (v) {
                              con.toggleRememberMe();
                            },
                          ),
                        ),
                      ),
                      LightBlackText(
                        letterSpacing: 1,
                        text: "Remeber me",
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                      Spacer(),
                      LightBlackText(
                        letterSpacing: 1,
                        text: "Forgot password?",
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                  Text(
                    "Or",
                    style: TextStyle(
                      fontSize: 20,
                      color: const Color(0xff6e6e6e),
                    ),
                  ),
                  SizedBox(height: 25),

                  SignInMethods(method: "Google", image: AppImages.google),
                  SizedBox(height: 15),

                  SignInMethods(method: "Apple", image: AppImages.apple),
                  Spacer(flex: 2),
                  GestureDetector(
                    onTap: () {
                      Get.offAndToNamed(
                        RouteStrings.signup,
                        arguments: con.email.value.text,
                      );
                    },
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Don't have an account?",
                            style: TextStyle(
                              color: Color(0xff6e6e6e),
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          TextSpan(
                            text: " Sign up here",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: AppColors.mainColorDarker,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
