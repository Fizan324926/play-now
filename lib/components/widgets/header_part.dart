import 'package:cric_scoring/constants.dart';
import 'package:flutter/material.dart';

class Header_Part extends StatefulWidget {
  final String textMain;
  final double totalHeight;
  final double? txtBoxHeight;
  final double? boxMargin;
  final Color? backgroudColor;
  final bool? isGoBack;
  final bool? isHelp;
  final Function? goBackFunction;
  final Function? goHelpFunction;
  const Header_Part(
      {Key? key,
      required this.textMain,
      required this.totalHeight,
      this.txtBoxHeight,
      this.boxMargin,
      this.backgroudColor,
      this.isGoBack,
      this.isHelp,
      this.goBackFunction,
      this.goHelpFunction})
      : super(key: key);

  @override
  State<Header_Part> createState() => _Header_PartState();
}

class _Header_PartState extends State<Header_Part> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    double _getTotalHight = _height * widget.totalHeight;
    double _defaultMargin = _width * 0.15;
    bool _isGoBack = widget.isGoBack ?? false;
    bool _isMore = widget.isHelp ?? false;

    Widget _goBack() {
      return Container(
          //height: 20,
          //width: 20,
          child: FloatingActionButton(
        backgroundColor: primary_color,
        elevation: 0,
        hoverColor: text_color,
        onPressed: () => {Navigator.of(context).pop()},
        child: Icon(Icons.skip_previous),
      ));
    }

    Widget _goHelp() {
      return Container(
          child: FloatingActionButton(
        backgroundColor: primary_color,
        elevation: 0,
        hoverColor: text_color,
        onPressed: () {},
        child: Icon(Icons.help_rounded),
      ));
    }

    return Container(
      height: _getTotalHight + 15,
      width: _width,
      decoration:
          BoxDecoration(color: widget.backgroudColor ?? background_color),
      child: Stack(
        children: [
          Container(
              height: _getTotalHight,
              width: _width,
              padding: EdgeInsets.symmetric(horizontal: _width * 0.005),
              decoration: BoxDecoration(
                  color: primary_color,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _isGoBack ? _goBack() : Container(),
                  _isMore ? _goHelp() : Container()
                ],
              )),
          Positioned(
            left: 0,
            top: _getTotalHight - 30,
            right: 0,
            child: Container(
              height: widget.txtBoxHeight ?? 45,
              margin: EdgeInsets.symmetric(
                  horizontal: widget.boxMargin ?? _defaultMargin),
              decoration: BoxDecoration(
                color: background_color,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 50,
                      offset: Offset(0, 10),
                      color: primary_color.withOpacity(0.23))
                ],
              ),
              // ignore: prefer_const_constructors
              child: Center(
                child: Text(
                  widget.textMain,
                  style: TextStyle(
                    color: primary_color,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
