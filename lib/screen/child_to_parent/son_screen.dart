// using function
//child to perant grt data
// son-father screen

import 'package:flutter/material.dart';

class SonScreen extends StatefulWidget {
  final Function(String)? callback;
  const SonScreen({super.key, this.callback});

  @override
  State<SonScreen> createState() => _SonScreenState();
}

class _SonScreenState extends State<SonScreen> {
  TextEditingController namecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Son Screen"),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: TextField(
                controller: namecontroller,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigator.pop(context, textEditingController.text);
                widget.callback!(namecontroller.text,);
              },
              child: const Text("Back Screen"),
            ),
          ],
        ),
      ),
    );
  }
}
