import '../../../features/auth/binding/auth_binding.dart';

/// init all binding
void setUpLocator() {
  AuthenticationBinding().dependencies();
}
