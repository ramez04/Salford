import 'dart:convert';

import 'package:clean_archi/data/data_source/section%20data%20source/section_data_source.dart';
import 'package:clean_archi/data/model/section_model.dart';
import 'package:firebase_database/firebase_database.dart';

// final baseURL = "http://localhost:3000/";
final baseURL = "http://10.227.245.200:3000/";

class SectionDataSourceImpl implements SectionDataSource {
  @override
  Future<List<SectionModel>> fetchSections() async {
    DataSnapshot data = await FirebaseDatabase.instance.ref("Sections/").get();
    var decodedData = jsonDecode(jsonEncode(data.value));
    List<SectionModel> listSection = [];
    List<String> keys = decodedData.keys.toList();
    for (var element in keys) {
      DataSnapshot data2 =
          await FirebaseDatabase.instance.ref("Sections/$element").get();
      var decodedData2 = jsonDecode(jsonEncode(data2.value));
      listSection.add(SectionModel.fromJson(decodedData2));
    }

    return listSection;
  }
}
