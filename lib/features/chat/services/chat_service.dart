import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/chat_model.dart';
import 'package:uuid/uuid.dart';

class ChatService {
  static final CollectionReference chatCollectionRef =
      FirebaseFirestore.instance.collection('chats');

  Future<void> addMessageToChatRoom({
    String? roomId,
    String? conversationRoomId,
    required ChatModel chat,
  }) async {
    // roomId = "a631c610-19a9-11ec-bd0b-f565711c8cc9";
    final String chatRoomId = roomId ?? Uuid().v1();

    await chatCollectionRef.doc(chatRoomId).collection('chat_room').add({
      "room_id": roomId,
      "conversation_room_id": conversationRoomId,
      ...chat.toMap(),
    });
  }
}
