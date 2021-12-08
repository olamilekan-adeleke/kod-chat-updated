import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kod_chat/cores/utils/snack_bar_service.dart';
import '../../../cores/utils/emums.dart';
import 'chat_controller.dart';
import '../model/chat_model.dart';

class ChatMessagesController extends GetxController {
  static const int limit = 15;
  late final ScrollController scrollController = ScrollController();
  static final CollectionReference chatCollectionRef =
      FirebaseFirestore.instance.collection('chats');
  static final ChatController _chatController = Get.find<ChatController>();
  final Rx<ControllerState> controllerState = ControllerState.init.obs;
  final RxList<ChatModel> chats = <ChatModel>[].obs;
  final List<List<ChatModel>> _allPagesList = <List<ChatModel>>[];
  Map<String, dynamic>? _lastDocument;
  bool _hasMore = true;

  void init() {
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent) {
        log('end chat screen');
        getMessages();
      }
    });
  }

  void getMessages() {
    // get chat room id
    final String chatRoomId = _chatController.chatRoomId.value;

    if (chatRoomId.isEmpty) return;

    log('chatRoomId: $chatRoomId');

    // declare query
    Query chatQuery = chatCollectionRef
        .doc(chatRoomId)
        .collection('chat_room')
        .orderBy('timestamp', descending: true)
        .limit(limit);

    log('last doc: ${_lastDocument}');

    if (_lastDocument != null) {
      chatQuery = chatQuery.startAt([_lastDocument!['timestamp']]);
    }

    final int currentPageIndex = _allPagesList.length;

    controllerState.value = ControllerState.busy;

    chatQuery.snapshots().listen((QuerySnapshot<Object?> chatsSnapshot) {
      final List<Map<String, dynamic>> _chatsRawData = chatsSnapshot.docs
          .map((e) => Map<String, dynamic>.from(e.data() as Map))
          .toList();

      final List<ChatModel> _chats = _chatsRawData
          .map(
            (Map<String, dynamic> e) => ChatModel.fromMap(
              e,
              chatsSnapshot.metadata.hasPendingWrites,
            ),
          )
          .toList();

      // log(_chats.toString());

      if (_chats.isNotEmpty) {
        // check if data already exists

        if (mapEquals(_chats.last.toMap(), _lastDocument)) {
          controllerState.value = ControllerState.success;
          return;
        }

        final bool pageExists = currentPageIndex < _allPagesList.length;

        if (pageExists) {
          _allPagesList[currentPageIndex] = _chats;
        } else {
          _allPagesList.add(_chats);
        }

        final List<ChatModel> _foldedPagesList = _allPagesList.fold(
          <ChatModel>[],
          (previousValue, element) => previousValue..addAll(element),
        );

        chats.value = _foldedPagesList;

        if (currentPageIndex == _allPagesList.length - 1) {
          _lastDocument = _chats.last.toMap();
        }

        _hasMore = _chats.length == limit - 1;
        controllerState.value = ControllerState.success;
      }
    }).onError((e, s) {
      controllerState.value = ControllerState.error;

      CustomSnackBarService.showErrorSnackBar('Error', e.toString());
      log(e.toString());
      log(s.toString());
    });
  }

  @override
  void onInit() {
    getMessages();
    init();
    super.onInit();
  }
}
