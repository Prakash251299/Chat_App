import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'login_screen.dart';
import 'home_screen.dart';
void main()async{
  // _initializeFirebase();
  
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    // options: DefaultFirebaseOptions.currentPlatform,
    options:FirebaseOptions(
      apiKey: "AIzaSyB0ZPOF0JlVv2jjpxGY36MrLRmTOK4KiHY",
      // authDomain: "wechat-e9ad3.firebaseapp.com",
      projectId: "wechat-e9ad3",
      // storageBucket: "wechat-e9ad3.appspot.com",
      messagingSenderId: "196805083197",
      appId: "1:196805083197:web:896f823a9a775eeae2ea54"
    ),
  );
  runApp(const MyApp());
}

// _initializeFirebase()async{
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform
//   );
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const LoginPage(title: 'Welcome to the login page'),
      home: const MyHomeScreenPage(title: "FLutter chat app",),
    );
  }
}