import 'package:clean_archi/data/model/section_model.dart';

abstract class SectionDataSource {
  Future<List<SectionModel>> fetchSections();
}
