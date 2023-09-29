import 'package:Callaway/widgets/custom_button.dart';
import 'package:Callaway/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import 'controller.dart';

// class HomePage extends GetView<HomeController> {
//   HomePage({super.key});
//   // final controller = Get.find<HomeController>();
//   final _usernameController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           centerTitle: true,
//           title: const Text('Animal Farm'),
//         ),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const Text(
//                   'Welcome to Animal farm. Enter your username to join with us!'),
//               TextField(
//                 controller: _usernameController,
//               ),
//               TextButton(
//                 onPressed: () {
//                   controller.join(_usernameController.text);
//                 },
//                 child: const Text("Submit"),
//               ),
//             ],
//           ),
//         ));
//   }
// }

// ignore: must_be_immutable
class HomePage extends GetView<HomeController> {
  HomePage({super.key});

//   @override
//   // ignore: library_private_types_in_public_api
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
  late String? username;
  bool loggingin = false;
  final _usernameController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: loggingin,
      child: Scaffold(
        // backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Hero(
                    tag: 'heroicon',
                    child: Icon(
                      Icons.textsms,
                      size: 120,
                      color: Colors.deepPurple[900],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Hero(
                    tag: 'HeroTitle',
                    child: Text(
                      'iChat',
                      style: TextStyle(
                          color: Colors.deepPurple[900],
                          fontFamily: 'Poppins',
                          fontSize: 26,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Text(
                    "Chat the Way You Want, Anytime, Anywhere".toUpperCase(),
                    style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 12,
                        color: Colors.deepPurple),
                  ),
                  CustomTextField(
                    hintText: 'Username',
                    leading: Icons.person,
                    obscure: false,
                    keyboard: TextInputType.text,
                    userTyped: (val) {
                      username = val;
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Hero(
                    tag: 'joinButton',
                    child: CustomButton(
                      text: 'JOIN',
                      onPressed: () async {
                        Navigator.pushNamed(context, '/chat');
                        controller.join(_usernameController.text);
                      },
                    ),
                  ),
                  const SizedBox(
                      height: 100
                  ),
                  const Hero(
                      tag: 'footer',
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          'Made with ♥ by Group 1',
                          style: TextStyle(fontFamily: 'Poppins'),
                        ),
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}