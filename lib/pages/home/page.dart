import 'package:call_away/pages/home/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  HomePage({super.key});
  // final controller = Get.find<HomeController>();
  final _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Animal Farm'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                  'Welcome to Animal farm. Enter your username to join with us!'),
              TextField(
                controller: _usernameController,
              ),
              TextButton(
                onPressed: () {
                  controller.join(_usernameController.text);
                },
                child: const Text("Submit"),
              ),
            ],
          ),
        ));
  }
}
