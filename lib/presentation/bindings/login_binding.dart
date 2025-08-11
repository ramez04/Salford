
import 'package:clean_archi/data/data_repo/user_repository_impl.dart';
import 'package:clean_archi/data/data_source/user%20data%20source/user_data_source_impl.dart';
import 'package:clean_archi/domain/usecases/user/get_user.dart';
import 'package:clean_archi/presentation/controller/login_controller.dart';
import 'package:get/get.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    

    final userDataSourceImpl = Get.put(UserDataSourceImpl());
    final userRepository = Get.put(
      UserRepositoryImpl(dataSource: userDataSourceImpl),
    );

    Get.lazyPut(() => GetUser(repository: userRepository));

    Get.lazyPut(() => LoginController());
  }
}
