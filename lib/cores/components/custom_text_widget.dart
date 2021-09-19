import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../cores/constants/color.dart';
import '../../cores/constants/font_size.dart';


Widget textWidget(
  String text, {
  double? size = kfsMeduim,
  Color? color = kcTextColor,
  FontWeight? fontWeight = FontWeight.w400,
  TextAlign? align = TextAlign.justify,
  int? maxLines,
  TextOverflow? overflow,
}) {
  return Text(
    text,
    style: GoogleFonts.blinker(
      fontSize: size,
      color: color,
      fontWeight: fontWeight,
    ),
    textAlign: align,
    overflow: overflow,
    softWrap: true,
    maxLines: maxLines,
  );
}
