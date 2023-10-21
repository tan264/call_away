import 'package:flutter/material.dart';

class ChatMessageWidget extends StatelessWidget {
  final String sender;
  final String content;
  final bool isMe;

  const ChatMessageWidget({
    required this.sender,
    required this.content,
    required this.isMe, 
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 10,
      ),
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft, 
      child: Column(
        crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            sender,
            style: TextStyle(
              fontSize: 12,
              color: isMe ? Colors.deepPurple[400] : Colors.blue, 
            ),
          ),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: isMe ? Colors.deepPurple[400] : Colors.blue, 
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              content,
              style: const TextStyle(
                color: Colors.white, 
              ),
            ),
          ),
        ],
      ),
    );
  }
}
