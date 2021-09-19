import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kod_chat/cores/utils/emums.dart';
import 'package:kod_chat/cores/utils/route_name.dart';
import 'package:kod_chat/features/auth/model/user_details_model.dart';
import 'package:kod_chat/features/chat/controllers/chat_controller.dart';
import 'package:kod_chat/features/search/services/search_services.dart';

class SearchController extends GetxController {
  static final SearchService searchService = SearchService();

  final Rx<ControllerState> controllerState = ControllerState.init.obs;
  final TextEditingController searchTextEditingController =
      TextEditingController(text: "");

  final RxList<UserDetailsModel> searchResults = <UserDetailsModel>[].obs;
  static final ChatController chatController = Get.find<ChatController>();
  UserDetailsModel? lastResult;
  String lastQuery = '';
  bool hasMore = true;

  final RxString errorMessage = ''.obs;

  Future<void> searchByQuery({bool ignoreRepeat = true}) async {
    final String query = searchTextEditingController.text.trim();

    if (query.isEmpty) return;

    controllerState.value = ControllerState.busy;

    try {
      if (lastQuery != query && ignoreRepeat) searchResults.clear();

      List<UserDetailsModel> result =
          await searchService.searchUser(query) ?? [];

      if (result.isNotEmpty) {
        lastResult = result.last;
      }

      searchResults.addAll(result);
      hasMore = result.length == searchService.limit;

      controllerState.value = ControllerState.success;
    } catch (e, s) {
      log(e.toString());
      log(s.toString());
      errorMessage.value =
          e.toString().replaceAll('[cloud_firestore/unavailable]', '');
      controllerState.value = ControllerState.error;
    }
  }

  void selectUser(UserDetailsModel userDetails) {
    chatController.setSelecteduser = userDetails;
    Get.toNamed(RouteName.chatHome);
  }
}
