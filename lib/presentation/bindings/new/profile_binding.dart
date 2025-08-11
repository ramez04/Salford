import 'package:clean_archi/data/data_repo/storage_repository_impl.dart';
import 'package:clean_archi/data/data_repo/user_repository_impl.dart';
import 'package:clean_archi/data/data_source/storage%20data%20source/storage_data_source_impl.dart';
import 'package:clean_archi/data/data_source/user%20data%20source/user_data_source_impl.dart';
import 'package:clean_archi/domain/usecases/add_user_image.dart';
import 'package:clean_archi/domain/usecases/user/update_user.dart';
import 'package:clean_archi/presentation/controller/new/profile_controller.dart';
import 'package:get/get.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    final storageDataSource = Get.put(StorageDataSourceImpl());
    final storageRepository = Get.put(
      StorageReposetoryImpl(storageDataSource: storageDataSource),
    );
    Get.lazyPut(() => AddUserImage(storageReposetory: storageRepository));

    final userDataSource = Get.put(UserDataSourceImpl());
    final userRepository = Get.put(
      UserRepositoryImpl(dataSource: userDataSource),
    );
    Get.lazyPut(() => UpdateUser(repository: userRepository));
    Get.lazyPut(() => ProfileController());
  }
}
