import 'package:flutter/material.dart';
import 'package:kod_chat/cores/components/custom_text_widget.dart';
import 'package:kod_chat/cores/components/image_widget.dart';
import 'package:kod_chat/cores/constants/color.dart';
import 'package:kod_chat/cores/utils/custom_sizer_utils.dart';
import 'package:kod_chat/cores/utils/emums.dart';
import 'package:kod_chat/features/auth/model/user_details_model.dart';

class SearchItemWidget extends StatelessWidget {
  const SearchItemWidget(this.user, {Key? key}) : super(key: key);

  final UserDetailsModel user;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          SizedBox(
            height: sizerSp(40),
            width: sizerSp(40),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: KodImageWidget(
                imageUrl: user.profilePicUrl ?? '',
                imageTypes: user.profilePicUrl == null
                    ? ImageTypes.none
                    : ImageTypes.network,
              ),
            ),
          ),
          SizedBox(width: sizerSp(5)),
          SizedBox(
            width: sizerWidth(60),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                textWidget(
                  user.fullName,
                  color: black,
                  fontWeight: FontWeight.w600,
                  size: sizerSp(12),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: sizerSp(2)),
                textWidget(
                  user.bio ?? '',
                  color: black,
                  fontWeight: FontWeight.w300,
                  size: sizerSp(12),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
