import 'package:Callaway/pages/chat/binding.dart';
import 'package:Callaway/pages/chat/page.dart';
import 'package:Callaway/pages/home/binding.dart';
import 'package:Callaway/pages/home/page.dart';
import 'package:Callaway/routes/app_routes.dart';
// import 'package:call_away/pages/chat/binding.dart';
// import 'package:call_away/pages/chat/page.dart';
// import 'package:call_away/pages/home/binding.dart';
// import 'package:call_away/pages/home/page.dart';
// import 'package:call_away/routes/app_routes.dart';
import 'package:get/get.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.home,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.chat,
      page: () => ChatPage(),
      binding: ChatBinding(),
    ),
  ];
}
