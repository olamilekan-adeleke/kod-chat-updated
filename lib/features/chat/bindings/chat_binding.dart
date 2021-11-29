import 'package:get/get.dart';
import 'package:kod_chat/features/chat/controllers/chat_room_instance_manager.dart';
import '../controllers/chat_controller.dart';
// import 'package:kod_chat/features/chat/controllers/chat_messages_controller.dart';
import 'package:kod_chat/features/chat/controllers/send_message_controller.dart';
import 'package:kod_chat/features/chat/controllers/test_controller.dart';

class ChatBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ChatRoomInstanceManager>(ChatRoomInstanceManager());
    Get.put<SendMessageController>(SendMessageController());
    Get.put<ChatController>(ChatController());
    Get.put<TestController>(TestController());
    // Get.create<ChatMessagesController>(()=> ChatMessagesController());
  }
}
