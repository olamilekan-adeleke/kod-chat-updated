import 'package:get/get.dart';
import 'package:kod_chat/features/chat/controllers/chat_controller.dart';
import 'package:kod_chat/features/chat/controllers/send_message_controller.dart';

class ChatBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SendMessageController>(SendMessageController());
    Get.put<ChatController>(ChatController());
  }
}