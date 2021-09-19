import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:kod_chat/cores/utils/emums.dart';
import 'package:kod_chat/cores/utils/local_database_controller.dart';
import 'package:kod_chat/features/auth/model/user_details_model.dart';
import 'package:kod_chat/features/chat/model/chat_model.dart';
import 'package:kod_chat/features/chat/services/chat_service.dart';

class SendMessageController extends GetxController {
  static final LocalDatabaseController localDatabaseController =
      Get.find<LocalDatabaseController>();
  static final ChatService chatService = ChatService();

  Future<void> sendMessage({
    required String text,
    required String receiverId,
    String? conversationRoomId,
    String? roomId,
  }) async {
    final UserDetailsModel? user = localDatabaseController.user.value;

    final ChatModel chat = ChatModel(
      message: text,
      type: MessageType.text,
      senderId: user!.uid,
      receiverId: receiverId,
    );

    await chatService.addMessageToChatRoom(
      roomId: roomId,
      chat: chat,
      conversationRoomId: conversationRoomId,
    );
  }
}
