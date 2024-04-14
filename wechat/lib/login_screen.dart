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
    _signInWithGoogle().then((user) async {
      if(await APIs.userExists()){
        Navigator.push(context,MaterialPageRoute(builder:(_)=>MyHomeScreenPage(title: "FLutter chat app",)));
      }else{
        APIs.createUser().then((value) => {
          Navigator.push(context,MaterialPageRoute(builder:(_)=>MyHomeScreenPage(title: "FLutter chat app",))),
        });
      }
    });
  }

  Future<UserCredential?> _signInWithGoogle() async {
    try{
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
    }catch(e){
      print("Something went wrong");
      return null;
    }
}

  // Future<int>fetchAllowance(){
  //   Stream<QuerySnapshot> stream = FirebaseFirestore.instance.collection('allowance').snapshots();
  //   stream.forEach((QuerySnapshot element){
  //
  //     print(element.docs[0]['allowed']);
  //   });
  // }

  // final String title;
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
          // left:mq.width*.25,
          right:_isAnimate?mq.width*0.25:mq.width*0.5,
          width:mq.width*0.5,
          height:mq.height*0.5,
          duration:Duration(seconds:1),
          child:Image.asset("images/chatIcon.png"),
        ),
        // Stack(
        //     alignment:Alignment.bottomLeft,
        //     children:[ ////////////////
        Positioned(
          bottom: mq.height*.15,
          left:mq.width*.25,
          width:mq.width*0.5,
          height:mq.height*0.05,


          child:
          // Text("sd"),
          ElevatedButton(
            onPressed: (){

              // var a = await fetchAllowance();
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
            child: Column(
                // alignment:Alignment.topLeft,
              mainAxisAlignment:MainAxisAlignment.center,
                children:[
                  Stack(
                      alignment:Alignment.topLeft,
                      children:[
                        Image(
                          image:AssetImage('images/googleIcon.png'),
                          height: mq.width*0.08,
                          // height: 10,
                        ),
                        Row(
                    mainAxisAlignment:MainAxisAlignment.center,
                            // crossAxisAlignment:CrossAxisAlignment.center,
                    //       main
                            children:[

                        Text("Sign in with google"),
                              // Text("sad"),
                        ]),
                        // icon:Image.asset("images/googleIcon.png"),
                  //     ]
                  // ),
                  // Stack(
                  //     alignment:Alignment.topLeft,
                  //     children:[
                  //       Row
                      ]
                  )
              // Image.asset("images/googleIcon.png"),
              // Column(
              //     mainAxisAlignment:MainAxisAlignment.center,
              //   // alignment:Alignment.bottomRight,
              //     children:[
              //   Text("Sign in with google"),
              // ]),

            ]),
            // Text("dfs"),
          ),





          // ElevatedButton.icon(
          //   style: ElevatedButton.styleFrom(
          //     backgroundColor: Colors.blue,
          //     // shape: StadiumBorder(),
          //     elevation: 1,
          //   ),
          //   onPressed: (){
          //     // print(Platform.operatingSystem);
          //     // print('OS: ${defaultTargetPlatform}');
          //       // _handleGoogleBtnClick();
          //     if(defaultTargetPlatform==TargetPlatform.android){
          //       _handleGoogleBtnClick();
          //     }else{
          //       if(defaultTargetPlatform==TargetPlatform.iOS){
          //         _handleGoogleBtnClick();
          //       }else{
          //         Navigator.pushReplacement(context,MaterialPageRoute(builder:(context)=>MyHomeScreenPage(title: "FLutter chat app",)));
          //       }
          //     }
          //
          //
          //     // Navigator.push(context,MaterialPageRoute(builder:(context)=>MyHomePage(title: "FLutter chat app",)));
          //   },
          //   // icon:Image.asset("images/chatIcon.png"),
          //   label:RichText(text: TextSpan(
          //     style: TextStyle(fontSize: 15),
          //     children:[
          //       TextSpan(text: 'Sign in with '),
          //       TextSpan(text: 'Google',style:TextStyle(fontWeight:FontWeight.w500)),
          //   ])),
          //   icon: Image.asset("images/googleIcon.png"),
          // ),



        ),
         // ])   // Stack(children:[Text("hi")]),
      ]),
    );
  }
}