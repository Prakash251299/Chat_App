import 'dart:convert';

import 'package:flutter/material.dart';
import 'apis.dart';
import 'chatUser.dart';
import 'message.dart';
// import 'chatuserCard.dart';

class MessageCard extends StatefulWidget {
  final Message message;
  final ChatUser user;
  // final String message;
  // const MessageCard({super.key,required this.message});
  const MessageCard({super.key,required this.message,required this.user,});
  @override
  State<MessageCard> createState() => _MessageCardState();
}
// var from = 'prakashpratapsingh2512@gmail.com';
// var from = 'prakashpratapsingh6@gmail.com';
class _MessageCardState extends State<MessageCard> {
  @override
  Widget build(BuildContext context) {
    // print(jsonEncode(widget.message));
    // print(widget.message);
    // print(message.toJson);

//     if(APIs.auth.currentUser!=null){
//       print(APIs.auth.currentUser);
//     }else{
//       print("null");
//     }
//     return Container();
    return APIs.user.email== widget.message.fromid && widget.user.email==widget.message.toId?greenMess():APIs.user.email== widget.message.toId && widget.user.email==widget.message.fromid?blueMess():Container();
    // return widget.message.toId!=widget.user.email && widget.message.fromid==from?greenMess():widget.message.toId!=from && widget.message.fromid==widget.user.email?blueMess():Text("");
    // return widget.message.toId==widget.user.email && widget.message.fromid==from?greenMess():widget.message.fromid==widget.user.email?blueMess():Text("");


    // return widget.user.email!="prakashpratapsingh2512@gmail.com"?greenMess():blueMess();
    // return widget.message.fromid=="prakashpratapsingh2512@gmail.com" && widget.message.toId==widget.user.email?greenMess():widget.message.toId=="prakashpratapsingh2512@gmail.com" && widget.message.fromid==widget.user.email?blueMess():Text("");

    // return blueMess();
    // return greenMess();
  }

  Widget greenMess(){
    var mq = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment:MainAxisAlignment.spaceBetween,
      children:[
        Row(children:[
          SizedBox(width:mq.width*.04),
          Icon(Icons.done_all_rounded, color: Colors.blue, size: 20),
          Text(widget.message.read,style:TextStyle(fontSize:13,color:Colors.black54),),
        ]),
      Flexible(
        child: Container(
          padding:EdgeInsets.all(mq.width*.04),
          margin:EdgeInsets.symmetric(horizontal: mq.width*.04,vertical: mq.height*0.01),
          decoration:BoxDecoration(
            color: Color.fromARGB(255, 221, 245, 255),
            border: Border.all(color:Colors.lightBlue),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
              bottomRight: Radius.circular(30),
            )
            // borderRadius: BorderRadius.only(
            //   topRight: Radius.circular(30),
            //   topLeft: Radius.circular(30),
            //   bottomLeft: Radius.circular(30),
            // )
          ),
          child: Text(widget.message.msg,style:TextStyle(fontSize: 15,color:Colors.black87)),
        ),
      ),
      // Text(widget.message.sent,style: TextStyle(fontSize: 13,color:Colors.black54),),
    ]);
  }
  Widget blueMess(){
    var mq = MediaQuery.of(context).size;
    return Row(children:[
      Flexible(
        child: Container(
          padding:EdgeInsets.all(mq.width*.04),
          margin:EdgeInsets.symmetric(horizontal: mq.width*.04,vertical: mq.height*0.01),
          decoration:BoxDecoration(
            color: Color.fromARGB(255, 221, 245, 255),
            border: Border.all(color:Colors.lightBlue),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30),
              topLeft: Radius.circular(30),
              bottomLeft: Radius.circular(30),
            )
          ),
          child: Text(widget.message.msg,style:TextStyle(fontSize: 15,color:Colors.black87)),
        ),
      ),
      Padding(
        padding: EdgeInsets.only(right:mq.width*.04),
        child: Text(widget.message.sent,style: TextStyle(fontSize: 13,color:Colors.black54),),
      ),
    ]);
  }
}