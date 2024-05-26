import 'dart:developer';
// import 'dart:html';
// import 'dart:io' show Platform;
import 'package:flutter/foundation.dart';
// import '../api/apis.dart';
// import 'package:universal_io/io.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../view/home_screen.dart';
import 'apis.dart';

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
        setState(()=>_isAnimate = true,);
    });
    // _handleGoogleBtnClick();
  }


  _handleGoogleBtnClick(){
  // void handleSignIn() {
      print("hello");
      signInWithGoogle().then((v) async {
        if(await APIs.userExists()){
        // print(v.user);
        print(APIs.auth.currentUser);
        Navigator.push(context,MaterialPageRoute(builder:(_)=>MyHomeScreenPage(title: "FLutter chat app",)));
      }else{
        print("user doesn't exist");
        APIs.createUser().then((value){
          print(APIs.auth.currentUser);
          // print(value);
          return Navigator.push(context,MaterialPageRoute(builder:(_)=>MyHomeScreenPage(title: "FLutter chat app",)));
        });
      }
        // print(v.user);
      });
      
    }

    Future<UserCredential> signInWithGoogle() async {
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
      return await FirebaseAuth.instance.signInWithCredential(credential);
    }

  @override
  Widget build(BuildContext context){
    var mq = MediaQuery.of(context).size;
    return Scaffold(
       appBar: AppBar(
        title: Text(widget.title),
      ),
      body:Stack(
          children: [
        AnimatedPositioned(
          top: mq.height*.15,
          right:_isAnimate?mq.width*0.25:mq.width*0.5,
          width:mq.width*0.5,
          height:mq.height*0.5,
          duration:Duration(seconds:1),
          child:Image.asset("images/chatIcon.png"),
        ),
        
        Positioned(
          bottom: mq.height*.15,
          left:mq.width<310?mq.width<230?0:mq.width*0.1:mq.width*0.1,
          width:mq.width<310?mq.width<230?230:mq.width*0.8:mq.width*0.8,
          height:mq.width<310?mq.height*0.03:mq.height*0.05,


          child:

          ElevatedButton(
            onPressed: (){

                _handleGoogleBtnClick();
              },
            child: Column(
                // alignment:Alignment.topLeft,
              mainAxisAlignment:MainAxisAlignment.center,
                children:[
                        Row(
                          mainAxisAlignment:MainAxisAlignment.center,
                          children: [
                          Image(
                            image:AssetImage('images/googleIcon.png'),
                            // height: mq.width*0.08,
                            height: mq.width<310?mq.height*0.05*0.4:mq.height*0.05*0.6,
                          ),
                          Text("  Sign in with google",style: TextStyle(fontSize: mq.width<310?mq.height*0.05*0.4:mq.height*0.05*0.6),),
                                
                        ],)


            ]),
          ),


        ),



      ]),
    );
  }
}