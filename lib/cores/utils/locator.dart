import '../../features/chat/bindings/chat_binding.dart';
import '../../features/conversations/bindings/conversation_binding.dart';
import '../../features/search/binding/binding.dart';

import '../../../features/auth/binding/auth_binding.dart';

/// init all binding
void setUpLocator() {
  AuthenticationBinding().dependencies();
  SearchBinding().dependencies();
  ChatBinding().dependencies();
  ConversationBinding().dependencies();
}
