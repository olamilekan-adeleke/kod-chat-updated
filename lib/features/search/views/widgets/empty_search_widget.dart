import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../cores/components/custom_text_widget.dart';
import '../../../../cores/constants/color.dart';
import '../../../../cores/utils/custom_sizer_utils.dart';
import '../../controllers/search_controllers.dart';

class EmptySearchWidget extends StatelessWidget {
  const EmptySearchWidget({Key? key}) : super(key: key);

  static final SearchController searchController = Get.find<SearchController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SvgPicture.asset(
          'assets/images/empty_box.svg',
          height: sizerSp(100),
          width: sizerSp(150),
        ),
        SizedBox(height: sizerSp(20), width: double.infinity),
        SizedBox(
          width: sizerWidth(60),
          child: textWidget(
            'Opps, No user with the name "${searchController.searchTextEditingController.text.trim()}" was found!',
            size: sizerSp(15),
            color: black,
            fontWeight: FontWeight.w300,
            align: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
