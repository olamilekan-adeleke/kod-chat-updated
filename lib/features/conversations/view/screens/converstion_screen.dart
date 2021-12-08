import 'package:flutter/material.dart';
import 'package:kod_chat/features/conversations/view/widgets/conversation_screen_header.dart';
import '../../../../cores/components/custom_scaffold_widget.dart';
import '../widgets/conversation_list_widget.dart';

class ConversationScreen extends StatelessWidget {
  const ConversationScreen();

  @override
  Widget build(BuildContext context) {
    return scaffold(
      usePadding: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          conversationScreenHeader(),
          Expanded(child: ConversationListWidget()),
        ],
      ),
    );
  }
}
