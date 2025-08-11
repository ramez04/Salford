import 'package:clean_archi/data/data_repo/user_repository_impl.dart';
import 'package:clean_archi/data/data_source/user%20data%20source/user_data_source_impl.dart';
import 'package:clean_archi/domain/usecases/user/add_user.dart';
import 'package:clean_archi/presentation/controller/signup_controller.dart';
import 'package:get/get.dart';

class SignupBinding extends Bindings {
  @override
  void dependencies() {
    final userDataSourse = Get.put(UserDataSourceImpl());
    final userRepository = Get.put(
      UserRepositoryImpl(dataSource: userDataSourse),
    );
    Get.lazyPut(() => AddUser(repository: userRepository));


    Get.lazyPut(() => SignupController());
  }
}
