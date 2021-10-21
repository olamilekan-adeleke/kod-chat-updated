import 'dart:developer';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../cores/utils/emums.dart';
import 'chat_controller.dart';
import '../model/chat_model.dart';

class ChatMessagesController extends GetxController {
  static const int limit = 15;
  late final ScrollController scrollController = ScrollController();
  static final DatabaseReference chatCollectionRef =
      FirebaseDatabase.instance.reference().child('chats');
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
        // getMessages();
      }
    });
  }

  void getMessages() {
    // get chat room id
    final String chatRoomId = _chatController.chatRoomId.value;

    // declare query
    Query chatQuery = chatCollectionRef
        .child(chatRoomId)
        .child('chat_room')
        .orderByChild('timestamp:')
        .limitToFirst(limit);

    if (_lastDocument != null) {
      chatQuery = chatQuery.startAt(_lastDocument!['timestamp']);
    }

    final int currentPageIndex = _allPagesList.length;

    chatQuery.onValue.listen((Event event) {
      final Map data = (event.snapshot.value ?? {}) as Map;
      final List<Map<String, dynamic>> _usersInMap =
          List<Map<String, dynamic>>.from(data.values.toList());

      // remove first element
      _usersInMap.removeAt(0);

      final List<ChatModel> _users = _usersInMap
          .map((Map<String, dynamic> e) => ChatModel.fromMap(e))
          .toList();
      log(_users.toString());

      if (_users.isNotEmpty) {
        final bool pageExists = currentPageIndex < _allPagesList.length;

        if (pageExists) {
          _allPagesList[currentPageIndex] = _users;
        } else {
          _allPagesList.add(_users);
        }

        final List<ChatModel> _foldedPagesList = _allPagesList.fold(
          <ChatModel>[],
          (previousValue, element) => previousValue..addAll(element),
        );

        chats.value = _foldedPagesList;

        if (currentPageIndex == _allPagesList.length - 1) {
          _lastDocument = _users.last.toMap();
        }

        _hasMore = _users.length == limit - 1;
      }
    });
  }

  @override
  void onInit() {
    // getMessages();
    onInit();
    super.onInit();
  }
}
