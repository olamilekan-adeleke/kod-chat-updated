import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'custom_text_widget.dart';
import '../utils/custom_sizer_utils.dart';
import '../../cores/constants/color.dart';

Widget loadingIndicator({
  Color? color,
  Color? backGroundColor,
  double? value,
  String? text,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    mainAxisSize: MainAxisSize.min,
    children: [
      SizedBox(width: double.infinity),
      text == null
          ? Container()
          : textWidget(
              text,
              align: TextAlign.center,
              color: black,
            ),
      text == null ? Container() : SizedBox(height: sizerSp(5.0)),
      CircularProgressIndicator(
        strokeWidth: 2.0,
        backgroundColor: backGroundColor ?? kcGreyLight,
        color: color ?? kcGrey400,
        value: value,
      ),
    ],
  );
}

Widget loadingMoreWidget({
  Color? color,
  Color? backGroundColor,
  double? value,
  String? text,
}) {
  return Container(
    decoration: BoxDecoration(
      color: kcGrey100,
      borderRadius: BorderRadius.circular(sizerSp(4)),
    ),
    margin: EdgeInsets.symmetric(vertical: sizerSp(10)),
    padding: EdgeInsets.symmetric(
      vertical: sizerSp(5),
      horizontal: sizerSp(10),
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: sizerSp(15.0),
          width: sizerSp(15.0),
          child: CupertinoActivityIndicator(),
        ),
        SizedBox(width: sizerSp(5.0)),
        textWidget(
          'Loading More...',
          align: TextAlign.center,
          color: black,
        ),
      ],
    ),
  );
}
