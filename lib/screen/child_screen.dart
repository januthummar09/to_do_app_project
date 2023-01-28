import 'package:flutter/material.dart';
import 'package:to_do_app_project/common_widget/common_text_fild.dart';

class ChildScreen extends StatefulWidget {
  const ChildScreen({Key? key}) : super(key: key);

  @override
  State<ChildScreen> createState() => _ChildScreenState();
}

class _ChildScreenState extends State<ChildScreen> {
  DateTime date = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            children: [
              const CommonTextFild(),
              const SizedBox(
                height: 20,
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
              ElevatedButton(
                onPressed: () {},
                child: const Text("ok"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
