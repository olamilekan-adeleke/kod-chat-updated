import 'package:flutter/material.dart';
import 'package:kod_chat/cores/components/custom_text_widget.dart';
import 'package:kod_chat/features/chat/model/chat_model.dart';

class ChatMessageBubbleWidget extends StatelessWidget {
  const ChatMessageBubbleWidget(this.chat, {Key? key}) : super(key: key);
  final ChatModel chat;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: textWidget(chat.message),
    );
  }
}
