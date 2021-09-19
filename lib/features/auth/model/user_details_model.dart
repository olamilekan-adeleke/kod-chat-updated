import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class UserDetailsModel {
  UserDetailsModel({
    required this.uid,
    required this.email,
    required this.fullName,
    this.bio,
    required this.phoneNumber,
    this.profilePicUrl,
    this.dateJoined,
  });

  factory UserDetailsModel.fromMap(Map<String, dynamic>? map) {
    return UserDetailsModel(
      uid: map!['uid'].toString(),
      email: map['email'] as String,
      fullName: map['full_name'] as String,
      phoneNumber: map['phone_number'] as String,
      bio: map['bio'] == null
          ? 'Hey there am ${map['full_name']}'
          : map['bio'] as String,
      profilePicUrl: map['profile_pic_url'] != null
          ? map['profile_pic_url'] as String
          : null,
      dateJoined:
          map['date_joined'] != null ? map['date_joined'] as Timestamp : null,
    );
  }

  factory UserDetailsModel.fromJson(String source) =>
      UserDetailsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  final String uid;
  final String email;
  final String fullName;
  final String? bio;
  final String phoneNumber;
  final String? profilePicUrl;
  final Timestamp? dateJoined;

  Map<String, dynamic> toMap() {
    final List<String> searchKeys = <String>[];
    String currentKey = '';

    fullName.split('').forEach((element) {
      currentKey += element.toLowerCase();
      searchKeys.add(currentKey);
    });

    currentKey = '';

    fullName.split(' ').toList()[1].split('').forEach((element) {
      currentKey += element.toLowerCase();
      searchKeys.add(currentKey);
    });

    return <String, dynamic>{
      'uid': uid,
      'email': email,
      'full_name': fullName,
      'bio': bio,
      'phone_number': phoneNumber,
      'profile_pic_url': profilePicUrl,
      'date_joined': dateJoined,
      'search_key': searchKeys,
    };
  }

  Map<String, dynamic> toMapForLocalDb() {
    return <String, dynamic>{
      'uid': uid,
      'email': email,
      'full_name': fullName,
      'bio': bio,
      'phone_number': phoneNumber,
      'profile_pic_url': profilePicUrl,
    };
  }

  String toJson() => json.encode(toMap());

  UserDetailsModel copyWith({
    String? uid,
    String? email,
    String? fullName,
    String? phoneNumber,
    String? profilePicUrl,
    Timestamp? dateJoined,
  }) {
    return UserDetailsModel(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      fullName: fullName ?? this.fullName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      profilePicUrl: profilePicUrl ?? this.profilePicUrl,
      dateJoined: dateJoined ?? this.dateJoined,
    );
  }

  @override
  String toString() {
    return 'UserDetailsModel(email: $email, fullName: $fullName, phoneNumber:'
        ' $phoneNumber, profilePicUrl: $profilePicUrl, dateJoined: $dateJoined)';
  }
}
