import 'package:clean_archi/presentation/controller/new/setting_controller.dart';
import 'package:clean_archi/presentation/widgets/clickable_row.dart';
import 'package:clean_archi/presentation/widgets/top_bar.dart';
import 'package:clean_archi/util/Routes/route_strings.dart';
import 'package:clean_archi/util/app_colors.dart';
import 'package:clean_archi/util/app_general.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColors.backgroundColor,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                spacing: 20,
                children: [
                  SizedBox(height: 10),
                  TopBar(title: "Settings"),
                  ClickableRow(
                    function: () {
                      Get.toNamed(RouteStrings.paymentMethod);
                    },
                    title: "Payment Method",
                  ),
                  ClickableRow(
                    function: () {
                      Get.toNamed(RouteStrings.subscriptions);
                    },
                    title: "Subscriptions",
                  ),
                  ClickableRow(function: () {}, title: "Light Mode"),
                ],
              ),
              Container(
                padding: EdgeInsets.all(8),
                width: AppGeneral.width,
                height: AppGeneral.height! * .25,
                color: const Color.fromARGB(255, 9, 21, 35),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Contact Information",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      "John Doe",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                        fontSize: 18,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      "Call: (555) 123-4567",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                        fontSize: 18,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      "Or email us at: john.doe@example.com",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                        fontSize: 18,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      "You can also visit us at:",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                        fontSize: 18,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      "1234 Elm Street, Springfield, IL 62704",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                        fontSize: 18,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
