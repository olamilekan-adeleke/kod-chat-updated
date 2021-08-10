import 'package:flutter/material.dart';

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
          child: Text('ConversationScreen'),
        ),
      ),
    );
  }
}
