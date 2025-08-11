
import 'package:clean_archi/data/data_repo/user_repository_impl.dart';
import 'package:clean_archi/data/data_source/user%20data%20source/user_data_source_impl.dart';
import 'package:clean_archi/domain/usecases/user/update_user.dart';
import 'package:clean_archi/presentation/controller/new/payment_method_controller.dart';
import 'package:get/get.dart';

class PaymentMethodBinding extends Bindings {
  @override
  void dependencies() {
    final userDataSource = Get.put(UserDataSourceImpl());
    final userRepository = Get.put(
      UserRepositoryImpl(dataSource: userDataSource),
    );
    Get.lazyPut(() => UpdateUser(repository: userRepository));
    Get.lazyPut(() => PaymentMethodController());
  }
}
