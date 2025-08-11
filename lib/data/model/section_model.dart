
import 'package:clean_archi/domain/entities/section_entity.dart';

class SectionModel {
  String? name;
  List<String>? courses;

  SectionModel({required this.name, required this.courses});

  SectionModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    courses =
        json['courses'] != null
            ? List<String>.from(json['courses']) 
            : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data["courses"] = courses;
    return data;
  }

  SectionEntity toEntity() {
    return SectionEntity(name: name ?? '', courses: courses ?? []);
  }
}

