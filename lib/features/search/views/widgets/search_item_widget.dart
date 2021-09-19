import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kod_chat/cores/components/custom_text_widget.dart';
import 'package:kod_chat/cores/components/image_widget.dart';
import 'package:kod_chat/cores/constants/color.dart';
import 'package:kod_chat/cores/utils/custom_sizer_utils.dart';
import 'package:kod_chat/cores/utils/emums.dart';
import 'package:kod_chat/features/auth/model/user_details_model.dart';
import 'package:kod_chat/features/search/controllers/search_controllers.dart';

class SearchItemWidget extends StatelessWidget {
  const SearchItemWidget(this.user, {Key? key}) : super(key: key);

  final UserDetailsModel user;
  static final SearchController searchController = Get.find<SearchController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => searchController.selectUser(user),
      child: SizedBox(
        width: double.infinity,
        child: Row(
          mainAxisSize: MainAxisSize.max,
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
              width: sizerWidth(70),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(width: double.infinity),
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
      ),
    );
  }
}
