
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NotificationService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final GlobalKey<NavigatorState> navigatorKey;

  NotificationService({required this.navigatorKey});

  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission();
    final fcmToken = await _firebaseMessaging.getToken();
    print('FCM Token: $fcmToken');
    // TODO: Save the token to Firestore for the current user

    FirebaseMessaging.onMessage.listen(_handleMessage);
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }

  void _handleMessage(RemoteMessage message) {
    print('Got a message whilst in the foreground!');
    print('Message data: ${message.data}');

    if (message.data.containsKey('latitude') && message.data.containsKey('longitude')) {
      final latitude = double.parse(message.data['latitude']);
      final longitude = double.parse(message.data['longitude']);

      navigatorKey.currentContext?.go('/sos_location/$latitude/$longitude');
    }

    if (message.notification != null) {
      print('Message also contained a notification: ${message.notification}');
    }
  }

  Future<String?> getFcmToken() async {
    return await _firebaseMessaging.getToken();
  }
}

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("Handling a background message: ${message.messageId}");
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  // await Firebase.initializeApp();

  print('Message data: ${message.data}');
}
