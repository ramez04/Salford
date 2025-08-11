import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:clean_archi/domain/entities/course_entity.dart';
import 'package:clean_archi/util/Routes/route_strings.dart';
import 'package:clean_archi/util/app_colors.dart';
import 'package:clean_archi/util/app_general.dart';
import 'package:clean_archi/util/app_images.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

// ignore: must_be_immutable
class CourseView extends StatefulWidget {
  CourseView({
    super.key,

    this.width,
    this.height,
    required this.coursesEntity,
    required this.con,
  });
  final CoursesEntity coursesEntity;
  final double? width;
  final double? height;
  // ignore: prefer_typing_uninitialized_variables
  final con;
  bool bookmark = false;

  @override
  State<CourseView> createState() => _CourseViewState();
}

class _CourseViewState extends State<CourseView> {
  @override
  Widget build(BuildContext context) {
    List<CoursesEntity> course = GetStorage().read("bookmarks") ?? [];
    if (course.isNotEmpty) {
      log("not null");
      if (course.contains(widget.coursesEntity)) {
        setState(() {
          widget.bookmark = true;
        });
      }
    } else {
      log("null");
    }
    return GestureDetector(
      onTap:
          () => Navigator.pushNamed(
            context,
            RouteStrings.courseDetails,
            arguments: widget.coursesEntity,
          ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppGeneral.width! * .05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Stack(
                children: [
                  CachedNetworkImage(
                    width: widget.width ?? AppGeneral.width! * .6,
                    height: widget.height ?? 200,
                    fit: BoxFit.cover,
                    imageUrl: widget.coursesEntity.image,
                    placeholder: (context, url) {
                      return Center(child: CircularProgressIndicator());
                    },
                    errorWidget: (context, url, error) {
                      return Center(child: Text("data"));
                    },
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    width: widget.width ?? AppGeneral.width! * .6,
                    height: widget.height ?? 200,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 60,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Center(
                            child: Text(
                              "\$${widget.coursesEntity.price}",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () {
                                List<CoursesEntity> course =
                                    GetStorage().read("bookmarks") ?? [];
                                if (course.isEmpty) {
                                  GetStorage().write("bookmarks", [
                                    widget.coursesEntity,
                                  ]);
                                  setState(() {
                                    widget.bookmark = true;
                                  });
                                } else {
                                  if (course.contains(widget.coursesEntity)) {
                                    GetStorage().remove("bookmarks");
                                    course.remove(widget.coursesEntity);
                                    GetStorage().write("bookmarks", course);
                                    setState(() {
                                      widget.bookmark = false;
                                    });
                                  } else {
                                    GetStorage().remove("bookmarks");
                                    course.add(widget.coursesEntity);
                                    GetStorage().write("bookmarks", course);
                                    setState(() {
                                      widget.bookmark = true;
                                    });
                                  }
                                }
                              },
                              child: CircleAvatar(
                                backgroundColor:
                                    !widget.bookmark
                                        ? Colors.white
                                        : AppColors.mainColor,
                                child: Center(
                                  child: Image.asset(
                                    AppImages.bookmark,
                                    color:
                                        widget.bookmark
                                            ? Colors.white
                                            : AppColors.mainColor,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            Text(
              widget.coursesEntity.name,
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
            ),

            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "By: ",
                    style: TextStyle(color: AppColors.mainColorDarker),
                  ),
                  TextSpan(
                    text: widget.coursesEntity.tutor,
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
