import 'package:flutter/material.dart';
import 'package:to_do_app_project/model/to_do_model_data.dart';
import 'package:to_do_app_project/screen/to_do/to_do_second_screen.dart';

class ToDoFristScreen extends StatefulWidget {
  const ToDoFristScreen({Key? key}) : super(key: key);

  @override
  State<ToDoFristScreen> createState() => _ToDoFristScreenState();
}

class _ToDoFristScreenState extends State<ToDoFristScreen> {
  ToDOModelData? toDOModelData;
  // ToDoModel? toDoModel;
  dynamic data;
  int addList = 0;
  List<String>? todoList = [];
  List<String>? todoData = [];
  @override
  void initState() {
    super.initState();
    toDOModelData = ToDOModelData();
    // toDoModel = ToDoModel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // todoData = await Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => const ToDoSecondScreen(),
          //   ),
          // );
       todoData!.add(
            (Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ToDoSecondScreen(),
              ),
            )).toString(),
          );
          // todoData!.add((addList++).toString());

          debugPrint("To Do Data  ------------->first:$todoData");
          debugPrint("List :$addList");
          toDOModelData!.titleDataList = todoData;
          debugPrint("To Do Data -------------->second:$todoData");
          setState(() {});

          // todoList.add((addList++).toString());
          // debugPrint("Val :$todoList");
          // toDOModelData!.titleDataList = todoList;
          // debugPrint("To Do Data :$todoList");

          // setState(() {});
        },
        child: const Icon(Icons.add),
      ),
      body: ListView(
        children: [
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: toDOModelData!.titleDataList!.length,
            itemBuilder: (context, index) => Container(
              height: 50,
              width: double.infinity,
              color: Colors.yellow,
              child: Text(" ${toDOModelData!.titleDataList![index]}"),
            ),
          ),
        ],
      ),
    );
  }
}
