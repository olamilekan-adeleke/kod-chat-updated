import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../cores/components/custom_text_widget.dart';
import '../../../../cores/utils/custom_sizer_utils.dart';
import '../../controllers/chat_messages_controller.dart';
import 'package:kod_chat/features/chat/model/chat_model.dart';

class ChatBodyWidget extends StatelessWidget {
  ChatBodyWidget(this.roomId, {Key? key}) : super(key: key);

  final String roomId;

  final ChatMessagesController chatMessagesController =
      Get.find<ChatMessagesController>(tag: '');

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: sizerSp(10.0)),
        itemCount: chatMessagesController.chats.length,
        itemBuilder: (_, int index) {
          final ChatModel chat = chatMessagesController.chats[index];
          return textWidget(chat.message);
        },
      ),
    );
  }
}
