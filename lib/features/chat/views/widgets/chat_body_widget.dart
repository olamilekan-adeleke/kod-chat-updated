import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kod_chat/cores/components/custom_text_widget.dart';
import 'package:kod_chat/cores/utils/custom_sizer_utils.dart';
import 'package:kod_chat/features/chat/controllers/chat_messages_controller.dart';
import 'package:kod_chat/features/chat/model/chat_model.dart';

class ChatBodyWidget extends StatelessWidget {
  const ChatBodyWidget({Key? key}) : super(key: key);

  static final ChatMessagesController _chatMessagesController =
      Get.find<ChatMessagesController>();

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: sizerSp(10.0)),
        itemCount: _chatMessagesController.chats.length,
        itemBuilder: (_, int index) {
          final ChatModel chat = _chatMessagesController.chats[index];
          return textWidget(chat.message);
        },
      ),
    );
  }
}
