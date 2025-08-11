
import 'package:clean_archi/domain/entities/category_model.dart';

class CategoryModel {
  String? category;

  CategoryModel({required this.category});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['category'] = category;

    return data;
  }

  CategoryEntity toEntity() {
    return CategoryEntity(category: category ?? "");
  }
}
