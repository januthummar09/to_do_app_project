class ToDoModel{
  List<String>? studentList;

  ToDoModel({this.studentList=const [],});
  factory ToDoModel.fromJson(Map<String, dynamic> json) {
    return ToDoModel(
      studentList: json["data"],
    );
  }
}