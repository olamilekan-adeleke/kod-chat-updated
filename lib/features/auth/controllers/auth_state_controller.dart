import 'package:kod_chat/cores/utils/local_database_controller.dart';

import '../../../cores/utils/emums.dart';
import '../../../features/auth/model/login_user_model.dart';
import '../../../features/auth/services/auth_services.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/instance_manager.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class AuthStateController extends GetxController {
  static final AuthenticationRepo authenticationRepo =
      Get.find<AuthenticationRepo>();
  static final LocalDatabaseController localdatabaseRepo =
      Get.find<LocalDatabaseController>();
  final Rx<AuthStateEnum> authStateEnum = AuthStateEnum.loggedOut.obs;

  @override
  void onInit() {
    super.onInit();

    // auth state
    authenticationRepo.userAuthState.listen((LoginUserModel? loginUser) {
      if (loginUser != null) {
        authStateEnum.value = AuthStateEnum.loggedIn;
      } else {
        authStateEnum.value = AuthStateEnum.loggedOut;
      }
    });

    
  }
}
