import 'package:clean_archi/presentation/controller/new/subscription_controller.dart';
import 'package:clean_archi/presentation/widgets/subscription_item.dart';
import 'package:clean_archi/presentation/widgets/top_bar.dart';
import 'package:clean_archi/util/app_colors.dart';
import 'package:clean_archi/util/app_general.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubscriptionScreen extends StatelessWidget {
  const SubscriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SubscriptionController>(
      builder: (con) {
        return Scaffold(
          backgroundColor: AppColors.backgroundColor,
          body: SizedBox(
            height: AppGeneral.height,
            width: AppGeneral.width,
            child: SingleChildScrollView(
              child: Column(
                spacing: 20,
                children: [
                  SizedBox(height: 10),
                  TopBar(title: "Subscriptions"),
                  Obx(() {
                    return Padding(
                      padding: EdgeInsets.all(8),
                      child: Column(
                        spacing: 20,
                        children: [
                          Text(
                            "Choose The Right Plan For Your Learning Journy",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w300,
                              fontSize: 26,
                            ),
                          ),
                          SubscriptionItem(
                            feature1: true,
                            feature2: false,
                            feature3: false,
                            feature4: false,
                            feature5: false,
                            plan: "Basic Plan",
                            price: "Free",
                            recursion: "",
                            planDes: "Unlock essential courses and features.",
                            isOpen: con.sub.value == "Basic",
                            function: () {
                              if (con.sub.value != "Basic") {
                                con.toggle("Basic");
                              }
                            },
                          ),
                          SubscriptionItem(
                            feature1: true,
                            feature2: true,
                            feature3: true,
                            feature4: false,
                            feature5: false,
                            plan: "Pro Plan",
                            price: "\$5.99",
                            recursion: "Monthly",
                            planDes: "Get certificates and offline access.",
                            isOpen: con.sub.value == "Pro",
                            function: () {
                              if (con.sub.value != "Pro") {
                                con.toggle("Pro");
                              }
                            },
                          ),
                          SubscriptionItem(
                            feature1: true,
                            feature2: true,
                            feature3: true,
                            feature4: true,
                            feature5: true,
                            plan: "Premium Plan",
                            price: "\$9.99",
                            recursion: "Monthly",
                            planDes: "Exclusive content and VIP support.",
                            isOpen: con.sub.value == "Premium",
                            function: () {
                              if (con.sub.value != "Premium") {
                                con.toggle("Premium");
                              }
                            },
                          ),
                        ],
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
