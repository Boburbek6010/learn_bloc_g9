import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String text;
  final TextInputType textInputType;
  const CustomTextField({super.key, required this.controller, required this.text, required this.textInputType});

  @override
  Widget build(BuildContext context) {
    return TextField(
      textInputAction: TextInputAction.done,
      keyboardType: textInputType,
      controller: controller,
      decoration: InputDecoration(
        hintText: text,
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black38),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
