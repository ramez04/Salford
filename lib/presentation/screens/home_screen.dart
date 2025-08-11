
import 'package:cached_network_image/cached_network_image.dart';
import 'package:clean_archi/domain/entities/category_model.dart';
import 'package:clean_archi/domain/entities/course_entity.dart';
import 'package:clean_archi/domain/entities/section_entity.dart';
import 'package:clean_archi/presentation/controller/home_controller.dart';
import 'package:clean_archi/presentation/widgets/action_item.dart';
import 'package:clean_archi/presentation/widgets/course_view.dart';
import 'package:clean_archi/presentation/widgets/custom_field.dart';
import 'package:clean_archi/presentation/widgets/custom_floating_action_button.dart';
import 'package:clean_archi/presentation/widgets/light_black_text.dart';
import 'package:clean_archi/presentation/widgets/menu.dart';
import 'package:clean_archi/util/Routes/route_strings.dart';
import 'package:clean_archi/util/app_colors.dart';
import 'package:clean_archi/util/app_general.dart';
import 'package:clean_archi/util/app_images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (con) {
        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Scaffold(
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,

            floatingActionButton: CustomFloatingActionButton(con: con),
            backgroundColor: AppColors.backgroundColor,
            appBar: customAppBar(con),
            body: SizedBox(
              height: AppGeneral.height!,
              child: Stack(
                children: [BodyWidget(con: con), Menu(con: con, page: "Home")],
              ),
            ),
          ),
        );
      },
    );
  }

  AppBar customAppBar(HomeController con) {
    return AppBar(
      backgroundColor: AppColors.backgroundColor,
      automaticallyImplyLeading: false,
      title: Text(
        "Hello, ${AppGeneral.userEntity.name.isNotEmpty ? con.arg.name : "Guest"}",
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      actions: [
        ActionIcon(
          widget: Icon(Icons.notifications),
          function: () => con.onInit(),
        ),
        ActionIcon(
          widget: CircleAvatar(
            radius: 40,
            backgroundColor: Colors.grey.withValues(alpha: .3),
            backgroundImage:
                con.arg.image.isNotEmpty
                    ? CachedNetworkImageProvider(con.arg.image)
                    : null,
            child: Center(
              child:
                  con.arg.image.isEmpty
                      ? Icon(Icons.person, size: 40)
                      : SizedBox(),
            ),
          ),
          function: () async {
            Get.toNamed(RouteStrings.profile);
          },
        ),
      ],
    );
  }
}

class BodyWidget extends StatelessWidget {
  const BodyWidget({super.key, required this.con});
  final HomeController con;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (con.isLoading.value) {
        return Center(child: CircularProgressIndicator());
      } else {
        return SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (AppGeneral.userEntity.name.isEmpty)
                AnimatedContainer(
                  duration: Duration(seconds: 1),
                  width: AppGeneral.width,
                  height: 70,
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        AppColors.mainColorLighter,
                        AppColors.mainColorLighter,
                        AppColors.mainColorDarker,
                      ],
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: AppGeneral.width! * .5,
                        child: Expanded(
                          child: Text(
                            "We Still dont know much about you",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w300,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Edit account",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (!con.isSearching.value)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              LightBlackText(
                                text: "Let's learn ",
                                fontSize: 30,
                              ),
                              SizedBox(
                                width: 50,
                                height: 50,
                                child: Image.asset(AppImages.gradCap),
                              ),
                            ],
                          ),
                          LightBlackText(
                            text: "Something New",
                            fontWeight: FontWeight.bold,
                            fontSize: 36,
                            letterSpacing: 1,
                          ),
                        ],
                      ),

                    CustomField(
                      borderRadius: 40,
                      controller: con.search.value,
                      hint: "Search course",
                      onChanged: (value) {
                        con.onChangeSearch();
                      },
                      preffix: Image.asset(AppImages.search),
                      borderColor: Colors.transparent,
                      suffix: Container(
                        margin: EdgeInsets.only(right: 2, top: 2),
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xfffaad3b)),
                          shape: BoxShape.circle,
                        ),
                        child: Center(child: Image.asset(AppImages.settings)),
                      ),
                    ),
                  ],
                ),
              ),
              if (!con.isSearching.value)
                SizedBox(
                  width: AppGeneral.width,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,

                      children: List.generate(con.categoryList.length, (index) {
                        CategoryEntity categoryEntity = con.categoryList[index];
                        return GestureDetector(
                          onTap:
                              () => con.selectCategory(categoryEntity.category),
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 8),
                            width: 120,
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color:
                                  con.categorySelection.contains(
                                        categoryEntity.category,
                                      )
                                      ? AppColors.mainColor
                                      : Colors.white,
                            ),
                            child: Center(
                              child: Text(
                                categoryEntity.category,
                                style: TextStyle(
                                  color:
                                      con.categorySelection.contains(
                                            categoryEntity.category,
                                          )
                                          ? Colors.white
                                          : AppColors.mainColor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ),
              Obx(() {
                if (con.isSearching.value) {
                  return Searching(con: con);
                } else if (con.categorySelection.isNotEmpty) {
                  return Category(con: con);
                } else {
                  return HomeMain(con: con);
                }
              }),
              SizedBox(height: 80),
            ],
          ),
        );
      }
    });
  }
}

class HomeMain extends StatelessWidget {
  const HomeMain({super.key, required this.con});

  final HomeController con;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,

      children: List.generate(con.sections.length, (index) {
        SectionEntity section = con.sections[index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Row(
                children: [
                  Text(
                    section.name.toString(),
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 26),
                  ),
                  Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "See all",
                      style: TextStyle(
                        color: AppColors.mainColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 5),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: List.generate(
                  section.courses.length > 4 ? 4 : section.courses.length,
                  (index2) {
                    CoursesEntity? coursesEntity = con.courses.firstWhere((p0) {
                      CoursesEntity coursesEntity = p0;
                      if (coursesEntity.id == section.courses[index2]) {
                        return true;
                      } else {
                        return false;
                      }
                    }, orElse: () => null);
                    return coursesEntity != null
                        ? CourseView(coursesEntity: coursesEntity, con: con)
                        : SizedBox();
                  },
                ),
              ),
            ),
            SizedBox(height: 40),
          ],
        );
      }),
    );
  }
}

class Category extends StatelessWidget {
  const Category({super.key, required this.con});
  final HomeController con;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 32,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: 10),
        ...List.generate(con.categoryResult.length, (index) {
          CoursesEntity coursesEntity = con.categoryResult[index];
          return Center(
            child: CourseView(
              con: con,
              width: AppGeneral.width,
              coursesEntity: coursesEntity,
            ),
          );
        }),
      ],
    );
  }
}

class Searching extends StatelessWidget {
  const Searching({super.key, required this.con});
  final HomeController con;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(con.searchList.length, (index) {
        CoursesEntity course = con.searchList[index];
        return CourseView(
          con: con,
          coursesEntity: course,
          width: AppGeneral.width,
        );
      }),
    );
  }
}
