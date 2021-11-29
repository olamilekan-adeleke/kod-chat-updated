import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';

import '../../../../cores/components/custom_text_widget.dart';
import '../../../../cores/components/image_widget.dart';
import '../../../../cores/constants/color.dart';
import '../../../../cores/utils/custom_sizer_utils.dart';
import '../../../../cores/utils/emums.dart';
import '../../../../cores/utils/navigator_service.dart';
import '../../../../cores/utils/route_name.dart';
import '../../../../cores/utils/time_ago.dart';
import '../../../chat/controllers/chat_controller.dart';
import '../../model/conversation_model.dart';

class ConversationListTileWidget extends StatelessWidget {
  const ConversationListTileWidget({
    Key? key,
    required this.conversation,
  }) : super(key: key);

  final ConversationModel conversation;
  static final ChatController chatController = Get.find<ChatController>();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        chatController.setSelectedUser(
          conversation.userChattingWith,
          selectedChatRoomId: conversation.chatRoomId,
          selectedConversationRoomId: conversation.conversationRoomId,
        );
        
      },
      child: Container(
        height: sizerSp(45),
        margin: EdgeInsets.symmetric(vertical: sizerSp(2)),
        child: Row(
          children: <Widget>[
            SizedBox(
              height: sizerSp(40),
              width: sizerSp(40),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: KodImageWidget(
                  imageUrl: conversation.userChattingWith.profilePicUrl ?? '',
                  imageTypes:
                      conversation.userChattingWith.profilePicUrl != null
                          ? ImageTypes.network
                          : ImageTypes.none,
                ),
              ),
            ),
            SizedBox(width: sizerSp(5)),
            SizedBox(
              width: sizerWidth(60),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  textWidget(
                    conversation.userChattingWith.fullName,
                    color: black,
                    fontWeight: FontWeight.w600,
                    size: sizerSp(14),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: sizerSp(2)),
                  textWidget(
                    conversation.lastMessage.message,
                    color: black,
                    fontWeight: FontWeight.w300,
                    size: sizerSp(13),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            const Spacer(),
            SizedBox(
              width: sizerSp(50),
              height: sizerSp(30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  textWidget(
                    displayTimeAgo(
                      DateTime.fromMillisecondsSinceEpoch(
                              conversation.timestamp)
                          .toIso8601String(),
                    ),
                    color: Colors.green,
                    fontWeight: FontWeight.w400,
                    size: sizerSp(11),
                  ),
                  Container(
                    height: sizerSp(15),
                    width: sizerSp(15),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.green,
                    ),
                    child: textWidget(
                      '2',
                      color: white,
                      fontWeight: FontWeight.w200,
                      size: sizerSp(11),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
