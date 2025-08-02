import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationService {
  static Future<void> init() async {
    final messaging = FirebaseMessaging.instance;

    // Request permission for push notifications (important for iOS)
    await messaging.requestPermission();

    // Get the token for FCM
    final token = await messaging.getToken();
    print("🔑 FCM Token: $token");

    // Handle foreground messages
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      final notification = message.notification;
      if (notification != null) {
        print('New notification: ${notification.title}, ${notification.body}');
        // You can handle the notification here, e.g., update the UI
      }
    });

    // Handle background messages
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }

  // Background message handler
  static Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
    print('Handling a background message: ${message.messageId}');
    // You can perform background processing here
  }
}
