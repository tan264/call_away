import 'package:call_away/model/chat_message.dart';
import 'package:call_away/pages/chat/controller.dart';
import 'package:call_away/widgets/chat_message.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatPage extends GetView<ChatController> {
  ChatPage({super.key});
  final _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.deepPurple[300],
          title: const Text('iChat'),
          actions: [
            IconButton(
              icon: const Icon(Icons.exit_to_app),
              onPressed: () {
                controller.exit();
              },
            ),
          ]),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Obx(
              () => ListView.builder(
                itemCount: controller.messages.length,
                shrinkWrap: true,
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                //physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final message = controller.messages[index];
                  if (message.type == MessageType.chat) {
                    return ChatMessageWidget(
                        sender: message.sender,
                        content: message.content!,
                        isMe:
                            message.sender == controller.chatService.username);
                  } else {
                    return Center(
                      child: Text(
                          "${message.sender} ${message.type == MessageType.join ? "joined" : "left"}"),
                    );
                  }
                },
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            color: Colors.white,
            child: Row(
              children: <Widget>[
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      color: Colors.deepPurple[400],
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: const InputDecoration(
                      hintText: "Write message...",
                      hintStyle: TextStyle(color: Colors.black54),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                FloatingActionButton(
                  onPressed: () {
                    controller.sendMessage(_messageController.text);
                    _messageController.clear();
                  },
                  backgroundColor: Colors.deepPurple[400],
                  elevation: 0,
                  mini: true,
                  child: const Icon(
                    Icons.send,
                    color: Colors.white,
                    size: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
