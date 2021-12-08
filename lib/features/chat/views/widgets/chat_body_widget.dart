import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kod_chat/cores/components/custom_text_widget.dart';
import 'package:kod_chat/cores/utils/emums.dart';
import 'package:kod_chat/features/chat/views/widgets/chat_message_widget.dart';
import '../../../../cores/utils/custom_sizer_utils.dart';
import '../../controllers/chat_messages_controller.dart';
import 'package:kod_chat/features/chat/model/chat_model.dart';

class ChatBodyWidget extends StatelessWidget {
  ChatBodyWidget(this.roomId, {Key? key}) : super(key: key);

  final String roomId;

  @override
  Widget build(BuildContext context) {
    final ChatMessagesController chatMessagesController =
        Get.find<ChatMessagesController>(tag: roomId);

    return Obx(() {
      return Stack(
        children: [
          Scrollbar(
            child: ListView.builder(
              reverse: true,
              controller: chatMessagesController.scrollController,
              padding: EdgeInsets.symmetric(horizontal: sizerSp(10.0)),
              itemCount: chatMessagesController.chats.length,
              itemBuilder: (_, int index) {
                final ChatModel chat = chatMessagesController.chats[index];

                return ChatMessageBubbleWidget(chat);
              },
            ),
          ),
          chatMessagesController.controllerState.value == ControllerState.busy
              ? Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    margin: EdgeInsets.only(top: sizerSp(5)),
                    padding: EdgeInsets.symmetric(vertical: sizerSp(5)),
                    height: sizerSp(20),
                    width: sizerSp(100),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(sizerSp(5)),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CupertinoActivityIndicator(radius: sizerSp(5)),
                        SizedBox(width: sizerSp(5)),
                        textWidget(
                          'Loading More Chats',
                          size: sizerSp(10),
                          color: Colors.grey.shade600,
                        ),
                      ],
                    ),
                  ),
                )
              : Container(),
        ],
      );
    });
  }
}
