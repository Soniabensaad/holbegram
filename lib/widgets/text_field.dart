import 'package:flutter/material.dart';

class TextFieldInput extends StatelessWidget {
  final TextEditingController controller;
  final bool isPassword;
  final String hintText;
  final Widget? suffixIcon;
  final TextInputType keyboardType;

  const TextFieldInput({
    Key? key,
    required this.controller,
    required this.isPassword,
    required this.hintText,
    this.suffixIcon,
    required this.keyboardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0), 
        color: Colors.white, 
      ),
      child: Theme(
        data: ThemeData(
          primaryColor: Colors.deepPurple, 
        ),
        child: TextField(
          keyboardType: keyboardType,
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
            border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
            ),
            filled: true,
            contentPadding: const EdgeInsets.all(8),
            suffixIcon: suffixIcon,
          ),
          textInputAction: TextInputAction.next,
          obscureText: isPassword,
        ),
      ),
    );
  }
}
