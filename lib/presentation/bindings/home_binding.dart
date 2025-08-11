
import 'package:clean_archi/data/data_repo/category_repository_impl.dart';
import 'package:clean_archi/data/data_repo/courses_repository_impl.dart';
import 'package:clean_archi/data/data_repo/section_reposetory_impl.dart';
import 'package:clean_archi/data/data_source/category%20data%20source/category_data_source_impl.dart';
import 'package:clean_archi/data/data_source/course%20data%20source/course_data_source_impl.dart';
import 'package:clean_archi/data/data_source/section%20data%20source/section_data_source_impl.dart';
import 'package:clean_archi/domain/usecases/get_categories.dart';
import 'package:clean_archi/domain/usecases/get_courses.dart';
import 'package:clean_archi/domain/usecases/get_sections.dart';
import 'package:clean_archi/presentation/controller/home_controller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    final sectionDataSource = Get.put(SectionDataSourceImpl());

    final sectionRepository = Get.put(
      SectionReposetoryImpl(sectionDataSource: sectionDataSource),
    );

    Get.lazyPut(() => GetSections(reposetory: sectionRepository));

    final categoryDataSource = Get.put(CategoryDataSourceImpl());

    final categoryRepository = Get.put(
      CategoryRepositoryImpl(categoryDataSource: categoryDataSource),
    );
    

    final coursesDataSource = Get.put(CoursesDataSourceImpl());
    final coursesRepository = Get.put(
      CoursesRepositoryImpl(coursesDataSource: coursesDataSource),
    );
    Get.lazyPut(() => GetCourses(repositiry: coursesRepository));
    Get.lazyPut(() => GetCategories(repository: categoryRepository));
    Get.lazyPut(() => HomeController());
  }
}
