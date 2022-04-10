import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonText extends StatefulWidget {
  final IconData icon;
  final String text;
  final onEvent;

  ButtonText({required this.icon, required this.text, required this.onEvent});

  @override
  State<ButtonText> createState() => _ButtonTextState();
}

class _ButtonTextState extends State<ButtonText> {
  Color _color = Colors.black;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onClick,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Icon(widget.icon, color: _color),
        Text(
          widget.text,
          style: TextStyle(color: _color),
        )
      ]),
    );
  }

  void onClick() {
    widget.onEvent();
    setState(() {
      if (_color == Colors.black)
        _color = Colors.blueAccent;
      else
        _color = Colors.black;
    });
  }
}
