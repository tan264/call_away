import 'package:Callaway/pages/home/binding.dart';
import 'package:Callaway/pages/home/page.dart';
import 'package:Callaway/routes/app_pages.dart';
import 'package:Callaway/service/chat_service.dart';
// import 'package:call_away/service/chat_service.dart';
// import 'package:call_away/pages/home/binding.dart';
// import 'package:call_away/pages/home/page.dart';
// import 'package:call_away/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main(List<String> args) async {
  initService();

  runApp(const MyApp());
}

initService() {
  Get.put<ChatService>(ChatService());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ClientServerDemo',
      theme: ThemeData(primaryColor: Colors.blue),
      initialBinding: HomeBinding(),
      home: HomePage(),
      getPages: AppPages.pages,
    );
  }
}
