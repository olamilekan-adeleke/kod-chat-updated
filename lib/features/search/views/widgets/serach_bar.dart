import 'package:flutter/material.dart';
import 'package:kod_chat/cores/components/custom_text_widget.dart';
import 'package:kod_chat/cores/constants/color.dart';
import 'package:kod_chat/cores/utils/custom_sizer_utils.dart';
import 'package:kod_chat/cores/utils/navigator_service.dart';
import 'package:kod_chat/cores/utils/route_name.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => NavigationService.navigateTo(RouteName.searchHome),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: sizerSp(10)),
        height: sizerSp(30),
        width: double.infinity,
        decoration: BoxDecoration(
          color: kcGrey100,
          borderRadius: BorderRadius.circular(sizerSp(5.0)),
        ),
        child: Row(
          children: <Widget>[
            Icon(Icons.search, size: sizerSp(15), color: kcGrey400),
            SizedBox(width: sizerSp(5)),
            textWidget('Search for other users', color: kcGrey400),
            const Spacer(),
            Icon(
              Icons.keyboard_voice_outlined,
              size: sizerSp(15),
              color: kcGrey400,
            ),
          ],
        ),
      ),
    );
  }
}
