import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../cores/constants/color.dart';
import '../../cores/constants/font_size.dart';


Widget textWidget(
  String text, {
  double? fontSize = kfsMeduim,
  Color? textColor = kcTextColor,
  FontWeight? fontWeight = FontWeight.w400,
  TextAlign? textAlign = TextAlign.justify,
  int? maxLines,
  TextOverflow? overflow,
}) {
  return Text(
    text,
    style: GoogleFonts.blinker(
      fontSize: fontSize,
      color: textColor,
      fontWeight: fontWeight,
    ),
    textAlign: textAlign,
    overflow: overflow,
    softWrap: true,
    maxLines: maxLines,
  );
}
