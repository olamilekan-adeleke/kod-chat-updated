import 'package:flutter/material.dart';
import 'package:kod_chat/cores/components/custom_scaffold_widget.dart';
import 'package:kod_chat/cores/components/custom_text_widget.dart';
import 'package:kod_chat/cores/constants/color.dart';
import 'package:kod_chat/cores/utils/custom_sizer_utils.dart';
import 'package:kod_chat/features/auth/services/auth_services.dart';
import 'package:kod_chat/features/conversations/view/widgets/conversation_list_widget.dart';
import 'package:kod_chat/features/search/views/widgets/serach_bar.dart';

class ConversationScreen extends StatelessWidget {
  const ConversationScreen();

  @override
  Widget build(BuildContext context) {
    return scaffold(
      body: ListView(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: sizerSp(20)),
          GestureDetector(
            onTap: () => AuthenticationRepo().signOut(),
            child: textWidget(
              'Messages',
              size: sizerSp(25),
              color: black,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: sizerSp(10)),
          SearchBarWidget(),
          SizedBox(height: sizerSp(10)),
          ConversationListWidget(),
        ],
      ),
    );
  }
}
