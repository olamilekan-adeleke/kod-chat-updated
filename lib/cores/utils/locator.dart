import 'package:kod_chat/features/search/binding/binding.dart';

import '../../../features/auth/binding/auth_binding.dart';

/// init all binding
void setUpLocator() {
  AuthenticationBinding().dependencies();
  SearchBinding().dependencies();
}
