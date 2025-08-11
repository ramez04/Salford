import 'package:cached_network_image/cached_network_image.dart';
import 'package:clean_archi/presentation/controller/new/profile_controller.dart';
import 'package:clean_archi/presentation/widgets/custom_floating_action_button.dart';
import 'package:clean_archi/presentation/widgets/menu.dart';
import 'package:clean_archi/presentation/widgets/profile_item.dart';
import 'package:clean_archi/presentation/widgets/top_bar.dart';
import 'package:clean_archi/util/Routes/route_strings.dart';
import 'package:clean_archi/util/app_colors.dart';
import 'package:clean_archi/util/app_general.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      builder: (con) {
        return Scaffold(
          floatingActionButton: CustomFloatingActionButton(con: con),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          backgroundColor: AppColors.backgroundColor,
          body: Stack(
            children: [
              SizedBox(
                height: AppGeneral.height,
                width: AppGeneral.width,
                child: Column(
                  spacing: 15,
                  children: [
                    SizedBox(height: 10),
                    TopBar(title: "Profile"),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        spacing: 15,
                        children: [
                          Obx(() {
                            return Container(
                              padding: EdgeInsets.all(16),
                              width: AppGeneral.width,
                              height: 100,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      con.addImage();
                                    },
                                    child: Stack(
                                      children: [
                                        CircleAvatar(
                                          radius: 40,
                                          backgroundColor: Colors.grey
                                              .withValues(alpha: .3),
                                          backgroundImage:
                                              con.user.value!.image.isNotEmpty
                                                  ? CachedNetworkImageProvider(
                                                    con.user.value!.image,
                                                  )
                                                  : null,
                                          child: Center(
                                            child:
                                                con.user.value!.image.isEmpty
                                                    ? Icon(
                                                      Icons.person,
                                                      size: 40,
                                                    )
                                                    : SizedBox(),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 3,
                                          right: 7,
                                          child: CircleAvatar(
                                            radius: 10,
                                            backgroundColor:
                                                AppColors.mainColorDarker,
                                            child: Center(
                                              child: Icon(
                                                Icons.edit,
                                                size: 15,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        con.user.value!.name.isNotEmpty
                                            ? con.user.value!.name
                                            : "Guest",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      ),
                                      Text(
                                        con.user.value!.email,
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: AppColors.mainColorDarker,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          }),
                          ProfileItem(
                            title: "Your Courses",
                            function: () {
                              Get.offAndToNamed(RouteStrings.myCourses);
                            },
                          ),
                          ProfileItem(
                            title: "Your History",
                            function: () {
                              Get.offAndToNamed(RouteStrings.history);
                            },
                          ),
                          ProfileItem(
                            title: "Settings",
                            function: () {
                              Get.offAndToNamed(RouteStrings.settings);
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Menu(con: con, page: "Profile"),
            ],
          ),
        );
      },
    );
  }
}
