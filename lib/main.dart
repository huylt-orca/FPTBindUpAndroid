import 'package:android/ForGroundLocalNotification.dart';
import 'package:android/constants.dart';
import 'package:android/screens/bottom_bar.dart';
import 'package:android/screens/project_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'firebase_options.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );


  String token = await getToken();
  print(token);

  print('start');
  runApp(const MyApp());
}

Future getToken() async{
  FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  String? token = await firebaseMessaging.getToken();
  return token;
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LocalNotification.initialize();
    // For Forground state;
    FirebaseMessaging.onMessage.listen((event) {
      LocalNotification.showNotification(event);
    });
    return MaterialApp(
      title: 'Bind Up',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: mCustomMainColor,
      ),
      home: const BottomBar(),
      // home: const ProjectDetailScreen()
    );
  }
}

