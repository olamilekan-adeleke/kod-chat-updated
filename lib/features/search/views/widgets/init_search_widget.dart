import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kod_chat/cores/components/custom_text_widget.dart';
import 'package:kod_chat/cores/constants/color.dart';
import 'package:kod_chat/cores/utils/custom_sizer_utils.dart';

class InitSearchWidget extends StatelessWidget {
  const InitSearchWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SvgPicture.asset(
          'assets/images/search_online.svg',
          height: sizerSp(100),
          width: sizerSp(150),
        ),
        SizedBox(height: sizerSp(20), width: double.infinity),
        SizedBox(
          width: sizerWidth(60),
          child: textWidget(
            'Search for your friends or other user buy their name.',
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
