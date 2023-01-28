//. parent screen to child screen.
// file name first screen ---- second screen

import 'package:flutter/material.dart';
import 'package:to_do_app_project/screen/parent_to_child/second_screen.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("First Screen"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text("First screen"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SecondScreen(
                    name: "janki",
                    nameData: const ["b", "cvb", "bn", 12, "vbn", 2345, 345],
                    text: Container(
                      alignment: Alignment.center,
                      height: 200,
                      width: 200,
                      color: Colors.pink,
                      child: const Text("pass widget"),
                    ),
                  ),
                ),
              );
            },
            child: const Text("go second screen"),
          ),
        ],
      ),
    );
  }
}
