import 'package:firebase_database/firebase_database.dart';
import 'package:kod_chat/features/chat/model/chat_model.dart';
import 'package:uuid/uuid.dart';

class ChatService {
  static final chatCollectionRef =
      FirebaseDatabase.instance.reference().child('chats');

  Future<void> addMessageToChatRoom({
    String? roomId,
    String? conversationRoomId,
    required ChatModel chat,
  }) async {
    // roomId = "a631c610-19a9-11ec-bd0b-f565711c8cc9";
    final String chatRoomId = roomId ?? Uuid().v1();

    await chatCollectionRef.child(chatRoomId).child('chat_room').push().set({
      "room_id": roomId,
      "conversation_room_id": conversationRoomId,
      ...chat.toMap(),
    });
  }
}
