import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'login_screen.dart';
class APIs{
  static FirebaseAuth auth = FirebaseAuth.instance;
  static User get user => auth.currentUser!;
  // static FirebaseFirestore firestore = FirebaseFirestore.instance;
  static CollectionReference firestore = FirebaseFirestore.instance.collection('users');
  // static Stream<QuerySnapshot<Map<String,dynamic>>> getAllUsers(){
  //   return firestore.collection('messeges').snapshots();
  // }
}