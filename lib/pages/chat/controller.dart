import 'dart:convert';

import 'package:Callaway/model/chat_message.dart';
import 'package:Callaway/service/chat_service.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  final chatService = Get.find<ChatService>();
  final List<ChatMessage> messages = <ChatMessage>[].obs;

  @override
  void onInit() {
    super.onInit();

    chatService.client.subscribe(
        destination: '/topic/public',
        callback: (frame) {
          messages.add(ChatMessage.fromJson(jsonDecode(frame.body!)));
          print(frame.body);
        });
  }

  void sendMessage(String message) {
    chatService.send(message);
  }
}
