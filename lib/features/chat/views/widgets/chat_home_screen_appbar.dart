import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kod_chat/cores/components/custom_text_widget.dart';
import 'package:kod_chat/cores/components/image_widget.dart';
import 'package:kod_chat/cores/constants/color.dart';
import 'package:kod_chat/cores/utils/custom_sizer_utils.dart';
import 'package:kod_chat/cores/utils/emums.dart';
import 'package:kod_chat/cores/utils/navigator_service.dart';
import 'package:kod_chat/features/chat/controllers/chat_controller.dart';

final ChatController chatController = Get.find<ChatController>();

PreferredSize chatHomeAppBar() {
  return PreferredSize(
    preferredSize: Size.fromHeight(sizerSp(40.0)),
    child: AppBar(
      backgroundColor: kcPrimaryColor,
      leading: Row(
        children: [
          GestureDetector(
            onTap: () => NavigationService.goBack(),
            child: Icon(
              Icons.arrow_back_ios_new_outlined,
              size: sizerSp(15),
            ),
          ),
          SizedBox(width: sizerSp(5)),
          SizedBox(
            height: sizerSp(30),
            width: sizerSp(30),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: KodImageWidget(
                imageUrl: chatController.getSelecteduser?.profilePicUrl ?? '',
                imageTypes:
                    chatController.getSelecteduser?.profilePicUrl == null
                        ? ImageTypes.none
                        : ImageTypes.network,
              ),
            ),
          ),
        ],
      ),
      elevation: 2.0,
      leadingWidth: sizerSp(50),
      title: textWidget(
        chatController.getSelecteduser?.fullName ?? '',
        fontWeight: FontWeight.w600,
        size: sizerSp(16),
        color: white,
      ),
    ),
  );
}
