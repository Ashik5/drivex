import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test_app/ChatPage.dart';

class Inbox extends StatelessWidget {
  const Inbox({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 251, 255, 1),
      appBar: AppBar(
        title: const Text("Inbox"),
        centerTitle: true,
      ),
      body: const inboxCollection(),
    );
  }
}

// ignore: camel_case_types
class inboxCollection extends StatelessWidget {
  const inboxCollection({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: FirebaseFirestore.instance
          .collection('Users')
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .collection('inbox')
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        List<String> items = snapshot.data!.docs.map((doc) => doc.id).toList();
        if (items.isEmpty) {
          return const Center(
            child: Text('No items found in the collection.'),
          );
        } else {
          return ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            children: [
              for (String receiver in items)
                Column(
                  children: [
                    InboxCard(receiverId: receiver),
                    const SizedBox(
                      height: 15,
                    ),
                  ],
                ),
            ],
          );
        }
      },
    );
  }
}

// ignore: must_be_immutable
class InboxCard extends StatelessWidget {
  String receiverId;
  InboxCard({super.key, required this.receiverId});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestore.instance
              .collection("Users")
              .doc(receiverId)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data!.data() != null) {
              final userData = snapshot.data!.data() as Map<String, dynamic>;
              List<String> ids = userData['userType'] != "user"
                  ? [FirebaseAuth.instance.currentUser!.uid, receiverId]
                  : [receiverId, FirebaseAuth.instance.currentUser!.uid];
              String chatRoomId = ids.join("");
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChatPage(
                          receiverUserId: receiverId,
                          receiverName: userData['name']),
                    ),
                  );
                },
                child: Row(
                  children: [
                    Image.asset('assets/icons/avatar.png'),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          userData['name'],
                          style: const TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 16,
                          ),
                        ),
                        StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                          stream: FirebaseFirestore.instance
                              .collection("chatRoom")
                              .doc(chatRoomId)
                              .collection('messages')
                              .orderBy('timestamp', descending: true)
                              .limit(1)
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              final documents = snapshot.data!.docs;
                              if (documents.isNotEmpty) {
                                final msgData = documents[0].data();
                                return Text(msgData['message']);
                              } else {
                                return const Text("No messages available");
                              }
                            } else if (snapshot.hasError) {
                              return Center(
                                child: Text("Error: ${snapshot.error}"),
                              );
                            } else {
                              return const Center(
                                  child: CircularProgressIndicator());
                            }
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text("Error${snapshot.error}"),
              );
            } else
              // ignore: curly_braces_in_flow_control_structures
              return const Center(child: CircularProgressIndicator());
          }),
    );
  }
}
