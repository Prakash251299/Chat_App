import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../modal/chatUser.dart';
import '../controller/login.dart';
import '../main.dart';
import 'chatUserCard.dart';
import '../controller/apis.dart';
import 'dart:convert';

class MyHomeScreenPage extends StatefulWidget {
  const MyHomeScreenPage({super.key, required this.title});
  final String title;
  @override
  State<MyHomeScreenPage> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreenPage> {
  int _counter = 0;
  @override

  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    List<ChatUser> list = [];
    final listAbout = [];
    return Scaffold(
      appBar: AppBar(
        // leading: SizedBox(),
        // leading: null,
        leading: Icon(Icons.home),
        actions:[
          IconButton(onPressed: (){},icon:Icon(Icons.search)),
          IconButton(onPressed: (){},icon:Icon(Icons.more_vert)),
        ],
        title: Text(widget.title),
      ),
      // body: ChatUserCard(),
      // /*
      body: 
      StreamBuilder(
        stream: FirebaseFirestore.instance.collection('users').snapshots(),
        builder: (context, AsyncSnapshot snapshot){
          switch(snapshot.connectionState){
            case ConnectionState.waiting:
            case ConnectionState.none:
              return const Center(child:CircularProgressIndicator());
            case ConnectionState.active:
            case ConnectionState.done:
              // final data = snapshot.data?.docs;
              final data = snapshot.data?.docs;
              
              List l = data?.map((e)=>ChatUser.fromJson(e.data())).toList()??[];
              list = l.cast<ChatUser>();
              // var k;


              // for(int i=0;i<list.length;i++){
              //   if(list[i].email==APIs.user.email){ // For removing the current user
              //     list.removeAt(i);
              //     break;
              //   }
              // }


              if(list.isNotEmpty){
                return
                ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: list.length,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context,index){
                    return ChatUserCard(user:list[index]);
                    // return Container(child: Text("hgjh"),);
                  }
                );
              }else{
                return Center(child: Text("No Friends found",style: TextStyle(fontSize: 20)),);
              }

          }
        }
      ), 
      // */


      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        tooltip: 'Contacts',
        child: const Icon(Icons.add_comment_rounded),
      ),
    );
  }
}
