// using navigation pop
// dataFirst screen -dataSecond screen

import 'package:flutter/material.dart';

class DataSecondScreen extends StatefulWidget {
  const DataSecondScreen({Key? key}) : super(key: key);

  @override
  State<DataSecondScreen> createState() => _DataSecondScreenState();
}

class _DataSecondScreenState extends State<DataSecondScreen> {
  TextEditingController namecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Data Frist Screen"),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: namecontroller,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(
                    context,
                    namecontroller.text,
                  );
                },
                child: const Text("Back Screen"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
