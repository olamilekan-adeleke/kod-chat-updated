import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../cores/constants/color.dart';
import '../../../../cores/utils/custom_sizer_utils.dart';
import '../../controllers/chat_controller.dart';

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
        borderRadius: BorderRadius.circular(sizerSp(5.0)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(sizerSp(5.0)),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(sizerSp(5.0)),
      ),
      hintText: 'Type something...',
      hintStyle: TextStyle(color: kcGrey400, fontWeight: FontWeight.w600),
      suffixIcon: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Icon(Icons.filter, color: kcGrey400, size: sizerSp(14)),
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
