import 'package:flutter/material.dart';
import 'package:kod_chat/features/auth/services/auth_services.dart';

class ConversationScreen extends StatelessWidget {
  const ConversationScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ConversationScreen'),
      ),
      body: Center(
        child: Container(
          child: GestureDetector(
            onTap: () => AuthenticationRepo().signOut(),
            child: Text('ConversationScreen'),
          ),
        ),
      ),
    );
  }
}
