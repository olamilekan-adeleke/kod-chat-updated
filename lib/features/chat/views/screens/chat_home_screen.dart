import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kod_chat/features/chat/controllers/chat_controller.dart';
import '../../../../cores/components/custom_scaffold_widget.dart';
import '../widgets/chat_body_widget.dart';
import '../widgets/chat_home_screen_appbar.dart';
import 'package:kod_chat/features/chat/views/widgets/chat_text_field_widget.dart';

class ChatHomeScreen extends StatelessWidget {
  ChatHomeScreen({Key? key}) : super(key: key);

  final ChatController chatController =
      Get.find<ChatController>();

  @override
  Widget build(BuildContext context) {
    return scaffold(
      usePadding: false,
      appBar: chatHomeAppBar(),
      body: Column(
        children: <Widget>[
          Expanded(child: ChatBodyWidget(chatController.chatRoomId.value)),
          ChatTextFieldWidget(),
        ],
      ),
    );
  }
}
