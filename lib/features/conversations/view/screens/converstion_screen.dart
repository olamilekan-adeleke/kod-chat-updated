import 'package:flutter/material.dart';
import 'package:kod_chat/features/conversations/view/widgets/conversation_screen_header.dart';
import '../../../../cores/components/custom_scaffold_widget.dart';
import '../../../../cores/utils/custom_sizer_utils.dart';
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
          conversationScreenHeader(),
          SizedBox(height: sizerSp(10)),
          SearchBarWidget(),
          SizedBox(height: sizerSp(10)),
          Expanded(child: ConversationListWidget()),
        ],
      ),
    );
  }
}
