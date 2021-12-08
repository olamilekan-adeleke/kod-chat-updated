import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../cores/utils/emums.dart';
import '../../../cores/utils/extenions.dart';

class ChatModel {
  ChatModel({
    required this.message,
    required this.type,
    required this.senderId,
    required this.receiverId,
    this.isSent,
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
  final bool? isSent;

  Map<String, dynamic> toMap() {
    return {
      'message': message,
      'type': MessageTypeExtention.enumToString(type),
      'timestamp': timestamp ?? Timestamp.now().millisecondsSinceEpoch,
      'media_link': mediaLink,
      'sender_id': senderId,
      'receiver_id': receiverId,
      'is_first_time': isFirstTime,
      'is_sent': isSent,
    };
  }

  factory ChatModel.fromMap(Map<String, dynamic> map, bool hasPendingWrite ) {
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
      isSent: hasPendingWrite,
    );
  }

  String toJson() => json.encode(toMap());
}
