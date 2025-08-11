
import 'package:clean_archi/domain/entities/course_entity.dart';

class CoursesModel {
  String? sId;
  String? name;
  int? price;
  String? image;
  String? tutor;
  List<String>? category;
  String? courseLength;
  String? description;
  int? lessons;
  List<LessonPlan>? lessonPlan;
  int? chapters;

  CoursesModel({
    this.sId,
    this.name,
    this.price,
    this.image,
    this.tutor,
    this.category,
    this.courseLength,
    this.description,
    this.lessons,
    this.lessonPlan,
    this.chapters,
  });

  CoursesModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    price = json['price'];
    image = json['image'];
    tutor = json['tutor'];
    category = json['category'].cast<String>();
    courseLength = json['courseLength'];
    description = json['description'];
    chapters = json['chapters'];
    lessons = json['lessons'];
    if (json['lessonPlan'] != null) {
      lessonPlan = <LessonPlan>[];
      json['lessonPlan'].forEach((v) {
        lessonPlan!.add(LessonPlan.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['price'] = price;
    data['image'] = image;
    data['tutor'] = tutor;
    data['category'] = category;
    data['courseLength'] = courseLength;
    data['description'] = description;
    data['lessons'] = lessons;
    data['chapters'] = chapters;
    if (lessonPlan != null) {
      data['lessonPlan'] = lessonPlan!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  CoursesEntity toEntity() {
    return CoursesEntity(
      id: sId ?? "",
      name: name ?? "",
      price: price ?? 0,
      image: image ?? "",
      tutor: tutor ?? "",
      category: category ?? [],
      courseLength: courseLength ?? "",
      description: description ?? "",
      lessons: lessons ?? 0,
      lessonPlan: lessonPlan?.map((e) => e.toEntity()).toList() ?? [],
      chapters: chapters ?? 0,
    );
  }
}

class LessonPlan {
  int? begin;
  int? end;
  String? objective;
  String? sId;

  LessonPlan({this.begin, this.end, this.objective, this.sId});

  LessonPlan.fromJson(Map<String, dynamic> json) {
    begin = json['begin'];
    end = json['end'];
    objective = json['objective'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['begin'] = begin;
    data['end'] = end;
    data['objective'] = objective;
    data['_id'] = sId;
    return data;
  }

  LessonPlanEntity toEntity() {
    return LessonPlanEntity(
      begin: begin ?? 0,
      end: end ?? 0,
      objective: objective ?? "",
    );
  }
}
