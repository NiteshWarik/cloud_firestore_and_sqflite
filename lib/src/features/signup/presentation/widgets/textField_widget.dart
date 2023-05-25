import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  //final String labelText;
  final String hintText;
  final String? Function(String?) validator;
  final TextInputType keyboardType;
  final bool obscureText;
  final TextEditingController controller;

  const CustomTextFormField({
    super.key,
    //required this.labelText,
    required this.validator,
    required this.controller,
    required this.hintText,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        style: const TextStyle(color: Colors.white),
        keyboardType: keyboardType,
        obscureText: obscureText,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
            borderSide: BorderSide(width: 1.5, color: Colors.grey),
          ),
          //labelText: labelText,
          hintText: hintText,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
            borderSide: BorderSide(width: 1.5, color: Colors.green),
          ),
        ),
        validator: validator,
        controller: controller,
      ),
    );
  }
}

Widget customTextWidget(String inputText) {
  return Padding(
    padding: const EdgeInsets.only(left: 10.0),
    child: Text(
      inputText,
      style: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.left,
    ),
  );
}
