import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/color.dart';
import '../utils/custom_sizer_utils.dart';

Widget searchTextField({
  required TextEditingController textEditingController,
  required String hint,
  Function()? callback,
}) {
  return TextFormField(
    maxLines: 1,
    cursorColor: kcPrimaryColor,
    style: GoogleFonts.raleway(),
    controller: textEditingController,
    decoration: InputDecoration(
      filled: true,
      fillColor: Colors.grey.shade100,
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(sizerSp(4.0)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(sizerSp(5.0)),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(sizerSp(5.0)),
      ),
      hintText: hint,
      hintStyle: TextStyle(color: kcGrey400, fontWeight: FontWeight.w600),
      prefixIcon: Icon(Icons.search, color: kcGrey400, size: sizerSp(14)),
      isDense: true,
      contentPadding: EdgeInsets.all(8),
    ),
    keyboardType: TextInputType.text,
    textInputAction: TextInputAction.search,
    onFieldSubmitted: (_) => callback!(),
  );
}
