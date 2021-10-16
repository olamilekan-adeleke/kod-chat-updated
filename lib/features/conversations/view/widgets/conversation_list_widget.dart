import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kod_chat/cores/components/error_widget.dart';
import 'package:kod_chat/cores/constants/color.dart';
import 'package:kod_chat/cores/utils/emums.dart';
import 'package:kod_chat/features/conversations/controllres/conversation_controller.dart';
import 'package:kod_chat/features/conversations/model/conversation_model.dart';
import 'package:kod_chat/features/conversations/view/widgets/conversation_listTile_widget.dart';
import 'package:kod_chat/features/conversations/view/widgets/loading_conversation_widget.dart';

class ConversationListWidget extends StatelessWidget {
  const ConversationListWidget({Key? key}) : super(key: key);
  static final ConversationController conversationController =
      Get.find<ConversationController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final List<ConversationModel> conversations =
          conversationController.conversations;

      if (conversationController.controllerState.value ==
              ControllerState.busy &&
          conversationController.conversations.isEmpty) {
        return LoadingConversationWidget();
      }

      if (conversationController.controllerState.value ==
              ControllerState.error &&
          conversationController.conversations.isEmpty) {
        return KodErrorWidget(
          message: conversationController.errorText.value,
          callback: () => conversationController.getConversations(),
        );
      }

      return ListView.separated(
        controller: conversationController.scrollController,
        separatorBuilder: (_, __) => Divider(color: kcGrey400),
        shrinkWrap: true,
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: conversations.length,
        itemBuilder: (_, int index) {
          final ConversationModel conversation = conversations[index];

          return ConversationListTileWidget(conversation: conversation);
        },
      );
    });
  }
}
