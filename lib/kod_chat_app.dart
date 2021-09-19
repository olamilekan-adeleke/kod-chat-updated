import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kod_chat/cores/constants/color.dart';
import 'package:kod_chat/cores/utils/route_name.dart';
import 'package:kod_chat/features/auth/views/pages/forgot_password_screen.dart';
import 'package:kod_chat/features/auth/views/pages/login_screen.dart';
import 'package:kod_chat/features/auth/views/pages/signup_screen.dart';
import 'package:kod_chat/features/chat/views/screens/chat_home_screen.dart';
import 'package:kod_chat/features/conversations/view/screens/converstion_screen.dart';
import 'package:sizer/sizer.dart';

import 'features/auth/views/pages/wrapper.dart';
import 'features/search/views/screens/search_home_screen.dart';

class KodChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (_, __, ___) => GetMaterialApp(
        title: 'Kod Chat',
        theme: ThemeData(primaryColor: kcPrimaryColor),
        home: WrapperScreen(),
        getPages: getPages(),
        
      ),
    );
  }
}

List<GetPage<dynamic>>? getPages() {
  return <GetPage<dynamic>>[
    GetPage(name: RouteName.login, page: () => LoginScreen()),
    GetPage(name: RouteName.signup, page: () => SignupScreen()),
    GetPage(name: RouteName.forgotPassword, page: () => ForgotPasswordScreen()),
    GetPage(name: RouteName.home, page: () => ConversationScreen()),
    GetPage(name: RouteName.searchHome, page: () => SearchHomeScreen()),
    GetPage(name: RouteName.chatHome, page: () => ChatHomeScreen()),
  ];
}
