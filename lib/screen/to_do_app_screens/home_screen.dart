import 'package:flutter/material.dart';
import 'package:to_do_app_project/screen/to_do_app_screens/to_do_add_screen.dart';
import 'package:to_do_app_project/screen/to_do_app_screens/to_do_complete_screen.dart';
import 'package:to_do_app_project/utils/constant.dart';
import '../../model/to_do_app_model.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ToDoAppModel> listData = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HOME SCREEN"),
        actions: [
          IconButton(
            icon: const Icon(Icons.done),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ToDoCompleteScreen(),
                ),
              );
            },
          ),
        ],
        backgroundColor: const Color(0xff06598a),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          dynamic data = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ToDoAddScreen(),
            ),
          );
          if (data != null) {
            listData.add(data);
            setState(() {});
          }
          debugPrint(" List------------------>$listData");
        },
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          children: [
            const Text(
              "To Do Data",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            listData.isEmpty
                ? const Center(
                    child: Text(
                      "Data is not found",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )
                : Expanded(
                    child: ListView(
                      children: [
                        ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: listData.length,
                          separatorBuilder: (context, index) {
                            return const SizedBox(
                              height: 20,
                            );
                          },
                          itemBuilder: (context, index) {
                            final item = listData[index];

                            return Slidable(
                              key: UniqueKey(),
                              startActionPane: ActionPane(
                                motion: const ScrollMotion(),
                                dismissible: DismissiblePane(
                                  onDismissed: () {
                                    listOfCompleteData.add(item);
                                    setState(() {});
                                  },
                                ),
                                children: [
                                  SlidableAction(
                                    onPressed: (context) {
                                      listOfCompleteData.add(item);

                                      setState(() {});
                                    },
                                    backgroundColor: const Color(0xFF0392CF),
                                    foregroundColor: Colors.white,
                                    icon: Icons.save,
                                    label: 'Save',
                                  ),
                                  SlidableAction(
                                    onPressed: (context) async {
                                      dynamic editData = await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => ToDoAddScreen(
                                            item:
                                                item, //item   =. listData[index]
                                          ),
                                        ),
                                      );
                                      if (editData != null) {
                                        listData[index] = editData;
                                        setState(() {});
                                      }
                                    },
                                    backgroundColor: const Color(0xFF7BC043),
                                    foregroundColor: Colors.white,
                                    icon: Icons.edit_rounded,
                                    label: 'Edit',
                                  ),
                                ],
                              ),
                              endActionPane: ActionPane(
                                motion: const ScrollMotion(),
                                dismissible: DismissiblePane(onDismissed: () {
                                  listData.removeAt(index);
                                  debugPrint(
                                      "dismissible delet data--------------->$listData");
                                  setState(() {});
                                }),
                                children: [
                                  SlidableAction(
                                    onPressed: (context) {
                                      listData.removeAt(index);
                                      setState(() {
                                        debugPrint(
                                            "delet data--------------->$listData");
                                      });
                                    },
                                    backgroundColor: const Color(0xFFFE4A49),
                                    foregroundColor: Colors.white,
                                    icon: Icons.delete,
                                    label: 'Delete',
                                  ),
                                ],
                              ),
                              child: Container(
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
                                      "Title         :${listData[index].title}",
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Text(
                                      "SubTitle   :${listData[index].subTitle}",
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Text(
                                      "Date        :${listData[index].date}",
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Text(
                                      "Time        :${listData[index].time}",
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        )
                      ],
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
