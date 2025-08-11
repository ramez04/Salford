
class LessonPlanEntity {
  LessonPlanEntity({
    required this.begin,
    required this.end,
    required this.objective,
  });
  num begin;
  num end;
  String objective;
}


class CoursesEntity {
  String id;
  String name;
  num price;
  String image;
  String tutor;
  List<String> category;
  num lessons;
  num chapters;
  String description;
  String courseLength;
  List<LessonPlanEntity> lessonPlan;

  CoursesEntity({
    required this.name,
    required this.price,
    required this.image,
    required this.tutor,
    required this.category,
    required this.lessons,
    required this.chapters,
    required this.description,
    required this.courseLength,
    required this.lessonPlan,
    required this.id,
  });
}
