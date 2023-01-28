import 'package:flutter/material.dart';
import 'package:to_do_app_project/utils/constant.dart';

class ToDoCompleteScreen extends StatefulWidget {
  const ToDoCompleteScreen({Key? key}) : super(key: key);

  @override
  State<ToDoCompleteScreen> createState() => _ToDoCompleteScreenState();
}

class _ToDoCompleteScreenState extends State<ToDoCompleteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ToDoCompleteScreen"),
        backgroundColor: const Color(0xff06598a),
      ),
      body: listOfCompleteData.isEmpty
          ? const Center(
              child: Text(
                "No  Complete Data Found",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )
          : ListView.separated(
              itemCount: listOfCompleteData.length,
              padding: const EdgeInsets.symmetric(vertical: 15),
              separatorBuilder: (context, index) => const SizedBox(height: 15),
              itemBuilder: (context, index) {
                final item = listOfCompleteData[index];
                return Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  width: double.infinity,
                  color: const Color(0xffd2ebfa),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Title         :${item.title}", //item=listOfCompleteData[index];
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        "SubTitle   :${item.subTitle}",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        "Date        :${item.date}",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        "Time        :${item.time}",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
