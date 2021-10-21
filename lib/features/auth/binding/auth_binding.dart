import '../../../cores/utils/local_database_controller.dart';


import '../../../features/auth/controllers/auth_state_controller.dart';
import '../../../features/auth/controllers/forgot_password_controller.dart';
import '../../../features/auth/controllers/login_controller.dart';
import '../../../features/auth/controllers/register_controller.dart';
import '../../../features/auth/services/auth_services.dart';
import 'package:get/instance_manager.dart';

class AuthenticationBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<LocalDatabaseController>(LocalDatabaseController());
    Get.put<AuthenticationRepo>(AuthenticationRepo());
    Get.put<AuthStateController>(AuthStateController());
    Get.put<RegisterController>(RegisterController());
    Get.put<LoginControllers>(LoginControllers());
    Get.put<ForgotPasswordController>(ForgotPasswordController());
  }
}
