import 'dart:convert';
import 'package:firebase_database/firebase_database.dart';
import 'package:kod_chat/cores/utils/emums.dart';
import 'package:kod_chat/cores/utils/extenions.dart';

class ChatModel {
  ChatModel({
    required this.message,
    required this.type,
    required this.senderId,
    required this.receiverId,
    this.timestamp,
    this.mediaLink,
  });

  final String message;
  final MessageType type;
  final int? timestamp;
  final List<String>? mediaLink;
  final String senderId;
  final String receiverId;

  Map<String, dynamic> toMap() {
    return {
      'message': message,
      'type': MessageTypeExtention.eumnToString(type),
      'timestamp': ServerValue.timestamp,
      'media_link': mediaLink,
      'sender_id': senderId,
      'receiver_id': receiverId,
    };
  }

  factory ChatModel.fromMap(Map<String, dynamic> map) {
    return ChatModel(
      message: map['message'],
      type: MessageTypeExtention.stringToEunm(map['type']),
      timestamp: map['timestamp'],
      mediaLink: List<String>.from(map['media_link']),
      senderId: map['sender_id'],
      receiverId: map['receiver_id'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatModel.fromJson(String source) =>
      ChatModel.fromMap(json.decode(source));
}
