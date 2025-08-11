import 'package:clean_archi/presentation/controller/new/view_all_courses_in_section_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class ViewAllCoursesInSectionScreen extends StatelessWidget {
  const ViewAllCoursesInSectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ViewAllCoursesInSectionController>(
      builder: (con) {
        return Scaffold();
      },
    );
  }
}
