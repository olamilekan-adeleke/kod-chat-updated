import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kod_chat/cores/components/image_widget.dart';
import 'package:kod_chat/cores/utils/emums.dart';
import 'package:kod_chat/cores/utils/local_database_controller.dart';
import '../../../../cores/components/custom_text_widget.dart';
import '../../../../cores/constants/color.dart';
import '../../../../cores/utils/custom_sizer_utils.dart';

Container conversationScreenHeader() {
  final LocalDatabaseController localDatabaseController =
      Get.find<LocalDatabaseController>();

  return Container(
    padding: EdgeInsets.symmetric(horizontal: sizerSp(10)),
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
        textWidget(
          'Messages',
          size: sizerSp(25),
          color: white,
          fontWeight: FontWeight.w600,
        ),
        const Spacer(),
        Icon(Icons.search, size: sizerSp(20), color: white),
        SizedBox(width: sizerSp(8)),
        Icon(Icons.notifications, size: sizerSp(20), color: white),
        SizedBox(width: sizerSp(8)),
        SizedBox(
          height: sizerSp(25),
          width: sizerSp(25),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: KodImageWidget(
              imageUrl: localDatabaseController.user.value.profilePicUrl ?? '',
              imageTypes:
                  localDatabaseController.user.value.profilePicUrl == null
                      ? ImageTypes.none
                      : ImageTypes.network,
            ),
          ),
        ),
      ],
    ),
  );
}
