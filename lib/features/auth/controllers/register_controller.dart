import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/user_details_model.dart';
import '../../../cores/constants/error_text.dart';
import '../../../cores/utils/emums.dart';
import '../../../cores/utils/logger.dart';
import '../../../cores/utils/navigator_service.dart';
import '../../../cores/utils/snack_bar_service.dart';
import '../../../features/auth/services/auth_services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/instance_manager.dart';

class RegisterController extends GetxController {
  final Rx<ControllerState> _controllerStateEnum =
      ControllerState.init.obs;
  static final AuthenticationRepo _authenticationRepo =
      Get.find<AuthenticationRepo>();
  final TextEditingController firstnameController =
      TextEditingController(text: '');
  final TextEditingController lastnameController =
      TextEditingController(text: '');
  final TextEditingController emailController = TextEditingController(text: '');
  final TextEditingController phoneController = TextEditingController(text: '');
  final TextEditingController passwordController =
      TextEditingController(text: '');

  ControllerState get controllerStateEnum => _controllerStateEnum.value;

  Future<void> registerUser() async {
    _controllerStateEnum.value = ControllerState.busy;

    final UserDetailsModel user = UserDetailsModel(
      uid: '',
      email: emailController.text.trim(),
      fullName: '${firstnameController.text.trim()}'
          ' ${lastnameController.text.trim()}',
      phoneNumber: phoneController.text.trim(),
      dateJoined: Timestamp.now(),
      profilePicUrl: null,
    );

    try {
      await _authenticationRepo.registerUserWithEmailAndPassword(
          user, passwordController.text.trim());

      _controllerStateEnum.value = ControllerState.success;
      NavigationService.goBack();
      CustomSnackBarService.showSuccessSnackBar(
          'Success', 'Account Successfully Created!');
    } on SocketException {
      _controllerStateEnum.value = ControllerState.error;
      CustomSnackBarService.showErrorSnackBar(
          'Error', noInternetConnectionText);
    } catch (e, s) {
      errorLog('$e', 'Error siging up in user', title: 'sign up', trace: '$s');

      _controllerStateEnum.value = ControllerState.error;
      CustomSnackBarService.showErrorSnackBar('Error', e.toString());
    }
  }
}
