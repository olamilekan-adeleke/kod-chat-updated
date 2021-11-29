import 'package:flutter/material.dart';
import '../../../../cores/utils/custom_sizer_utils.dart';
import 'chat_send_button.dart';
import 'text_field.dart';

class ChatTextFieldWidget extends StatelessWidget {
  const ChatTextFieldWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: sizerSp(5.0),
        vertical: sizerSp(5.0),
      ),
      constraints: BoxConstraints(
        minHeight: sizerSp(30),
        maxHeight: sizerSp(50),
      ),
      width: double.infinity,
      child: Row(
        children: [
          Expanded(child: chatTextField()),
          SizedBox(width: sizerSp(3)),
          sendButton(),
        ],
      ),
    );
  }
}
