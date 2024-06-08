import "package:firebase_messaging/firebase_messaging.dart";

Future<void> handleBackgroundMessage(RemoteMessage message) async {
  // print(message);
}

class Notifications {
  static final FirebaseMessaging _firebaseMessaging =
      FirebaseMessaging.instance;

  static Future<void> init() async {
    await _firebaseMessaging.requestPermission();
    _firebaseMessaging.getToken().then((String? token) {
      // print('Token: $token');
      FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
    });
  }
}
