import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kod_chat/cores/constants/color.dart';
import 'package:kod_chat/cores/utils/custom_sizer_utils.dart';
import 'package:kod_chat/features/chat/controllers/chat_controller.dart';

final ChatController chatController = Get.find<ChatController>();

Widget chatTextField() {
  return TextFormField(
    maxLines: null,
    cursorColor: kcPrimaryColor,
    style: GoogleFonts.raleway(),
    controller: chatController.textEditingController,
    decoration: InputDecoration(
      filled: true,
      fillColor: Colors.grey.shade100,
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(sizerSp(20.0)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(sizerSp(20.0)),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(sizerSp(20.0)),
      ),
      hintText: 'Type something...',
      hintStyle: TextStyle(color: kcGrey700, fontWeight: FontWeight.w600),
      prefixIcon: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Icon(Icons.filter, color: kcGrey700, size: sizerSp(14)),
          SizedBox(height: sizerSp(10)),
        ],
      ),
      isDense: true,
      contentPadding: EdgeInsets.all(8),
    ),
    keyboardType: TextInputType.multiline,
    textInputAction: TextInputAction.newline,
    enableInteractiveSelection: true,
  );
}
