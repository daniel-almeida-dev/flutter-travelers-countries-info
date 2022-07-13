import 'package:flutter/material.dart';

class RoundedTextFormField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final bool autoCorrect;
  final bool enableSuggestions;
  final String Function(String?)? onValidate;
  final Function(String) onTextChanged;
  TextEditingController? controller;

  RoundedTextFormField({
    Key? key,
    required this.hintText,
    required this.onTextChanged,
    required this.obscureText,
    required this.autoCorrect,
    required this.enableSuggestions,
    this.onValidate,
    this.controller
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(50),
        child: TextFormField(
          onChanged: onTextChanged,
          keyboardType: TextInputType.text,
          controller: controller,
          style: const TextStyle(color: Color.fromARGB(255, 46, 165, 188)),
          obscureText: obscureText,
          enableSuggestions: enableSuggestions,
          autocorrect: autoCorrect,
          decoration: InputDecoration(
            //Change this value to custom as you like
            labelText: hintText,
            labelStyle: const TextStyle(
              color: Colors.grey,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: const BorderSide(
                  color: Colors.grey, width: 0),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: const BorderSide(
                  color: Colors.grey, width: 0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: const BorderSide(
                  color: Color.fromARGB(255, 46, 165, 188), width: 0),
            ),
          ),
        ),
      ),
    );
  }
}
