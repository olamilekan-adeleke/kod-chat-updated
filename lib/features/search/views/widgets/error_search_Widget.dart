import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kod_chat/cores/components/custom_text_widget.dart';
import 'package:kod_chat/cores/constants/color.dart';
import 'package:kod_chat/cores/utils/custom_sizer_utils.dart';
import 'package:kod_chat/features/search/controllers/search_controllers.dart';

class ErrorSearchWidget extends StatelessWidget {
  const ErrorSearchWidget({Key? key}) : super(key: key);

  static final SearchController searchController = Get.find<SearchController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SvgPicture.asset(
          'assets/images/not_found.svg',
          height: sizerSp(100),
          width: sizerSp(150),
        ),
        SizedBox(height: sizerSp(20), width: double.infinity),
        SizedBox(
          width: sizerWidth(60),
          child: Obx(() {
            return textWidget(
              searchController.errorMessage.value,
              size: sizerSp(15),
              color: black,
              fontWeight: FontWeight.w300,
              align: TextAlign.center,
            );
          }),
        ),
      ],
    );
  }
}
