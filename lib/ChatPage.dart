import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'chatBubbles.dart';
import 'chatService.dart';

class ChatPage extends StatefulWidget {
  final String receiverUserId;
  final String receiverName;

  const ChatPage({
    Key? key,
    required this.receiverUserId,
    required this.receiverName,
  }) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _messageController = TextEditingController();
  final ChatService _chatService = ChatService();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void sendMessage(String userType) async {
    if (_messageController.text.isNotEmpty) {
      await _chatService.sendMessage(
        widget.receiverUserId,
        _messageController.text,
        userType,
      );
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 251, 255, 1),
      appBar: AppBar(
        title: Text(widget.receiverName),
        centerTitle: true,
      ),
      body: StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestore.instance
              .collection("Users")
              .doc(FirebaseAuth.instance.currentUser?.uid)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data!.data() != null) {
              final userData = snapshot.data!.data() as Map<String, dynamic>;
              return Column(
                children: [
                  Expanded(
                    child: _buildMessageList(userData['userType']),
                  ),
                  _buildMessageInput(userData['userType']),
                ],
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

  Widget _buildMessageList(String userType) {
    return StreamBuilder(
      stream: _chatService.getMessage(
          _firebaseAuth.currentUser!.uid, widget.receiverUserId, userType),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Error ${snapshot.error}');
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text('Loading......');
        }
        return ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          children: snapshot.data!.docs
              .map((document) => _buildMessageItem(document))
              .toList(),
        );
      },
    );
  }

  Widget _buildMessageItem(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;
    var alignment = (data['senderId'] == FirebaseAuth.instance.currentUser!.uid)
        ? Alignment.centerRight
        : Alignment.centerLeft;
    return Container(
      alignment: alignment,
      child: Column(
        crossAxisAlignment:
            (data['senderId'] == FirebaseAuth.instance.currentUser!.uid)
                ? CrossAxisAlignment.end
                : CrossAxisAlignment.start,
        children: [
          StreamBuilder<DocumentSnapshot>(
              stream: FirebaseFirestore.instance
                  .collection("Users")
                  .doc(data['senderId'])
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData && snapshot.data!.data() != null) {
                  final userData =
                      snapshot.data!.data() as Map<String, dynamic>;
                  return Text(userData['name']);
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text("Error${snapshot.error}"),
                  );
                } else
                  // ignore: curly_braces_in_flow_control_structures
                  return const Center(child: CircularProgressIndicator());
              }),
          ChatBubble(message: data['message']),
        ],
      ),
    );
  }

  Widget _buildMessageInput(String userType) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _messageController,
            decoration: const InputDecoration(
              hintText: 'Type a message...',
            ),
          ),
        ),
        IconButton(
          onPressed: () => {
            sendMessage(userType),
            FirebaseFirestore.instance
                .collection('Users')
                .doc(FirebaseAuth.instance.currentUser?.uid)
                .collection("inbox")
                .doc(widget.receiverUserId)
                .set({}),
            FirebaseFirestore.instance
                .collection('Users')
                .doc(widget.receiverUserId)
                .collection("inbox")
                .doc(FirebaseAuth.instance.currentUser?.uid)
                .set({}),
          },
          icon: const Icon(Icons.send, size: 40),
        )
      ],
    );
  }
}
