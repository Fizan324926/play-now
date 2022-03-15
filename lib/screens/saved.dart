// ignore_for_file: prefer_const_constructors

import 'package:cric_scoring/components/widgets/app_bar.dart';
import 'package:cric_scoring/components/widgets/create_text.dart';
import 'package:cric_scoring/constants.dart';
import 'package:flutter/material.dart';

class Saved extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const APPBAR(
        text: "Saved Matches",
      ),
      body: Column(
        children: [
          Container(
            height: 20,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
                color: primary_color),
          ),
          Container(
            margin: EdgeInsets.only(top: 50),
            child: Center(
                child: const Create_Text(
              text: 'Not Yet Saved a Match!',
              txt_color: primary_color,
            )),
          ),
        ],
      ),
    );
  }
}
