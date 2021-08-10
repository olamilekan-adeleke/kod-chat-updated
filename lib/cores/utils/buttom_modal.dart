import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButtomModalService {
  static void showModal(Widget child) {
    Get.bottomSheet(
      child,
      isDismissible: false,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      enableDrag: false,
      backgroundColor: Colors.grey,
      
    );
  }
}
