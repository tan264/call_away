import 'package:call_away/widgets/custom_button.dart';
import 'package:call_away/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:get/get.dart';

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
  String username = "";
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
                      onPressed: () {
                        // Navigator.pushNamed(context, '/chat');
                        // controller.join(_usernameController.text);
                        if (username.isEmpty) {
                          Get.closeAllSnackbars();
                          Get.snackbar("Username field cannot be empty",
                              "Please enter a username",
                              snackPosition: SnackPosition.TOP,
                              backgroundColor:
                                  Theme.of(context).colorScheme.errorContainer,
                              colorText: Theme.of(context)
                                  .colorScheme
                                  .onErrorContainer);
                        } else {
                          controller.join(username);
                        }
                      },
                    ),
                  ),
                  const SizedBox(height: 100),
                  Hero(
                    tag: 'footer',
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: TextButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text("Help us!"),
                              content: const Text(
                                  "One of our team members has lost his computer. Can you donate to help him buy a new computer?"),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text("NO")),
                                const TextButton(
                                    onPressed: null, child: Text("YES")),
                              ],
                            ),
                          );
                        },
                        child: const Text(
                          'Made with ♥ by Group 1',
                          style: TextStyle(fontFamily: 'Poppins'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
