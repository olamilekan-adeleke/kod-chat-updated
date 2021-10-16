import 'dart:convert';

import 'package:get/instance_manager.dart';
import 'package:kod_chat/features/auth/model/user_details_model.dart';
import 'package:kod_chat/features/auth/services/auth_services.dart';

import 'package:kod_chat/features/chat/model/chat_model.dart';

final AuthenticationRepo authenticationRepo = Get.find<AuthenticationRepo>();

class ConversationModel {
  ConversationModel({
    required this.lastMessage,
    required this.timestamp,
    required this.members,
    required this.chatRoomId,
    required this.userChattingWith,
  });

  final ChatModel lastMessage;
  final int timestamp;
  final List<String> members;
  final String chatRoomId;
  final UserDetailsModel userChattingWith;

  Map<String, dynamic> toMap() {
    return {
      'last_message': lastMessage.toMap(),
      'timestamp': timestamp,
      'members': members,
      'chat_room_id': chatRoomId,
      'user_chatting_with': userChattingWith.toMap(),
    };
  }

  factory ConversationModel.fromMap(Map<String, dynamic> map) {
    final List<String> keys = map.keys.toList();

    final String otherUserId = keys.firstWhere(
        (element) => knownKeys.contains(element) == false,
        orElse: () => authenticationRepo.getUserUid() ?? '');

    final UserDetailsModel user = UserDetailsModel(
      uid: otherUserId,
      email: '',
      fullName: map[otherUserId]['full_name'],
      phoneNumber: '',
      profilePicUrl: map[otherUserId]['profile_pic_url'],
    );

    return ConversationModel(
      lastMessage: ChatModel.fromMap(map['last_message']),
      timestamp: map['timestamp'] as int,
      members: List<String>.from(map['members']),
      chatRoomId: map['chat_room_id'],
      userChattingWith: user,
    );
  }

  String toJson() => json.encode(toMap());

  factory ConversationModel.fromJson(String source) =>
      ConversationModel.fromMap(json.decode(source));
}

final List<String> knownKeys = <String>[
  'last_message',
  'timestamp',
  'members',
  'chat_room_id',
  'conversation_room_id',
  authenticationRepo.getUserUid() ?? '',
];
