import 'package:flutter/material.dart';

class CommonTextFild extends StatelessWidget {
  final  TextEditingController? controller;
  final String? prefixTitle;
  final String? hintTitle;
  const CommonTextFild({Key? key, this.prefixTitle, this.hintTitle, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 20,
        ),
        hintText:hintTitle?? "Title Name",

        prefix: Text(
          prefixTitle ?? "Title  :",
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Color(0xff1c235e),
            width: 2,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Color(0xff858185),
            width: 2,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Color(0xff21c437),
            width: 2,
          ),
        ),
      ),
    );
  }
}
