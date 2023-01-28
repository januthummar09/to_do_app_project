class ToDOModelData {
   List<String>? titleDataList;

  ToDOModelData({this.titleDataList= const []});
   factory ToDOModelData.fromJson(Map<String, dynamic> json) {
    return ToDOModelData(
      titleDataList: json["data"],
    );
  }
}
