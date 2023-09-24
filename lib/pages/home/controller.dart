import 'package:call_away/service/chat_service.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final chatService = Get.find<ChatService>();

  void join(String username) {
    chatService.joinChat(username);
    Get.toNamed("/chat");
  }
}
