// ignore_for_file: non_constant_identifier_names

import 'package:cric_scoring/constants.dart';
import 'package:flutter/material.dart';

class Create_Text extends StatelessWidget {
  final String text;
  final Color? txt_color;
  final double? txt_size;
  final FontWeight? txt_weight;
  const Create_Text(
      {Key? key,
      required this.text,
      this.txt_color,
      this.txt_size,
      this.txt_weight})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: txt_color ?? primary_color,
          fontSize: txt_size ?? 20,
          fontWeight: txt_weight ?? FontWeight.w500),
    );
  }
}
