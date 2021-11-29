import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'cores/utils/config.dart';

import 'kod_chat_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Config.setUpHiveLocalDB();
  Config.setUpBindings();
  // await Config.fakerSetup();
  runApp(KodChatApp());
}
