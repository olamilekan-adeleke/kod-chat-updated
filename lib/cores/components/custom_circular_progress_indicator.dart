import 'package:flutter/material.dart';
import '../../cores/constants/color.dart';

CircularProgressIndicator loadingIndicator({color, backGroundColor, value}) {
  return CircularProgressIndicator(
    strokeWidth: 2.0,
    backgroundColor: backGroundColor ?? kcGreyLight,
    color: color ?? kcGrey400,
    value: value,
  );
}
