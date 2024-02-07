import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
class ChatService{
  //get instance of firestore
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //get user stream
Stream<List<Map<String,dynamic>>> getUsersStream() {
  return _firestore.collection("Users").snapshots().map((snapshot) {
    return snapshot.docs.map((doc) {
      final user = doc.data();

      return user;
    }).toList();
  });
  }
  //send messages

  //get messages
Widget _buildUserList(){
  return StreamBuilder(
    stream: _chatService.getUsersStream(),
    builder: (context, snapshot){
      if(snapshot.hasError){
        return const Text("Error");
      }
      if(snapshot.connectionState == ConnectionState.waiting){
        return const Text("loading...");

        return ListView(
          children: snapshot.data!.map<Widget>((userData)=>_buildUserListItem),
        );
      }
    }
  )
}
}