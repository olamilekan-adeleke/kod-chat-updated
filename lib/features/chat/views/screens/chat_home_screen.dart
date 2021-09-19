import 'package:flutter/material.dart';
import 'package:kod_chat/cores/components/custom_scaffold_widget.dart';
import 'package:kod_chat/cores/components/custom_text_widget.dart';
import 'package:kod_chat/cores/utils/custom_sizer_utils.dart';
import 'package:kod_chat/features/chat/views/widgets/chat_home_screen_appbar.dart';
import 'package:kod_chat/features/chat/views/widgets/chat_text_field_widget.dart';

class ChatHomeScreen extends StatelessWidget {
  const ChatHomeScreen({Key? key}) : super(key: key);

  // static final ChatController _chatController = Get.find<ChatController>();

  @override
  Widget build(BuildContext context) {
    return scaffold(
      usePadding: false,
      appBar: chatHomeAppBar(),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Scrollbar(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: sizerSp(10.0)),
                itemCount: 500,
                itemBuilder: (_, __) {
                  return textWidget('text');
                },
              ),
            ),
          ),
          ChatTextFieldWidget(),
        ],
      ),
    );
  }
}
