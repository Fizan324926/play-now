import 'package:cric_scoring/constants.dart';
import 'package:flutter/material.dart';

class APPBAR extends StatelessWidget with PreferredSizeWidget {
  final String text;
  final Color? back_color;
  final Color? font_color;
  final double? height;
  final double defaultheight = 50;
  final Color defaultbcolor = primary_color;
  final Color defaultfcolor = background_color;
  final FontWeight? fweight;
  final double? fsize;
  final FontWeight defaultfweight = FontWeight.w500;
  final double defaultfsize = 20;
  const APPBAR(
      {Key? key,
      required this.text,
      this.height,
      this.back_color,
      this.font_color,
      this.fweight,
      this.fsize})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      title: Text(
        this.text,
        style: TextStyle(
            color: this.font_color ?? this.defaultfcolor,
            fontSize: this.fsize ?? this.defaultfsize,
            fontWeight: this.fweight ?? this.defaultfweight),
      ),
      backgroundColor: this.back_color ?? this.defaultbcolor,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(this.height ?? this.defaultheight);
}
