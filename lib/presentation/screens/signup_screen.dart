import 'package:clean_archi/presentation/controller/signup_controller.dart';
import 'package:clean_archi/presentation/widgets/button.dart';
import 'package:clean_archi/presentation/widgets/custom_field.dart';
import 'package:clean_archi/presentation/widgets/grey_text.dart';
import 'package:clean_archi/presentation/widgets/thick_blue_text.dart';
import 'package:clean_archi/util/Routes/route_strings.dart';
import 'package:clean_archi/util/app_colors.dart';
import 'package:clean_archi/util/app_general.dart';
import 'package:clean_archi/util/app_images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignupController>(
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
                  ThickBlueText(text: 'Signup', fontSize: 50),
                  GreyText(text: "Enter your details to sign up"),
                  SizedBox(height: 50),

                  CustomField(
                    controller: con.email.value,
                    hint: "abc@gmail.com",
                    preffix: Image.asset(AppImages.mail),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 20),

                  Obx(
                    () => CustomField(
                      controller: con.password.value,
                      hint: "Enter your password",
                      preffix: Image.asset(AppImages.lock),
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
                  SizedBox(height: 20),

                  Obx(
                    () => CustomField(
                      controller: con.confirmPassword.value,
                      hint: "Confirm your password",
                      preffix: Image.asset(AppImages.lock),
                      obsecure: con.obsecure.value,

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
                  SizedBox(height: 20),
                  GestureDetector(
                    onTap: () => con.signup(),
                    child: Button(
                      text: "Sign up",
                      width: AppGeneral.width! * .9,
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      Get.offAndToNamed(
                        RouteStrings.login,
                        arguments: con.email.value.text,
                      );
                    },
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Already have an account?",
                            style: TextStyle(
                              color: Color(0xff6e6e6e),
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          TextSpan(
                            text: " login here",
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
