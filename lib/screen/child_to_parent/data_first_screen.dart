

// using navigation pop
// dataFirst screen -dataSecond screen

import 'package:flutter/material.dart';
import 'package:to_do_app_project/screen/child_to_parent/data_second_screen.dart';

class DataFirstScreen extends StatefulWidget {
  const DataFirstScreen({Key? key}) : super(key: key);

  @override
  State<DataFirstScreen> createState() => _DataFirstScreenState();
}

class _DataFirstScreenState extends State<DataFirstScreen> {
  dynamic data;
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
              Text("data: $data"),
              ElevatedButton(
                onPressed: () async {
                  data = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DataSecondScreen(),
                    ),
                  );
                  setState(() {});

                  debugPrint("data ----------------->>> $data");
                },
                child: const Text("Next Screen"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
