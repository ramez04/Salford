import 'package:clean_archi/data/model/category_model.dart';

abstract class CategoryDataSource {
  Future<List<CategoryModel>> getCategories();
}

