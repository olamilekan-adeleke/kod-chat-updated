import 'package:flutter/material.dart';
import 'package:kod_chat/cores/components/custom_text_widget.dart';
import 'package:kod_chat/cores/components/image_widget.dart';
import 'package:kod_chat/cores/constants/color.dart';
import 'package:kod_chat/cores/utils/custom_sizer_utils.dart';
import 'package:kod_chat/cores/utils/emums.dart';

class ConversationListWidget extends StatelessWidget {
  const ConversationListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (_, __) => Divider(color: kcGrey400),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 45,
      itemBuilder: (_, int index) {
        return Container(
          height: sizerSp(45),
          margin: EdgeInsets.symmetric(vertical: sizerSp(2)),
          child: Row(
            children: <Widget>[
              SizedBox(
                height: sizerSp(40),
                width: sizerSp(40),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: KodImageWidget(
                    imageUrl:
                        'https://images6.alphacoders.com/909/thumb-1920-909641.png',
                    imageTypes: ImageTypes.network,
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
                      'Yetunde Emoji',
                      color: black,
                      fontWeight: FontWeight.w600,
                      size: sizerSp(14),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: sizerSp(2)),
                    textWidget(
                      'we recently worked on a search and search result solution for one of our current projects',
                      color: black,
                      fontWeight: FontWeight.w300,
                      size: sizerSp(13),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              const Spacer(),
              SizedBox(
                width: sizerSp(50),
                height: sizerSp(30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    textWidget(
                      'Yesterday',
                      color: Colors.green,
                      fontWeight: FontWeight.w400,
                      size: sizerSp(11),
                    ),
                    Container(
                      height: sizerSp(15),
                      width: sizerSp(15),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.green,
                      ),
                      child: textWidget(
                        '2',
                        color: white,
                        fontWeight: FontWeight.w200,
                        size: sizerSp(11),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
