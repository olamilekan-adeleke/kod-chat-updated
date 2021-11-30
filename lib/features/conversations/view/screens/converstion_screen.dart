import 'package:flutter/material.dart';
import '../../../../cores/components/custom_scaffold_widget.dart';
import '../../../../cores/components/custom_text_widget.dart';
import '../../../../cores/constants/color.dart';
import '../../../../cores/utils/custom_sizer_utils.dart';
import '../../../auth/services/auth_services.dart';
import '../widgets/conversation_list_widget.dart';
import '../../../search/views/widgets/serach_bar.dart';

class ConversationScreen extends StatelessWidget {
  const ConversationScreen();

  @override
  Widget build(BuildContext context) {
    return scaffold(
      usePadding: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // SizedBox(height: sizerSp(20)),
          Container(
            padding: EdgeInsets.symmetric(horizontal: sizerSp(10)),
            height: sizerSp(50),
            decoration: BoxDecoration(
              color: kcPrimaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(sizerSp(8)),
                bottomRight: Radius.circular(sizerSp(8)),
              ),
            ),
            child: Row(
              children: [
                textWidget(
                  'Messages',
                  size: sizerSp(25),
                  color: white,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
          ),
          SizedBox(height: sizerSp(10)),
          SearchBarWidget(),
          SizedBox(height: sizerSp(10)),
          Expanded(child: ConversationListWidget()),
        ],
      ),
    );
  }
}
