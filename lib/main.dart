import 'package:flutter/material.dart';
import 'package:horrorhub/features/Auth/login_page.dart';
import 'package:horrorhub/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MaterialApp(home: LoginScreen()));
}
