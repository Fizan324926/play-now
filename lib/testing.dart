import 'package:cric_scoring/components/widgets/header_part.dart';
import 'package:cric_scoring/components/widgets/raised_button.dart';
import 'package:cric_scoring/screens/main_page.dart';
import 'package:flutter/widgets.dart';
import 'package:cric_scoring/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Sample extends StatefulWidget {
  const Sample({Key? key}) : super(key: key);

  @override
  State<Sample> createState() => _SampleState();
}

class _SampleState extends State<Sample> {
  void _goToHome() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => MainPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Header_Part(
        textMain: "Sample",
        totalHeight: 0.1,
        isGoBack: true,
        goBackFunction: _goToHome,
      ),
    );
  }
}
