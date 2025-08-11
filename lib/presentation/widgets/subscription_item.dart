
import 'package:clean_archi/presentation/widgets/feature_item.dart';
import 'package:clean_archi/util/app_colors.dart';
import 'package:clean_archi/util/app_general.dart';
import 'package:flutter/material.dart';

class SubscriptionItem extends StatelessWidget {
  const SubscriptionItem({
    super.key,
    required this.plan,
    required this.planDes,
    required this.price,
    required this.recursion,
    required this.feature1,
    required this.feature2,
    required this.feature3,
    required this.feature4,
    required this.feature5,
    required this.isOpen,
    required this.function,
  });
  final bool isOpen;
  final VoidCallback function;
  final String plan;
  final String planDes;
  final String price;
  final String recursion;
  final bool feature1;
  final bool feature2;
  final bool feature3;
  final bool feature4;
  final bool feature5;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        width: AppGeneral.width,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors:
                isOpen
                    ? [Color(0xff0B3954), Color(0xff087E8B)]
                    : [Colors.white, Colors.white],
          ),
          borderRadius: BorderRadius.circular(40),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: (AppGeneral.width! - 48 - 10) * .55,
                  height: 125 - 16,
                  child: Column(
                    spacing: 5,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        plan,
                        style: TextStyle(
                          color: isOpen ? Colors.white : Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 22,
                        ),
                      ),
                      Row(),

                      Text(
                        planDes,
                        style: TextStyle(
                          color: isOpen ? Colors.white : Colors.grey,
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: (AppGeneral.width! - 48 - 10) * .35,
                  height: 125 - 16,

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(),
                      Text(
                        price,
                        style: TextStyle(
                          color:
                              isOpen ? Colors.white : AppColors.mainColorDarker,
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                      Text(
                        recursion,
                        style: TextStyle(
                          color: isOpen ? Colors.white : Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            if (isOpen)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 10,
                children: [
                  SizedBox(height: 16),

                  SubscriptionFeature(
                    featured: feature1,
                    text: "Access To All Courses",
                  ),
                  SubscriptionFeature(
                    featured: feature2,
                    text: "Certification on Completion",
                  ),
                  SubscriptionFeature(
                    text: "Offline Access",
                    featured: feature3,
                  ),
                  SubscriptionFeature(
                    featured: feature4,
                    text: "Premium Support",
                  ),
                  SubscriptionFeature(
                    featured: feature5,
                    text: "Access to Exclusive Content",
                  ),
                  SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 160,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                        child: Text(
                          "Subscribe Now",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
