import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:horrorhub/features/Auth/login_page.dart';
import 'package:horrorhub/features/HomePage/home_page.dart';
import 'package:horrorhub/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:horrorhub/services/Notifications/notifications.dart';

import 'theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Notifications.init();
  FlutterSecureStorage storage = const FlutterSecureStorage();
  String? uid = await storage.read(key: 'uid');
  dotenv.load(fileName: './dot.env');
  runApp(MaterialApp(
    title: 'Horror Hub',
    theme: myTheme,
    home: (uid == null)
        ? const LoginScreen()
        : MyHomePage(
            uid: uid,
          ),
    debugShowCheckedModeBanner: false,
  ));
}
