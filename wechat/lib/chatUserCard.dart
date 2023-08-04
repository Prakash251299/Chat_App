import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'chatUser.dart';
import 'home_screen.dart';
import 'ChatScreen.dart';

class ChatUserCard extends StatefulWidget {



  ChatUser user;
  ChatUserCard({super.key,required this.user});



  // final l = [];
  @override
  State<ChatUserCard> createState() => _ChatUserCardState();
}

class _ChatUserCardState extends State<ChatUserCard> {
  // const _ChatUserCardState({super.key});
  // _ChatUserCardState(a,i,b) : this.lname = a ?? [],this.j = i,this.labout = b;
  // var lname = [];
  // var labout = [];
  // int j;
  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    // var user;
    return
    //  ListView.builder(
    //   scrollDirection: Axis.vertical,
    //   itemCount: 10,
    //   itemBuilder: (context,index)=>
        Card(
          margin: EdgeInsets.symmetric(horizontal:mq.width*0.04,vertical:mq.height*0.01),
          shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(15)),
          child:InkWell(
            borderRadius: BorderRadius.circular(15),
            onTap:(){
              Navigator.push(context,MaterialPageRoute(builder: ((context) => ChatScreen(user:widget.user))));


              // print(widget.user.name);
            },
            child: ListTile(
              leading: const CircleAvatar(child:Icon(Icons.person)),
              // title: Text('${lname[j]}'),

              title: Text(widget.user.name),
              subtitle: Text(widget.user.about),
              
              // title: Text("asldkjfh"),
              // subtitle: Text("Doing well"),
              trailing:Text('12:00PM'),
            ),
          ),
        // ),
      );
  }
}