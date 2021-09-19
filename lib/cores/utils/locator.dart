import 'package:kod_chat/features/chat/bindings/chat_binding.dart';
import 'package:kod_chat/features/search/binding/binding.dart';

import '../../../features/auth/binding/auth_binding.dart';

/// init all binding
void setUpLocator() {
  AuthenticationBinding().dependencies();
  SearchBinding().dependencies();
  ChatBinding().dependencies();
}
