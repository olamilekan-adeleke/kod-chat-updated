import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:kod_chat/cores/components/custom_text_widget.dart';
import 'package:kod_chat/cores/constants/color.dart';
import 'package:kod_chat/cores/utils/custom_sizer_utils.dart';
import 'package:kod_chat/features/auth/services/auth_services.dart';
import 'package:kod_chat/features/chat/model/chat_model.dart';

class ChatMessageBubbleWidget extends StatelessWidget {
  const ChatMessageBubbleWidget(this.chat, {Key? key}) : super(key: key);
  final ChatModel chat;

  static final Color receiverColor = Color(0xffF3F7FA);
  static final Color senderColor = Color(0xff125589);
  static final AuthenticationRepo authenticationRepo =
      Get.find<AuthenticationRepo>();

  @override
  Widget build(BuildContext context) {
    final bool isSender = authenticationRepo.getUserUid() == chat.senderId;

    return Align(
      alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: sizerSp(5)),
        padding: EdgeInsets.symmetric(
          horizontal: sizerSp(5),
          vertical: sizerSp(8),
        ),
        decoration: BoxDecoration(
          color: isSender ? senderColor : receiverColor,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(sizerSp(8)),
            bottomRight: Radius.circular(sizerSp(8)),
            topLeft: Radius.circular(sizerSp(isSender ? 8 : 0)),
            topRight: Radius.circular(sizerSp(isSender ? 0 : 8)),
          ),
        ),
        constraints: BoxConstraints(maxWidth: sizerWidth(60)),
        child: textWidget(
          chat.message,
          fontWeight: FontWeight.w600,
          color: isSender ? white : kcTextColor,
        ),
      ),
    );
  }
}