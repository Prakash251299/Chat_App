// import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'dart:convert';
// import 'dart:developer';

// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:prac/view/messageCard.dart';
// import 'package:wechat/messageCard.dart';
import '../controller/apis.dart';
import '../modal/chatUser.dart';
// import 'chatUserCard.dart';
import '../modal/message.dart';

// import 'dart:developer';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// // import 'chatUser.dart';
// import 'login_screen.dart';
// import './main.dart';
// // import 'chatUserCard.dart';
// import 'apis.dart';
// import 'dart:convert';




class ChatScreen extends StatefulWidget {
  final ChatUser user;
  const ChatScreen({super.key,required this.user});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController _textController = TextEditingController();
  List<Message> list = [];
  @override
  Widget build(BuildContext context) {
  // final data;
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Colors.white,
        // appBar: AppBar(
        //   title: Text(widget.title),
        // ),
        
        appBar:AppBar(
          // title: ,
          automaticallyImplyLeading: false,
          flexibleSpace: _appBar(),
        ),
        body:
        Column(children: [
          // Expanded(
          //   child: StreamBuilder(
          //           stream: FirebaseFirestore.instance.collection('messages').snapshots(),
          //           builder: (context, AsyncSnapshot snapshot){
          //             final data;
          //             data = snapshot.data?.docs;
          //             // data = snapshot.data;
          //             List l = data?.map((e)=>Message.fromJson(e.data())).toList()??[];
          //             list = l.cast<Message>();
      
          //             // print(list);
          //             // return Container();
          //             // return Text("Data: ${data![0].data()}");
          //           }),
          // ),
      
      
      
          Expanded(
            child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('chats').snapshots(),
      
          // builder: (BuildContext context, AsyncSnapshot<QuerySnapshot>snapshot){
          builder: (context, AsyncSnapshot snapshot){
            // print(APIs.firestore.doc('ab').get());
            // print(snapshot);
            // if(snapshot.hasData){
            //   print("pres");
            // }else{
            //   print("No data found");
            // }
            // return Text("haskjd");
      
      
      
            switch(snapshot.connectionState){
              case ConnectionState.waiting:
              case ConnectionState.none:
                return const SizedBox();
                // return const Center(
                //   child:CircularProgressIndicator());
              case ConnectionState.active:
              case ConnectionState.done:
                // var data = snapshot.data;
                var data = snapshot.data?.docs;
                
                // print(jsonEncode(data?[0].data()));
                // print(jsonEncode(data?[0]));
                // print(jsonEncode(data?[0]));
                // print(snapshot.data?.docs?[0].data());
      
      
      
               
                // var v = data?[0].data();
      
                // List l = data?.map((e)=>ChatUser.fromJson(e.data())).toList()??[];
                // list = l.cast<ChatUser>();
      
                // var list = ["haskd","sahd"];
      
      
                List list;
                // int found=0;
      
      
                list = data?.map((e)=>Message.fromJson(e.data())).toList()??[];
      
      
                // list.add(Message(told: 'xyz', read: '', sent: '12:00 AM', msg: 'Hii', fromid: "${widget.user.name}"));
                // list.add(Message(told:"${widget.user.name}", read: '12:05 AM', sent: '', msg: 'Hello', fromid: "pqr"));
      
      
      
                // list.add(Message(told: APIs.user.uid, read: '', sent: '12:05 AM', msg: 'Hello', fromid: APIs.user.uid));
                // if(APIs.user.uid==null){
                //   print("Null");
                // }else
                // print(APIs.user.uid);
                // static User get user => auth.currentUser!;
                // print(FirebaseAuth.instance.currentUser);
                // print(widget.user);
      
                if(list.isNotEmpty){
                  return
                  ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: list.length,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context,index){
                      // return Text("Message: ${list[index]}");
      
      
                      // if(APIs.user==null){
                      //   print("Not Null");
      
                      // }else{
                      //   print("Null");
                      // }
      
      
      //                     print(APIs.user.email);
                      // return Container();
                      // print(list[index].fromid);
                      // if(list[index].fromid==widget.user.email||list[index].toId==widget.user.email){
                        return MessageCard(message: list[index],user:widget.user);
                      // }else{
                      //   return Center(child: Text("Say, Hello!",style: TextStyle(fontSize: 20)),);
                      // }
      
                      // return ChatUserCard(user:list[index]);
                      // return ChatUserCard();
                    }
                  );
                }else{
                  // print(widget.user.name);
                  return Center(child: Text("Say, Hello!",style: TextStyle(fontSize: 20)),);
                }
            }
          }
        ),
          ),
      
          _chatInp(),
        ],)
      ),
    );
  }

  
  Widget _appBar(){
    return Row(children: [
      IconButton(
        onPressed: (){
          Navigator.pop(context);
        }, 
        icon: Icon(Icons.arrow_back,color: Colors.black54,),
      ),

      ClipRRect(
                borderRadius: BorderRadius.circular(50.0),
                child: Image.network('${widget.user.image}',
                height: 40.0,
                width: 40.0,)
              ),
      Container(
        padding: EdgeInsets.only(left: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text(widget.user.name,style: TextStyle(fontSize:16,fontWeight: FontWeight.w500),),
          // Text("Last seen",style: TextStyle(fontSize:13,fontWeight: FontWeight.w100),),
        ],),
      ),
      
    ],);
  }
  Widget _chatInp(){
    return 
    Padding(
      padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*0.01),
      child: 
      // Column(children: [
      Row(
        children: [

          // StreamBuilder(
          //       stream: FirebaseFirestore.instance.collection('messages').snapshots(),
          //       builder: (context, AsyncSnapshot snapshot){
          //         return Text("hi");
          //       }),

          Expanded(
            child: Card(
              shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(15)),
              child: Row(children: [
                IconButton(onPressed: (){},
                  icon: Icon(Icons.emoji_emotions,color:Colors.blueAccent),
                ),
          
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.multiline,
                    controller: _textController,
                    maxLines: null,
                    decoration: InputDecoration(
                      hintText: "Input...",
                      hintStyle: TextStyle(color:Colors.blueAccent),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                // IconButton(onPressed: (){}, 
                //   icon: Icon(Icons.image,color:Colors.blueAccent),
                // ),
                // IconButton(onPressed: (){}, 
                //   icon: Icon(Icons.camera_alt_rounded, color:Colors.blueAccent),
                // ),


                MaterialButton(
                  onPressed: (){
                    if(_textController.text.isNotEmpty){
                      APIs.sendMess(widget.user,_textController.text);
                      _textController.text = '';
                    }
                  },
                  padding:EdgeInsets.only(top:10,left:10,right:5,bottom:10),
                  shape:const CircleBorder(),
                  color:Colors.green,
                  child:Icon(Icons.send,color:Colors.white,size:15),
                )
              ],),
            ),
          ),
        ],
      ),
    );
  }
}