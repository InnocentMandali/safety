
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'dart:developer' as developer;

class NotificationService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final GlobalKey<NavigatorState> navigatorKey;

  NotificationService({required this.navigatorKey});

  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission();
    final fcmToken = await _firebaseMessaging.getToken();
    developer.log('FCM Token: $fcmToken', name: 'notification.service');
    // TODO: Save the token to Firestore for the current user

    FirebaseMessaging.onMessage.listen(_handleMessage);
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }

  void _handleMessage(RemoteMessage message) {
    developer.log('Got a message whilst in the foreground!', name: 'notification.service');
    developer.log('Message data: ${message.data}', name: 'notification.service');

    if (message.data.containsKey('latitude') && message.data.containsKey('longitude')) {
      final latitude = double.parse(message.data['latitude']);
      final longitude = double.parse(message.data['longitude']);

      navigatorKey.currentContext?.go('/sos_location/$latitude/$longitude');
    }

    if (message.notification != null) {
      developer.log('Message also contained a notification: ${message.notification}', name: 'notification.service');
    }
  }

  Future<String?> getFcmToken() async {
    return await _firebaseMessaging.getToken();
  }
}

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  developer.log("Handling a background message: ${message.messageId}", name: 'notification.service');
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  // await Firebase.initializeApp();

  developer.log('Message data: ${message.data}', name: 'notification.service');
}
