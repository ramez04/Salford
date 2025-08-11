import 'package:clean_archi/domain/entities/course_entity.dart';

import 'package:clean_archi/domain/entities/user_entity.dart';
import 'package:clean_archi/domain/usecases/get_categories.dart';
import 'package:clean_archi/domain/usecases/get_courses.dart';
import 'package:clean_archi/domain/usecases/get_sections.dart';
import 'package:clean_archi/util/app_general.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController {
  final search = TextEditingController().obs;
  RxList sections = [].obs;
  RxBool isLoading = true.obs;
  RxBool isSearching = false.obs;
  RxString error = "".obs;
  RxString categoryError = ''.obs;
  RxList searchList = [].obs;
  RxList categoryList = [].obs;
  RxList categorySelection = [].obs;
  RxList categoryResult = [].obs;
  RxList courses = [].obs;
  RxBool menu = false.obs;
  late Rx<UserEntity> user;
  UserEntity arg = AppGeneral.userEntity;

  @override
  Future<void> onInit() async {
    isLoading.value = true;
    await getSections();
    await getCategories();
    await getCourses();
    isLoading.value = false;

    super.onInit();
  }

  Future<void> getCategories() async {
    if (GetStorage().read("category") == null) {
      final controller = Get.find<GetCategories>();
      final result = await controller.call();
      result.fold(
        (failur) {
          categoryError.value = failur.message ?? "";
        },
        (data) {
          categoryList.value = data;
        },
      );
      GetStorage().write("category", categoryList);
    } else {
      categoryList = GetStorage().read("category");
    }
  }

  void getUser() {
    FirebaseDatabase.instance
        .ref('/Users/${FirebaseAuth.instance.currentUser!.uid}')
        .get();
  }

  Future<void> getCourses() async {
    final controller = Get.find<GetCourses>();
    final result = await controller.call();
    result.fold(
      (failur) {
        categoryError.value = failur.message ?? "";
      },
      (data) {
        courses.value = data;
      },
    );
  }

  void toogleMenu() {
    menu.value = !menu.value;
  }

  Future<void> getSections() async {
    final controller = Get.find<GetSections>();

    final result = await controller.call();

    result.fold(
      (failure) {
        error.value = failure.message ?? 'Something went wrong';
        sections.value = [];
      },
      (data) {
        error.value = "";
        sections.value = data;
      },
    );
  }

  void selectCategory(String? value) {
    categoryResult.clear();
    if (categorySelection.contains(value)) {
      categorySelection.remove(value);
    } else {
      categorySelection.add(value);
    }
    if (categorySelection.isNotEmpty) {
      categoryResult =
          courses
              .where((course) {
                CoursesEntity coursesEntity = course;
                for (var element in categorySelection) {
                  if (coursesEntity.category.contains(element)) {
                    return true;
                  }
                }
                return false;
              })
              .toList()
              .obs;
    }
  }

  void onChangeSearch() {
    searchList.clear();
    if (search.value.text.isEmpty) {
      isSearching.value = false;
      searchList.clear();
    } else {
      isSearching.value = true;
      for (var element in courses) {
        CoursesEntity coursesEntity = element;
        if (coursesEntity.name.toLowerCase().contains(
          search.value.text.toLowerCase(),
        )) {
          if (!searchList.contains(element)) {
            searchList.add(coursesEntity);
          }
        }
      }
    }
  }
}
