import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final String dataType;
  const ChatBubble({super.key, required this.message, required this.dataType});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: const Color.fromRGBO(245, 246, 249, 1),
      ),
      child: dataType == "image"
          ? Image.network(message)
          : Text(
              message,
              style: TextStyle(fontSize: 15, color: Colors.black),
            ),
    );
  }
}
