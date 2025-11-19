
import 'package:flutter/material.dart';
import 'package:emergen_sync/src/features/notifications/services/notification_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class NotificationProvider with ChangeNotifier {
  late final NotificationService _notificationService;
  String? _fcmToken;

  NotificationProvider({required GlobalKey<NavigatorState> navigatorKey}) {
    _notificationService = NotificationService(navigatorKey: navigatorKey);
  }

  String? get fcmToken => _fcmToken;

  Future<void> initialize() async {
    await _notificationService.initNotifications();
    _fcmToken = await _notificationService.getFcmToken();
    _saveTokenToDatabase();
    notifyListeners();
  }

  void _saveTokenToDatabase() {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null && _fcmToken != null) {
      FirebaseFirestore.instance.collection('users').doc(user.uid).update({
        'fcmToken': _fcmToken,
      });
    }
  }
}
