import 'dart:developer';

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:kod_chat/cores/utils/local_database_repo.dart';
import 'package:kod_chat/features/auth/model/user_details_model.dart';

class LocalDatabaseController extends GetxController {
  static final LocaldatabaseRepo localdatabaseRepo = LocaldatabaseRepo();

  final Rx<UserDetailsModel> user =
      UserDetailsModel(email: '', fullName: '', phoneNumber: '', uid: '').obs;

  bool get hasUserData => user.value.email != '';

  void listenerForUserDetails() async {
    user.value = await localdatabaseRepo.getUserDataFromLocalDB() ??
        UserDetailsModel(email: '', fullName: '', phoneNumber: '', uid: '');

    LocaldatabaseRepo.box.listenKey(LocaldatabaseRepo.userDataBoxName, (value) {
      log('========== listening for user data ==========');
      log(' $value ');
      log('========== listening for user data ==========');

      if (value == null) {
        user.value =
            UserDetailsModel(email: '', fullName: '', phoneNumber: '', uid: '');
        return;
      }

      final Map<String, dynamic>? userDataMap = LocaldatabaseRepo.box
          .read(LocaldatabaseRepo.userDataBoxName) as Map<String, dynamic>?;

      final UserDetailsModel userDetailsModel =
          UserDetailsModel.fromMap(userDataMap ?? {});

      user.value = userDetailsModel;
    });
  }

  Future<void> saveUserDataToLocalDB(Map<String, dynamic> userdata) async {
    return localdatabaseRepo.saveUserDataToLocalDB(userdata);
  }

  Future<UserDetailsModel?> getUserDataFromLocalDB() async {
    return localdatabaseRepo.getUserDataFromLocalDB();
  }

  Future<void> clear() async {
    return localdatabaseRepo.clear();
  }

  @override
  void onReady() {
    listenerForUserDetails();
    super.onReady();
  }
}
