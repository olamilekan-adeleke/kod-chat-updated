import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kod_chat/features/auth/model/user_details_model.dart';
import 'package:kod_chat/features/chat/controllers/send_message_controller.dart';

class ChatController extends GetxController {
  final TextEditingController textEditingController = TextEditingController();
  final Rx<UserDetailsModel> _selecteduser =
      UserDetailsModel(email: '', fullName: '', phoneNumber: '', uid: '').obs;
  final SendMessageController sendMessageController =
      Get.find<SendMessageController>();

  UserDetailsModel? get getSelecteduser {
    if (_selecteduser.value.email.isEmpty) return null;

    return _selecteduser.value;
  }

  set setSelecteduser(UserDetailsModel selecteduser) {
    _selecteduser.value = selecteduser;
  }

  Future<void> sendMessage() async {
    final String text = textEditingController.text.trim();

    //TODO: get room id and pass it here
    //TODO: get conversation room id and pass it here

    await sendMessageController.sendMessage(
      text: text,
      receiverId: _selecteduser.value.uid,
      roomId: null,
      conversationRoomId: null,
    );

    textEditingController.clear();
  }
}
