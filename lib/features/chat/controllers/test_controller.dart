import 'dart:developer';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TestController extends GetxController {
  late final ScrollController scrollController = ScrollController();
  static const int limit = 10;
  static final DatabaseReference chatCollectionRef =
      FirebaseDatabase.instance.reference().child('users');
  final RxList<Map> users = <Map>[].obs;
  final List<List<Map>> _allPagesList = <List<Map>>[];
  Map<String, dynamic>? _lastDocument;
  bool _hasMore = true;

  void init() {
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent) {
        log('end');
        getConversations();
      }
    });
  }

  void getConversations() {
    if (!_hasMore) return;

    Query userQuery =
        chatCollectionRef.orderByChild('fullName').limitToFirst(limit);

    if (_lastDocument != null) {
      userQuery = userQuery.startAt(_lastDocument!['fullName']);
    }

    final int currentPageIndex = _allPagesList.length;

    userQuery.onValue.listen((Event event) {
      final Map data = (event.snapshot.value ?? {}) as Map;
      final List<Map> _users = List<Map>.from(data.values.toList());
      log(_users.toString());

      if (_users.isNotEmpty) {
        final bool pageExists = currentPageIndex < _allPagesList.length;

        if (pageExists) {
          _allPagesList[currentPageIndex] = _users;
        } else {
          _allPagesList.add(_users);
        }

        final List<Map> _foldedPagesList = _allPagesList.fold(
          <Map>[],
          (previousValue, element) => previousValue..addAll(element),
        );

        users.value = _foldedPagesList;

        if (currentPageIndex == _allPagesList.length - 1) {
          _lastDocument = _users.last.cast<String, dynamic>();
        }

        _hasMore = _users.length == limit;
      }
    });
  }

  @override
  void onInit() {
    // getConversations();
    // init();
    super.onInit();
  }
}
