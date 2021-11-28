import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kod_chat/features/chat/controllers/chat_room_instance_manager.dart';
import '../../../cores/utils/snack_bar_service.dart';
import '../../auth/model/user_details_model.dart';
import 'send_message_controller.dart';
import 'package:uuid/uuid.dart';

class ChatController extends GetxController {
  final TextEditingController textEditingController = TextEditingController();
  static final Uuid uuid = Uuid();
  final RxString chatRoomId = ''.obs;
  final RxString conversationRoomId = ''.obs;
  final Rx<UserDetailsModel> _selectedUser =
      UserDetailsModel(email: '', fullName: '', phoneNumber: '', uid: '').obs;
  final SendMessageController sendMessageController = Get.find<SendMessageController>();
  final ChatRoomInstanceManager chatRoomInstanceManager = Get.find<ChatRoomInstanceManager>();

  UserDetailsModel? get getSelectedUser {
    if (_selectedUser.value.uid.isEmpty) return null;

    return _selectedUser.value;
  }

  void setSelectedUser(
    UserDetailsModel selectedUser, {
    String? selectedChatRoomId,
    String? selectedConversationRoomId,
  }) {
    _selectedUser.value = selectedUser;

    if (selectedChatRoomId != null && selectedConversationRoomId != null) {
      chatRoomId.value = selectedChatRoomId;
      conversationRoomId.value = selectedConversationRoomId;
    } else {
      chatRoomId.value = '';
      conversationRoomId.value = '';
    }

    chatRoomInstanceManager.navigateToChatPage(selectedChatRoomId ?? '');

    
  }

  Future<void> sendMessage() async {
    final String text = textEditingController.text.trim();

    if (text.isEmpty) return;

    try {
      if (conversationRoomId.isEmpty || chatRoomId.isEmpty) {
        // create room and conversation doc id
        final String _roomId = uuid.v1();
        final String _conversationRoomId = uuid.v1();

        // update room and conversation id
        chatRoomId.value = _roomId;
        conversationRoomId.value = _conversationRoomId;

        await sendMessageController.sendMessage(
          text: text,
          receiverId: _selectedUser.value.uid,
          roomId: _roomId,
          conversationRoomId: _conversationRoomId,
          isFirstTime: true,
        );

        textEditingController.clear();
      } else {
        await sendMessageController.sendMessage(
          text: text,
          receiverId: _selectedUser.value.uid,
          roomId: chatRoomId.value,
          conversationRoomId: conversationRoomId.value,
        );

        textEditingController.clear();
      }
    } catch (e, s) {
      log(e.toString());
      log(s.toString());
      final String error =
          e.toString().replaceAll('[cloud_firestore/permission-denied]', '');
      CustomSnackBarService.showErrorSnackBar('Error', error);
    }
  }
}
