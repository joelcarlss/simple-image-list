import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton(this.text, this.onClick, {this.backgoundColor, this.textColor});

  final String text;
  final onClick;
  final Color backgoundColor;
  final Color textColor;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: backgoundColor == null ? Colors.red : backgoundColor,
      textColor: textColor == null ? Colors.black : textColor,
      onPressed: (() => onClick()),
      child: Text(text),
    );
  }
}
