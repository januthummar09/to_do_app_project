import 'package:flutter/material.dart';
import 'package:to_do_app_project/common_widget/common_text_fild.dart';

class ToDoSecondScreen extends StatefulWidget {
  //  final Function(List)? callback;
  const ToDoSecondScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ToDoSecondScreen> createState() => _ToDoSecondScreenState();
}

class _ToDoSecondScreenState extends State<ToDoSecondScreen> {
  TextEditingController? titleController;
  TextEditingController? subTitleController;
  @override
  void initState() {
    super.initState();
    titleController = TextEditingController();
    subTitleController = TextEditingController();
  }

  DateTime date = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          children: [
            CommonTextFild(
              controller: titleController,
            ),
            const SizedBox(
              height: 20,
            ),
            CommonTextFild(
              prefixTitle: "SubTitle",
              hintTitle: "SubTitle",
              controller: subTitleController,
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              height: 70,
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color(0xff858185),
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Text(
                    "Selected Date  : ${date.day}/${date.month}/${date.year}",
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
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
              onPressed: () {
                // widget.callback!([titleController!.text,subTitleController!.text,]).toString();
                Navigator.pop(context, [
                  titleController!.text,
                  subTitleController!.text,
                  // date,
                ]);
              },
              child: const Text("ok"),
            ),
          ],
        ),
      ),
    );
  }
}
