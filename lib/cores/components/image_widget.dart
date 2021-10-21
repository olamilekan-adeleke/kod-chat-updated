import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'shimmer_widget.dart';
import '../constants/color.dart';
import '../utils/custom_sizer_utils.dart';
import '../../cores/utils/emums.dart';

class KodImageWidget extends StatelessWidget {
  const KodImageWidget({
    Key? key,
    required this.imageUrl,
    required this.imageTypes,
  }) : super(key: key);

  final String imageUrl;
  final ImageTypes imageTypes;

  @override
  Widget build(BuildContext context) {
    switch (imageTypes) {
      case ImageTypes.network:
        return CachedNetworkImage(
          imageUrl: imageUrl,
          fit: BoxFit.fill,
          errorWidget: (_, __, ___) => Container(
            alignment: Alignment.center,
            color: kcGrey100,
            child: Icon(
              Icons.error,
              size: sizerSp(15),
              color: kcGrey400,
            ),
          ),
          placeholder: (_, __) => shimmerRound(),
        );

      case ImageTypes.file:
        return Image.file(
          File(imageUrl),
          fit: BoxFit.fill,
          errorBuilder: (_, __, ___) => Container(
            alignment: Alignment.center,
            color: kcGrey100,
            child: Icon(
              Icons.error,
              size: sizerSp(15),
              color: kcGrey400,
            ),
          ),
        );
      case ImageTypes.asset:
        return Image.asset(
          imageUrl,
          fit: BoxFit.fill,
          errorBuilder: (_, __, ___) => Container(
            alignment: Alignment.center,
            color: kcGrey100,
            child: Icon(
              Icons.error,
              size: sizerSp(15),
              color: kcGrey400,
            ),
          ),
        );

      case ImageTypes.none:
        return Container(
          alignment: Alignment.center,
          color: kcGrey100,
          child: Icon(
            Icons.person,
            size: sizerSp(15),
            color: kcGrey400,
          ),
        );
    }
  }
}
