
import 'package:clean_archi/core/error/failure.dart';
import 'package:clean_archi/domain/domain_repo/section_reposetory.dart';
import 'package:clean_archi/domain/entities/section_entity.dart';
import 'package:dartz/dartz.dart';

class GetSections {
  final SectionReposetory reposetory;

  GetSections({required this.reposetory});
  Future<Either<Failure, List<SectionEntity>>> call() async {
    var result = await reposetory.getSections();

    return result;
  }
}
