import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../cores/components/custom_text_widget.dart';
import '../../../../cores/components/image_widget.dart';
import '../../../../cores/constants/color.dart';
import '../../../../cores/utils/custom_sizer_utils.dart';
import 'package:kod_chat/cores/utils/emums.dart';
import 'package:kod_chat/cores/utils/navigator_service.dart';
import 'package:kod_chat/features/chat/controllers/chat_controller.dart';

final ChatController chatController = Get.find<ChatController>();

Widget chatHomeAppBar() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: sizerSp(5)),
    height: sizerSp(50),
    decoration: BoxDecoration(
      color: kcPrimaryColor,
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(sizerSp(8)),
        bottomRight: Radius.circular(sizerSp(8)),
      ),
    ),
    child: Row(
      children: [
        GestureDetector(
          onTap: () => NavigationService.goBack(),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.arrow_back_ios_new_outlined,
                size: sizerSp(15),
                color: white,
              ),
              SizedBox(width: sizerSp(5)),
              SizedBox(
                height: sizerSp(30),
                width: sizerSp(30),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: KodImageWidget(
                        imageUrl:
                            chatController.getSelectedUser?.profilePicUrl ?? '',
                        imageTypes:
                            chatController.getSelectedUser?.profilePicUrl ==
                                    null
                                ? ImageTypes.none
                                : ImageTypes.network,
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        height: sizerSp(8),
                        width: sizerSp(8),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.green,
                          border: Border.all(color: white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: sizerSp(10)),
        textWidget(
          chatController.getSelectedUser?.fullName ?? '',
          fontWeight: FontWeight.w800,
          size: sizerSp(18),
          color: white,
        ),
        const Spacer(),
        Icon(
          Icons.more_vert_outlined,
          size: sizerSp(15),
          color: white,
        ),
      ],
    ),
  );
}
