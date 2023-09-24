import 'dart:convert';

import 'package:call_away/model/chat_message.dart';
import 'package:get/get.dart';
import 'package:stomp_dart_client/stomp.dart';
import 'package:stomp_dart_client/stomp_config.dart';
import 'package:stomp_dart_client/stomp_frame.dart';

class ChatService extends GetxService {
  final wsUrl = 'http://10.0.2.2:8080/ws'; // for emulator
  late StompClient client;
  String? username;

  @override
  void onInit() {
    super.onInit();
    client = StompClient(
        config: StompConfig.sockJS(
            url: 'http://10.0.2.2:8080/ws', onConnect: onConnectCallback));

    client.activate();
  }

  @override
  void onClose() {
    super.onClose();

    client.deactivate();
  }

  void joinChat(String username) {
    this.username = username;
    client.send(
        destination: '/app/chat.addUser',
        body: jsonEncode(ChatMessage.joinMessage(username).toJson()),
        headers: {});
  }

  void send(String message) {
    client.send(
        destination: '/app/chat.sendMessage',
        body: jsonEncode(ChatMessage(
                sender: username!, content: message, type: MessageType.chat)
            .toJson()),
        headers: {});
  }

  void onConnectCallback(StompFrame connectFrame) {
    // client is connected and ready
    // client.subscribe(
    //   destination: '/topic/public',
    //   headers: {},
    //   callback: (frame) {
    //     // Received a frame for this subscription
    //     print(frame.body);
    //   },
    // );

    // client.send(
    //     destination: '/app/chat.addUser',
    //     body: jsonEncode(ChatMessage.joinMessage("tan264").toJson()),
    //     headers: {});
  }
}
