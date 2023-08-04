import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'login_screen.dart';
import 'home_screen.dart';
// import { doc, getDoc } from "firebase/firestore";

void main() async {
  // _initializeFirebase();

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    // options: DefaultFirebaseOptions.currentPlatform,
    options: FirebaseOptions(
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
  // final a;
  // fun()async{
  //   var a=2;
  //   Stream<QuerySnapshot> stream = FirebaseFirestore.instance.collection('allowance').snapshots();
  //   stream.forEach((QuerySnapshot element)async{
  //     // print(element.docs[0]['allowed']);
  //     a = await element.docs[0]['allowed'];
  //   });
  //   return a;
  // }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // var a;
    //
    // Stream<QuerySnapshot> stream = FirebaseFirestore.instance.collection('allowance').snapshots();
    // stream.forEach((QuerySnapshot element)async{
    //   // print(element.docs[0]['allowed']);
    //   a = await element.docs[0]['allowed'];
    // });
    // a = await fun();
    // print(a);
    // final messages = FirebaseFirestore.instance.collection('allowance').snapshots();

    // var b = await fetchAllowance();
    // print(b);


    // return
      // Expanded(
      //     child:
      // StreamBuilder(
      //   /* This is only for blocking the application from use */
      //     stream: FirebaseFirestore.instance.collection('allowance').snapshots(),
      //     // builder: (BuildContext context, AsyncSnapshot<QuerySnapshot>snapshot){
      //     builder: (BuildContext context,
      //         AsyncSnapshot<QuerySnapshot>snapshot) {
      //       // if (snapshot.hasData) {
      //       final messages;
      //       messages = snapshot.data!.docs;
      //       // print(messages[0]['allowed']);
      //       if (messages[0]['allowed'] == 1) {
      //         return MaterialApp(
      //           title: 'Flutter Demo',
      //           theme: ThemeData(
      //             primarySwatch: Colors.blue,
      //           ),
      //           home: const LoginPage(title: 'Welcome to the login page'),
      //           //       home: Container(child: Text("gjg"),),
      //           //       home: const MyHomeScreenPage(title: "FLutter chat app",),
      //         );
      //       }else

        // if(a==1)
            return
              MaterialApp(
                home: Scaffold(
                  backgroundColor:Colors.black,
                  body:
                  // Column(children:[
                  //   if(a==1)...{
                      LoginPage(title: 'Welcome to the login page'),
                    // }
                  // ]),
                  // body: Center(
                  //   child: Text(
                  //       "Either you are not allowed to use this app or Internet connection is not available", style:TextStyle(color:Colors.white)),
                  // ),
                ),
                //       home: Container(child: Text("gjg"),),
                //       home: const MyHomeScreenPage(title: "FLutter chat app",),
              );
        // else
        //   return
        //     MaterialApp(
        //       home:
        //       Container(child:Text("dshfkj")),
        //     );
      //     }
      // ),
      // );
  }
}