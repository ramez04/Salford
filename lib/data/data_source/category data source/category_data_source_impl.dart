
import 'dart:convert';

import 'package:clean_archi/data/data_source/category%20data%20source/category_data_source.dart';
import 'package:clean_archi/data/model/category_model.dart';
import 'package:firebase_database/firebase_database.dart';

class CategoryDataSourceImpl implements CategoryDataSource {
  @override
  Future<List<CategoryModel>> getCategories() async {
    DataSnapshot data =
        await FirebaseDatabase.instance.ref("Categories/").get();
    var decodedData = jsonDecode(jsonEncode(data.value));
    List<CategoryModel> listCategory = [];
    List<String> keys = decodedData.keys.toList();
    for (var element in keys) {
      DataSnapshot data2 =
          await FirebaseDatabase.instance.ref("Categories/$element/").get();
      var decodedData2 = jsonDecode(jsonEncode(data2.value));

      listCategory.add(CategoryModel.fromJson(decodedData2));
    }
    return listCategory;
  }
}
