import 'package:cric_scoring/components/widgets/create_text.dart';
import 'package:cric_scoring/constants.dart';
import 'package:flutter/material.dart';

class Raised_Button extends StatefulWidget {
  final String text;
  final double? height, width;
  final VoidCallback? onPressed;
  const Raised_Button(
      {Key? key, required this.text, this.height, this.width, this.onPressed})
      : super(key: key);

  @override
  State<Raised_Button> createState() => _Raised_ButtonState();
}

class _Raised_ButtonState extends State<Raised_Button> {
  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      height: widget.height ?? 50,
      minWidth: widget.width ?? 50,
      child: RaisedButton(
        onPressed: widget.onPressed ?? () {},
        color: background_color,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: BorderSide(color: primary_color)),
        child: Create_Text(
          text: widget.text,
          txt_color: primary_color,
          txt_size: 20,
          txt_weight: FontWeight.w900,
        ),
      ),
    );
  }
}
