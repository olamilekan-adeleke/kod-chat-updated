import 'package:flutter/material.dart';
import 'package:kod_chat/cores/components/custom_scaffold_widget.dart';
import 'package:kod_chat/features/chat/views/widgets/chat_body_widget.dart';
import 'package:kod_chat/features/chat/views/widgets/chat_home_screen_appbar.dart';
import 'package:kod_chat/features/chat/views/widgets/chat_text_field_widget.dart';

class ChatHomeScreen extends StatelessWidget {
  const ChatHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return scaffold(
      usePadding: false,
      appBar: chatHomeAppBar(),
      body: Column(
        children: <Widget>[
          Expanded(child: ChatBodyWidget()),
          ChatTextFieldWidget(),
        ],
      ),
    );
  }
}
