import 'package:flutter/material.dart';

class ToDoTextfild extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final bool? enable;
  final Widget?suffixIcon;
  const ToDoTextfild({Key? key, this.controller, this.hintText, this.enable, this.suffixIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: TextField(
        
        enabled: enable ?? true,
        controller: controller,
        cursorColor: const Color(0xff06598a),
        decoration: InputDecoration(
          suffixIcon:suffixIcon,
          hintText: hintText,
          border: InputBorder.none,
          filled: true,
          fillColor: const Color(0xffd2ebfa),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 20,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              color: Color(0xff06598a),
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
        ),
      ),
    );
  }
}
