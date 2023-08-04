import 'dart:developer';
// import 'dart:html';
// import 'dart:io' show Platform;
import 'package:flutter/foundation.dart';
// import '../api/apis.dart';
// import 'package:universal_io/io.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import './main.dart';
import 'home_screen.dart';
import 'apis.dart';
// import './api/apis.dart';
// class LoginPage extends StatelessWidget {
//   const LoginPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const screen(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.title});

  final String title;

  @override
  State<LoginPage> createState() => ScreenState();
}

class ScreenState extends State<LoginPage> {
  // const ScreenState({required this.title});
  bool _isAnimate=false;
  @override
  initState(){
    super.initState();
      Future.delayed(Duration(seconds:1),(){
        setState(()=>{
          _isAnimate = true,
        });
    });
    // _handleGoogleBtnClick();
  }


  _handleGoogleBtnClick(){
    _signInWithGoogle().then((user){
      // log('User:${user.user}');
      // print("hi");
      Navigator.push(context,MaterialPageRoute(builder:(_)=>MyHomeScreenPage(title: "FLutter chat app",)));
    });
  }

  Future<UserCredential> _signInWithGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  // Once signed in, return the UserCredential
  return await APIs.auth.signInWithCredential(credential);
}

  // final String title;
  @override
  Widget build(BuildContext context){
    var mq = MediaQuery.of(context).size;
    return Scaffold(
       appBar: AppBar(
        title: Text(widget.title),
      ),
      body:Stack(children: [
        AnimatedPositioned(
          top: mq.height*.15,
          // left:mq.width*.25,
          right:_isAnimate?mq.width*0.25:mq.width*0.5,
          width:mq.width*0.5,
          height:mq.height*0.5,
          duration:Duration(seconds:1),
          child:Image.asset("images/chatIcon.png"),
        ),
        Positioned(
          bottom: mq.height*.15,
          left:mq.width*.25,
          width:mq.width*0.5,
          height:mq.height*0.05,
          child:ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 223, 255, 187),
              shape: StadiumBorder(),
              elevation: 1,
            ),
            onPressed: (){
              // print(Platform.operatingSystem);
              // print('OS: ${defaultTargetPlatform}');
                // _handleGoogleBtnClick();
              if(defaultTargetPlatform==TargetPlatform.android){
                _handleGoogleBtnClick();
              }else{
                if(defaultTargetPlatform==TargetPlatform.iOS){
                  _handleGoogleBtnClick();
                }else{
                  Navigator.pushReplacement(context,MaterialPageRoute(builder:(context)=>MyHomeScreenPage(title: "FLutter chat app",)));
                }
              }


              // Navigator.push(context,MaterialPageRoute(builder:(context)=>MyHomePage(title: "FLutter chat app",)));
            },
            // icon:Image.asset("images/chatIcon.png"),
            label:RichText(text: TextSpan(
              style: TextStyle(fontSize: 15),
              children:[
                TextSpan(text: 'Sign in with '),
                TextSpan(text: 'Google',style:TextStyle(fontWeight:FontWeight.w500)),
            ])),
            icon:Image.asset("images/googleIcon.png"),
            // child:,
          ),
        ),
      ]),
    );
  }
}