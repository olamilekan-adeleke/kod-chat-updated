import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
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
    this.isFirstTime,
  });

  final String message;
  final MessageType type;
  final int? timestamp;
  final List<String>? mediaLink;
  final String senderId;
  final String receiverId;
  final bool? isFirstTime;

  Map<String, dynamic> toMap() {
    return {
      'message': message,
      'type': MessageTypeExtention.enumToString(type),
      'timestamp': timestamp ?? Timestamp.now().millisecondsSinceEpoch,
      'media_link': mediaLink,
      'sender_id': senderId,
      'receiver_id': receiverId,
      'is_first_time': isFirstTime,
    };
  }

  factory ChatModel.fromMap(Map<String, dynamic> map) {
    return ChatModel(
      message: map['message'],
      type: MessageTypeExtention.stringToEunm(map['type']),
      timestamp: map['timestamp'],
      mediaLink: map['media_link'] != null
          ? List<String>.from(map['media_link'])
          : null,
      senderId: map['sender_id'],
      receiverId: map['receiver_id'],
      isFirstTime: map['is_first_time'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatModel.fromJson(String source) =>
      ChatModel.fromMap(json.decode(source));
}
