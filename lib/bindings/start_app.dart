import 'package:get/get.dart';
import 'package:ss_test/constants/widgets/dropDown_widget.dart';
import 'package:ss_test/repository/auth_repository.dart';
import 'package:ss_test/service/auth_service.dart';
import 'package:ss_test/viewModel/auth_viewModel.dart';

class StartApp {
  static startBeforeApp() {
    Get.lazyPut(() => AuthViewModel(), fenix: true);
    Get.lazyPut(() => AuthRepository(), fenix: true);
    Get.lazyPut(() => AuthService(), fenix: true);
  }
}
