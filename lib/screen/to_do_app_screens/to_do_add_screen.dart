import 'package:flutter/material.dart';

import '../../common_widget/to_do_textfild.dart';
import '../../model/to_do_app_model.dart';

class ToDoAddScreen extends StatefulWidget {
  final ToDoAppModel? item;
  const ToDoAddScreen({Key? key,  this.item}) : super(key: key);

  @override
  State<ToDoAddScreen> createState() => _ToDoAddScreenState();
}

class _ToDoAddScreenState extends State<ToDoAddScreen> {
  TextEditingController? titleController;
  TextEditingController? subTitleController;
  TextEditingController? dateController;
  TextEditingController? timeController;
  @override
  void initState() {
    titleController = TextEditingController();
    subTitleController = TextEditingController();
    dateController = TextEditingController();
    timeController = TextEditingController();
    editData();
    super.initState();
  }
editData(){
  if(widget.item!=null){
    titleController!.text=widget.item!.title!;
    subTitleController!.text=widget.item!.subTitle!;
    dateController!.text=widget.item!.date!;
    timeController!.text=widget.item!.title!;
  }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff06598a),
        title: const Text("TO DO ADD SCREEN"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Column(
          children: [
            ToDoTextfild(
              controller: titleController,
              hintText: "Enter Title",
            ),
            const SizedBox(
              height: 20,
            ),
            ToDoTextfild(
              controller: subTitleController,
              hintText: "Enter SubTitle",
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2030),
                );

                debugPrint("date ----------->> $pickedDate");
                dateController!.text = pickedDate.toString().split(" ").first;
                setState(() {});
              },
              child: ToDoTextfild(
                controller: dateController,
                hintText: "Enter Date",
                suffixIcon: const Icon(Icons.date_range),
                enable: false,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () async {
                TimeOfDay? pickTime = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                debugPrint("time----------->$pickTime");
                timeController!.text = pickTime!.format(context);

                setState(() {});
              },
              child: ToDoTextfild(
                controller: timeController,
                hintText: "Enter Time",
                suffixIcon: const Icon(Icons.timelapse_outlined),
                enable: false,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                ToDoAppModel toDoAppModel = ToDoAppModel(
                  title: titleController!.text,
                  subTitle: subTitleController!.text,
                  date: dateController!.text,
                  time: timeController!.text,
                );
                Navigator.pop(context, toDoAppModel);
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    const Color(0xff06598a),
                  ),
                  fixedSize: MaterialStateProperty.all(const Size(200, 50))),
              child: const Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}
