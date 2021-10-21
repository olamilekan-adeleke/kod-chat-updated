import 'package:get/get.dart';
import '../../../cores/utils/emums.dart';
import '../../../cores/utils/local_database_controller.dart';
import '../../auth/model/user_details_model.dart';
import '../model/chat_model.dart';
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
    bool isFirstTime = false,
  }) async {
    final UserDetailsModel? user = localDatabaseController.user.value;

    final ChatModel chat = ChatModel(
      message: text,
      type: MessageType.text,
      senderId: user!.uid,
      receiverId: receiverId,
      isFirstTime: isFirstTime,
    );

    await chatService.addMessageToChatRoom(
      roomId: roomId,
      chat: chat,
      conversationRoomId: conversationRoomId,
    );
  }
}
