import 'package:flutter/material.dart';
import 'package:kod_chat/cores/components/shimmer_widget.dart';
import 'package:kod_chat/cores/utils/custom_sizer_utils.dart';

class LoadingConversationWidget extends StatelessWidget {
  const LoadingConversationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 15,
      itemBuilder: (_, __) {
        return Container(
          margin: EdgeInsets.symmetric(vertical: sizerSp(10)),
          child: Align(
            child: Row(
              children: [
                shimmerRound(width: sizerSp(30), height: sizerSp(30)),
                SizedBox(width: sizerSp(5)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    shimmerRectangle(
                      width: sizerWidth(30),
                      height: sizerSp(10),
                    ),
                    SizedBox(height: sizerSp(3)),
                    shimmerRectangle(
                      width: sizerWidth(50),
                      height: sizerSp(13),
                    ),
                  ],
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    shimmerRectangle(
                      width: sizerSp(40),
                      height: sizerSp(10),
                    ),
                    SizedBox(height: sizerSp(5)),
                    // shimmerRound(width: sizerSp(15), height: sizerSp(15)),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
