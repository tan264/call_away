  import 'package:call_away/widgets/chat_message.dart';
  import 'package:call_away/widgets/message_bubble.dart';
  import 'package:flutter/material.dart';

  class MessageListWidget extends StatelessWidget {
    final List<ChatMessageWidget> messages;

    const MessageListWidget({
      required this.messages,
      Key? key,
    }) : super(key: key);

    @override
    Widget build(BuildContext context) {
      return Expanded(
        child: ListView.builder(
      itemCount: messages.length,
      itemBuilder: (context, index) {
        final message = messages[index];
        return MessageBubble(
          sender: message.sender,
          content: message.content,
          isMe: message.isMe,
        );
      },
    ),
      );
    }
  }
