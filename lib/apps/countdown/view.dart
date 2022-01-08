import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;

  final Color color;
  final Color backgroundColor;

  const ButtonWidget(this.text, this.onClicked,
      {this.color = Colors.white,
      this.backgroundColor = Colors.black,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: backgroundColor,
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16)),
        onPressed: onClicked,
        child: Text(
          text,
          style: TextStyle(fontSize: 20, color: color),
        ));
  }
}
