import 'dart:convert';

import 'package:call_away/model/chat_message.dart';
import 'package:get/get.dart';
import 'package:stomp_dart_client/stomp.dart';
import 'package:stomp_dart_client/stomp_config.dart';
import 'package:stomp_dart_client/stomp_frame.dart';

class ChatService extends GetxService {
  // final wsUrl = 'http://10.0.2.2:8080/ws'; // for emulator
  final wsUrl = 'https://clientserver-production.up.railway.app/ws';
  StompClient? client;
  String? username;

  @override
  void onInit() {
    super.onInit();
    initClient();
  }

  @override
  void onClose() {
    super.onClose();

    client?.deactivate();
  }

  void initClient() {
    client = StompClient(
        config: StompConfig.sockJS(
      url: wsUrl,
      onConnect: onConnectCallback,
      onDisconnect: (p0) {
        if (p0.body != null) {
          printInfo(info: p0.body!);
        } else {
          printInfo(info: "Disconected");
        }
      },
      onDebugMessage: (p0) => printInfo(info: p0),
      onStompError: (p0) => printInfo(info: p0.body ?? ""),
      onWebSocketError: (p0) => printInfo(info: p0),
    ));

    client?.activate();
  }

  void closeConnection() {
    client?.deactivate();
    client = null;
  }

  void joinChat(String username) {
    if (client == null) {
      initClient();
    }
    this.username = username;
    client!.send(
        destination: '/app/chat.addUser',
        body: jsonEncode(ChatMessage.joinMessage(username).toJson()),
        headers: {});
  }

  void send(String message) {
    client!.send(
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
    Get.closeAllSnackbars();
    Get.snackbar("Connected!", "Enter username to join with us",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Get.theme.colorScheme.primaryContainer,
        colorText: Get.theme.colorScheme.onPrimaryContainer);
  }
}
