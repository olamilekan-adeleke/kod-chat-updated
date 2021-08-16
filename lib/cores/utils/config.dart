import 'package:get_storage/get_storage.dart' as storage;
import 'package:kod_chat/cores/utils/locator.dart';
import 'firebase_messaging_utils.dart';

class Config {
  /// init local database using get storage.
  static Future<void> setUpHiveLocalDB() async {
    await storage.GetStorage.init('box');
    await NotificationMethods.initNotification();
  }

  //init all bindings for get x
  static void setUpBindings() {
    setUpLocator();
  }
}
