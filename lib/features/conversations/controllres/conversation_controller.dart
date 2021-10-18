import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kod_chat/cores/utils/emums.dart';
import 'package:kod_chat/cores/utils/snack_bar_service.dart';
import 'package:kod_chat/features/auth/services/auth_services.dart';
import 'package:kod_chat/features/conversations/model/conversation_model.dart';

class ConversationController extends GetxController {
  static final AuthenticationRepo authenticationRepo =
      Get.find<AuthenticationRepo>();
  final Rx<ControllerState> controllerState = ControllerState.init.obs;
  late final ScrollController scrollController = ScrollController();
  static const int limit = 10;
  static final CollectionReference conversationCollectionRef =
      FirebaseFirestore.instance.collection('conversations');
  final RxList<ConversationModel> conversations = <ConversationModel>[].obs;
  final List<List<ConversationModel>> _allPagesList =
      <List<ConversationModel>>[];
  Map<String, dynamic>? _lastDocument;
  bool _hasMore = true;
  final RxString errorText = ''.obs;

  void init() {
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent) {
        log('scroll end');
        getConversations();
      }
    });
  }

  void getConversations() {
    // if (!_hasMore) return;
    log(_lastDocument.toString());

    try {
      controllerState.value = ControllerState.busy;
      Query userQuery = conversationCollectionRef
          .where(
            'members',
            arrayContains: authenticationRepo.getUserUid() ?? '',
          )
          .orderBy('timestamp', descending: true)
          .limit(limit);

      if (_lastDocument != null) {
        userQuery = userQuery.startAfter([_lastDocument!['timestamp']]);
      }

      final int currentPageIndex = _allPagesList.length;

      userQuery
          .snapshots()
          .listen((QuerySnapshot<Object?> conversationsSnapshot) {
        if (conversationsSnapshot.docs.isNotEmpty) {
          final List<ConversationModel> _conversations = conversationsSnapshot
              .docs
              .map((QueryDocumentSnapshot<Object?> doc) {
            final Map<String, dynamic> _data =
                doc.data() as Map<String, dynamic>;
            return ConversationModel.fromMap(_data);
          }).toList();

          log(_conversations.toString());
          final bool pageExists = currentPageIndex < _allPagesList.length;

          if (pageExists) {
            _allPagesList[currentPageIndex] = _conversations;
          } else {
            _allPagesList.add(_conversations);
          }

          final List<ConversationModel> _foldedPagesList = _allPagesList.fold(
            <ConversationModel>[],
            (previousValue, element) => previousValue..addAll(element),
          );

          conversations.value = _foldedPagesList;

          if (currentPageIndex == _allPagesList.length - 1) {
            _lastDocument = _conversations.last.toMap();
          }

          _hasMore = _conversations.length == limit;
        }
      }).onError((e, s) {
        controllerState.value = ControllerState.error;
        errorText.value = 'Opps, an error occurred! \n$e';
        CustomSnackBarService.showErrorSnackBar('Error', e.toString());
        log(e.toString());
        log(s.toString());
      });
    } catch (e, s) {
      controllerState.value = ControllerState.error;
      errorText.value = 'Opps, an error occurred! \n$e';
      CustomSnackBarService.showErrorSnackBar('Error', e.toString());
      log(e.toString());
      log(s.toString());
    }
  }

  @override
  void onInit() {
    getConversations();
    init();
    super.onInit();
  }
}
