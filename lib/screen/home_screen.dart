import 'package:flutter/material.dart';

import '../model/to_do_model.dart';

class HomeScreenSelf extends StatefulWidget {
  const HomeScreenSelf({Key? key}) : super(key: key);

  @override
  State<HomeScreenSelf> createState() => _HomeScreenSelfState();
}

class _HomeScreenSelfState extends State<HomeScreenSelf> {
  DateTime date = DateTime.now();
  TimeOfDay time = TimeOfDay.now();

  ToDoModel? toDoModel;
  int val = 0;
  List<String> data = [];
  @override
  void initState() {
    super.initState();
    toDoModel = ToDoModel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HomeScreen"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          data.add((val++).toString());
          debugPrint("Val :$data");

          toDoModel!.studentList = data;
          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: ListView(
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: toDoModel!.studentList!.length,
                itemBuilder: (context, index) => Container(
                  height: 50,
                  width: double.infinity,
                  color: Colors.yellow,
                  child: Text("Val: ${toDoModel!.studentList![index]}"),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                height: 50,
                color: Colors.yellow,
                child: Row(
                  children: [
                    Text(
                        "Selected Date  : ${date.day}/${date.month}/${date.year}"),
                    const Spacer(),
                    InkWell(
                      onTap: () async {
                        DateTime? datePicker = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2021),
                          lastDate: DateTime(2025),
                        );
                        if (datePicker != null) {
                          setState(() {
                            date = datePicker;
                          });
                          debugPrint(
                              "date selected :${datePicker.day}:${datePicker.month}:${datePicker.year}");
                        }
                      },
                      child: const Icon(Icons.date_range_outlined),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
