
import 'package:clean_archi/util/Routes/route_strings.dart';
import 'package:clean_archi/util/app_images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Menu extends StatelessWidget {
  const Menu({super.key, required this.con, required this.page});

  // ignore: prefer_typing_uninitialized_variables
  final con;
  final String page;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AnimatedPositioned(
        duration: Duration(milliseconds: 500),
        bottom: con.menu.value ? -35 : 50,
        left: 0,
        right: 0,
        child: Center(
          child: AnimatedContainer(
            duration: Duration(milliseconds: 500),
            decoration: BoxDecoration(
              color: Colors.grey.withValues(alpha: 0.8),
              shape: BoxShape.circle,
            ),
            width: con.menu.value ? 200 : 0,
            height: con.menu.value ? 200 : 0,
            child: Stack(
              children: [
                Positioned(
                  top: 85,
                  left: 5,
                  child: GestureDetector(
                    onTap: () {
                      if (page != "Home") {
                        Get.offAndToNamed(RouteStrings.home);
                      }
                    },
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color:
                            page == "Home" ? Color(0xff0b3954) : Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Image.asset(
                          AppImages.homeHome,
                          color:
                              page != "Home" ? Color(0xff0b3954) : Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 30,
                  left: 20,
                  child: GestureDetector(
                    onTap: () {
                      if (page != "Menu") {
                        Get.toNamed(RouteStrings.myCourses);
                      }
                    },
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color:
                            page == "Menu" ? Color(0xff0b3954) : Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Image.asset(
                          AppImages.homeMenu,
                          color:
                              page != "Menu" ? Color(0xff0b3954) : Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 5,
                  left: 73,
                  child: GestureDetector(
                    onTap: () {
                      if (page != "Bookmark") {
                        Get.toNamed(RouteStrings.bookmarks);
                      }
                    },
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color:
                            page == "Bookmark"
                                ? Color(0xff0b3954)
                                : Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Image.asset(
                          AppImages.homeBookmark,
                          color:
                              page != "Bookmark"
                                  ? Color(0xff0b3954)
                                  : Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 30,
                  right: 20,
                  child: GestureDetector(
                    onTap: () {
                      Get.toNamed(RouteStrings.profile);
                    },
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color:
                            page == "Profile"
                                ? Color(0xff0b3954)
                                : Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Image.asset(
                          AppImages.homeProfile,
                          color:
                              page != "Profile"
                                  ? Color(0xff0b3954)
                                  : Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 85,
                  right: 5,
                  child: GestureDetector(
                    onTap: () {
                      Get.toNamed(RouteStrings.settings);
                    },
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color:
                            page == "Settings"
                                ? Color(0xff0b3954)
                                : Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Image.asset(
                          AppImages.homeSettings,
                          color:
                              page != "Settings"
                                  ? Color(0xff0b3954)
                                  : Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
