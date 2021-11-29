import 'package:flutter/material.dart';
import '../constants/color.dart';
import '../utils/custom_sizer_utils.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmerWidget extends StatelessWidget {
  const CustomShimmerWidget({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade50,
      child: child,
    );
  }
}

Widget shimmerRectangle({double? height, double? width}) {
  return Shimmer.fromColors(
    baseColor: Colors.grey.shade300,
    highlightColor: Colors.grey.shade50,
    child: Container(
      height: height ?? sizerSp(40),
      width: width ?? double.infinity,
      decoration: BoxDecoration(color: kcGrey100),
    ),
  );
}

Widget shimmerRound({double? height, double? width}) {
  return Shimmer.fromColors(
    baseColor: Colors.grey.shade300,
    highlightColor: Colors.grey.shade50,
    child: Container(
        height: height ?? sizerSp(40),
        width: width ?? sizerSp(40),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: kcGrey100,
        )),
  );
}
