import 'package:cric_scoring/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class History extends StatefulWidget {
  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Column(
      children: [
        Container(
          child: Buildupperpart(height, width, context, 100),
        ),
        Row(
          children: [
            Container(
              height: 10,
              width: 10,
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(10),
              child: TextField(
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                cursorColor: primary_color,
                controller: search,
                style: const TextStyle(color: Colors.black),
                cursorHeight: 30,
                decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: primary_color),
                    ),
                    border: OutlineInputBorder(),
                    labelText: 'Total No. of Players',
                    labelStyle: TextStyle(color: primary_color)),
              ),
            ),
          ],
        ),
      ],
    ));
  }
}

Container Buildupperpart(
    double height, double width, BuildContext context, container_height) {
  return Container(
    height: container_height,
    child: Stack(
      children: [
        Container(
          height: height * 0.12,
          decoration: const BoxDecoration(
              color: primary_color,
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(36),
                  bottomRight: const Radius.circular(36))),
        ),
        Positioned(
          left: 0,
          bottom: 0,
          right: 0,
          child: Container(
            height: 50,
            margin: const EdgeInsets.symmetric(horizontal: default_padding + 5),
            decoration: BoxDecoration(
              color: background_color,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                    blurRadius: 50,
                    offset: const Offset(0, 10),
                    color: primary_color.withOpacity(0.23))
              ],
            ),
            // ignore: prefer_const_constructors
            child: Center(
              child: const Text(
                "History",
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
