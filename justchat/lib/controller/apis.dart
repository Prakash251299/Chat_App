import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:prac/modal/message.dart';
// import 'package:wechat/message.dart';
import '../modal/chatUser.dart';
import 'login.dart';
import '../view/messageCard.dart';
class APIs{
  static FirebaseAuth auth = FirebaseAuth.instance;
  static User get user => auth.currentUser!;
  // static FirebaseFirestore firestore = FirebaseFirestore.instance;
  static CollectionReference firestore = FirebaseFirestore.instance.collection('users');
  // static Stream<QuerySnapshot<Map<String,dynamic>>> getAllUsers(){
  //   return firestore.collection('messeges').snapshots();
  // }

  static Future<bool> userExists()async{
    return (await FirebaseFirestore.instance.collection('users').doc(user.uid).get()).exists;
  }


  static Future<void> createUser() async {
    final time = DateTime.now().millisecondsSinceEpoch.toString();
    final chatUser = ChatUser(about: "Hey there! I am using wechat", name: user.displayName.toString(), email: user.email.toString(),image: user.photoURL.toString());
    return await FirebaseFirestore.instance.collection('users').doc(user.uid).set(chatUser.toJson());
  }


  static Stream<QuerySnapshot<Map<String,dynamic>>> getAllMessages(ChatUser user){
    return FirebaseFirestore.instance.collection('chats').snapshots();
  }

  static Future<void> sendMess(ChatUser chatUser, String mes) async {
    var time = DateTime.now().millisecondsSinceEpoch.toString();
    // var k = DateTime.now().millisecondsSinceEpoch;
    var k = DateTime.fromMillisecondsSinceEpoch(1716708177577);
    print(k);
    // var date = DateTime.fromMicrosecondsSinceEpoch(k);
    // var date = DateTime.fromMillisecondsSinceEpoch(k * 1000);
    // print(date);
    // print(time);
    // final Message message = Message(toId: chatUser.email, read: '', sent: time, msg: mes, fromid: chatUser.email);
    // var k;
    // if(from==chatUser.email){
    //   k = from;
    //   from = chatUser.email;
    //   chatUser.email = k;
    // }
    // final Message message = Message(toId: chatUser.email, read: '', sent: time, msg: mes, fromid: user.email);
    final Message message = Message(toId: chatUser.email, read: '', sent: time, msg: mes, fromid: user.email.toString());
    final ref = FirebaseFirestore.instance.collection('chats');
    await ref.doc(time).set(message.toJson());

  }
}