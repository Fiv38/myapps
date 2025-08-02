import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'firebase_options.dart';
import 'di/injection_container.dart' as di;
import 'app.dart';

/// Background handler for Firebase Messaging
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  print('🔔 [BG] Message: ${message.messageId}');
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _initServices();
  runApp(const App());

  // Deferred post-run initialization
  WidgetsBinding.instance.addPostFrameCallback((_) {
    _postAppStartTasks();
  });
}

Future<void> _initServices() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await di.initializeDependencies();

  // Lock orientation to portrait only
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // Hide system UI (fullscreen)
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  // Setup background message handler
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
}

Future<void> _postAppStartTasks() async {
  // Request permissions sequentially to avoid race condition
  final notificationStatus = await Permission.notification.request();
  final storageStatus = await Permission.storage.request();

  final token = await FirebaseMessaging.instance.getToken();

  if (token != null) {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('fcmToken', token);
  }
}

