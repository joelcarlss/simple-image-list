import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(this.label, this.controller, this.type);

  final String label;
  final TextEditingController controller;
  final String type;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(labelText: label),
      obscureText: type == 'password',
    );
  }
}
