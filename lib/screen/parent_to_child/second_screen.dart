   
   
  //. parent screen to child screen.     
  // file name first screen ---- second screen
   
   
   import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  final String? name;
  final List? nameData;
  final Widget? text;
  const SecondScreen(
      {Key? key, this.name, this.nameData, this.text})
      : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(" Second Screen"),
      ),
      body: ListView(
        children: [
          const Text("Second Screen"),
          Text("Second Screen :  ${widget.name}"),
          ListView.builder(
            itemCount: widget.nameData!.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Container(
                color: Colors.pink,
                child: Text("name data:${widget.nameData![index]}"),
              );
            },
          ),
          textFun(), //.    using function
          Container(
            padding: const EdgeInsets.all(70),   // normal use
            height: 300,
            width: 300,
            color: Colors.blue,
            child: widget.text,
          ),
        ],
      ),
    );
  }

  Widget textFun() {
    return Container(
      padding: const EdgeInsets.all(70),
      height: 300,
      width: 300,
      color: Colors.amber,
      child: widget.text,
    );
  }

 
}
