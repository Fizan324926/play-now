import 'package:cric_scoring/constants.dart';
import 'package:flutter/material.dart';

class Ball extends StatelessWidget {
  final String text;
  const Ball({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color _backgroundColor = primary_color;
    Color _textColor = background_color;
    if (text.toLowerCase() == "1") {
      _backgroundColor = Colors.black.withOpacity(0.8);
      _textColor = background_color;
    } else if (text.toLowerCase() == "2") {
      _backgroundColor = Colors.blue.withOpacity(0.8);
      _textColor = background_color;
    } else if (text.toLowerCase() == "3") {
      _backgroundColor = Colors.orange.withOpacity(0.8);
      _textColor = background_color;
    } else if (text.toLowerCase() == "5") {
      _backgroundColor = Colors.black.withOpacity(0.8);
    }
    return Container(
      margin: EdgeInsets.only(left: 1.5),
      child: CircleAvatar(
          radius: 10.0,
          backgroundColor: _backgroundColor,
          child: Text(text,
              style: TextStyle(
                color: _textColor,
                fontWeight: FontWeight.bold,
                fontSize: 10,
                fontFamily: 'Roboto-Regular',
              ))),
    );
  }
}
