import 'package:cric_scoring/components/widgets/create_text.dart';
import 'package:cric_scoring/constants.dart';
import 'package:flutter/material.dart';

class Raised_Button extends StatefulWidget {
  final String text;
  final double? height, width;
  const Raised_Button(
      {Key? key, required this.text, this.height, this.width, onPressed})
      : super(key: key);
  @override
  State<Raised_Button> createState() => _Reised_ButtonState(
        text,
        height,
        width,
      );
}

class _Reised_ButtonState extends State<Raised_Button> {
  final String text;
  final double? height, width;
  _Reised_ButtonState(
    @required this.text,
    this.height,
    this.width,
  );
  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      height: this.height ?? 50,
      minWidth: this.width ?? 50,
      child: RaisedButton(
        onPressed: () {},
        color: background_color,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: BorderSide(color: primary_color)),
        child: Create_Text(
          text: text,
          txt_color: primary_color,
          txt_size: 20,
          txt_weight: FontWeight.w900,
        ),
      ),
    );
  }
}
