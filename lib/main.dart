import 'package:cric_scoring/constants.dart';
import 'package:cric_scoring/screens/dashboard.dart';
import 'package:cric_scoring/screens/dashboard_page.dart';
import 'package:cric_scoring/screens/history.dart';
import 'package:cric_scoring/screens/main_page.dart';
import 'package:cric_scoring/screens/splash_screen.dart';
import 'package:cric_scoring/screens/start_selction.dart';
import 'package:cric_scoring/testing.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Criket Scoring',
      theme: ThemeData(
        scaffoldBackgroundColor: background_color,
        primaryColor: primary_color,
        textTheme: Theme.of(context).textTheme.apply(bodyColor: text_color),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const Splash_Screen(),
    );
  }
}
