import 'package:kod_chat/features/conversations/view/screens/converstion_screen.dart';

import '../../../../cores/utils/emums.dart';
import '../../../../features/auth/controllers/auth_state_controller.dart';
import '../../../../features/auth/views/pages/login_screen.dart';

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/instance_manager.dart';

class WrapperScreen extends StatelessWidget {
  const WrapperScreen();

  static final AuthStateController authStateController =
      Get.find<AuthStateController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (authStateController.authStateEnum.value == AuthStateEnum.loggedIn) {
          return const ConversationScreen();
        } else {
          return const LoginScreen();
        }
      },
    );
  }
}