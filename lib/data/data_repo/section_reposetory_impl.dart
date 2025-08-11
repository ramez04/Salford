import 'package:clean_archi/core/error/connection_failure.dart';
import 'package:clean_archi/core/error/failure.dart';
import 'package:clean_archi/core/error/unexpected_failure.dart';
import 'package:clean_archi/data/data_source/section%20data%20source/section_data_source.dart';
import 'package:clean_archi/data/model/section_model.dart';
import 'package:clean_archi/domain/domain_repo/section_reposetory.dart';
import 'package:clean_archi/domain/entities/section_entity.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';

class SectionReposetoryImpl implements SectionReposetory {
  final SectionDataSource sectionDataSource;

  SectionReposetoryImpl({required this.sectionDataSource});
  @override
  Future<Either<Failure, List<SectionEntity>>> getSections() async {
    List<ConnectivityResult> res = await Connectivity().checkConnectivity();
    if (res.contains(ConnectivityResult.mobile) ||
        res.contains(ConnectivityResult.wifi)) {
      try {
        List<SectionModel> sectionsModel =
            await sectionDataSource.fetchSections();
        List<SectionEntity> sectionEntity =
            sectionsModel.map((e) => e.toEntity()).toList();
        return Right(sectionEntity);
      } catch (e) {
        return Left(UnexpectedFailure(e.toString()));
      }
    } else {
      return Left(ConnectionFailure());
    }
  }
}



// List<ConnectivityResult> res = await Connectivity().checkConnectivity();
    // if (res.contains(ConnectivityResult.mobile) ||
    //     res.contains(ConnectivityResult.wifi)) {
    //   try {

    //     return Right();
    //   } catch (e) {
    //     return Left(UnexpectedFailure(e.toString()));
    //   }
    // } else {
    //   return Left(ConnectionFailure());
    // }