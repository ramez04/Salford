import 'package:clean_archi/core/error/failure.dart';
import 'package:clean_archi/domain/entities/section_entity.dart';
import 'package:dartz/dartz.dart';

abstract class SectionReposetory {
  Future<Either<Failure, List<SectionEntity>>> getSections();
}




