import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kod_chat/cores/constants/color.dart';

import 'features/auth/views/pages/wrapper.dart';

class KodChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Kod Chat',
      theme: ThemeData(
        primaryColor: kcPrimaryColor,
      ),
      home: WrapperScreen(),
    );
  }
}
