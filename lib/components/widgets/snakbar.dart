import 'package:cric_scoring/components/widgets/create_text.dart';
import 'package:flutter/material.dart';

class MySnakBar extends SnackBar {
  final String text;
  MySnakBar({Key? key, required this.text})
      : super(
            key: key,
            content: Create_Text(text: text),
            duration: Duration(seconds: 3),
            action: SnackBarAction(
              label: 'Done',
              onPressed: () {
                // Some code to undo the change.
              },
            ));

  @override
  State<MySnakBar> createState() => _MySnakBarState();
}

class _MySnakBarState extends State<MySnakBar> {
  @override
  Widget build(BuildContext context) {
    return SnackBar(
        content: Create_Text(text: widget.text),
        duration: Duration(seconds: 3),
        action: SnackBarAction(
          label: 'Done',
          onPressed: () {
            // Some code to undo the change.
          },
        ));
  }
}
