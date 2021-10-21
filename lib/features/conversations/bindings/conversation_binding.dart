import 'package:get/get.dart';
import '../controllres/conversation_controller.dart';

class ConversationBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ConversationController>(ConversationController());
  }
}
