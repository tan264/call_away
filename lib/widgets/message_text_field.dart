import 'package:flutter/material.dart';

class InputFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onPressed;

  const InputFieldWidget({
    required this.controller,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              controller: controller,
              decoration: const InputDecoration(
                hintText: "Write message...",
                hintStyle: TextStyle(color: Colors.black54),
                border: InputBorder.none,
              ),
            ),
          ),
          const SizedBox(width: 15),
          FloatingActionButton(
            onPressed: onPressed,
            backgroundColor: Colors.deepPurple,
            elevation: 0,
            child: const Icon(
              Icons.send,
              color: Colors.white,
              size: 25,
            ),
          ),
        ],
      ),
    );
  }
}
