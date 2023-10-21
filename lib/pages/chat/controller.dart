import 'dart:convert';

import 'package:call_away/model/chat_message.dart';
import 'package:call_away/service/chat_service.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  final chatService = Get.find<ChatService>();
  final List<ChatMessage> messages = <ChatMessage>[].obs;

  @override
  void onInit() {
    printInfo(info: "Chat controller init");
    super.onInit();

    chatService.client!.subscribe(
        destination: '/topic/public',
        callback: (frame) {
          if (frame.body != null) {
            printInfo(info: frame.body!);
          } else {
            printInfo(info: "frame.body is null");
          }
          ChatMessage message = ChatMessage.fromJson(jsonDecode(frame.body!));
          messages.add(message);
        });
  }

  void sendMessage(String message) {
    chatService.send(message);
  }

  void exit() {
    chatService.closeConnection();
    Get.offNamed("/home");
  }
}
