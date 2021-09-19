import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:kod_chat/cores/utils/custom_sizer_utils.dart';
import 'package:kod_chat/features/chat/controllers/chat_controller.dart';

final ChatController chatController = Get.find<ChatController>();

Widget sendButton() {
  return GestureDetector(
    onTap: () => chatController.sendMessage(),
    child: Container(
      height: sizerSp(35),
      width: sizerSp(35),
      padding: EdgeInsets.fromLTRB(
        sizerSp(5),
        sizerSp(8),
        sizerSp(8),
        sizerSp(8),
      ),
      decoration: BoxDecoration(color: Colors.green, shape: BoxShape.circle),
      child: SvgPicture.asset('assets/images/send.svg', color: Colors.white),
    ),
  );
}
