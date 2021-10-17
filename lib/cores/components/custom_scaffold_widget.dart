import '../utils/custom_sizer_utils.dart';
import 'package:flutter/material.dart';

Widget scaffold({required body, appBar, usePadding = true}) {
  return Container(
    child: SafeArea(
      child: Scaffold(
        appBar: appBar,
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: usePadding ? sizerSp(10.0) : 0,
          ),
          child: body,
        ),
      ),
    ),
  );
}
