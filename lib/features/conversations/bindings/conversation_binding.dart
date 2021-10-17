import 'package:get/get.dart';
import 'package:kod_chat/features/conversations/controllres/conversation_controller.dart';

class ConversationBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ConversationController>(ConversationController());
  }
}
