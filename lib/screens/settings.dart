import 'package:cric_scoring/components/widgets/app_bar.dart';
import 'package:cric_scoring/components/widgets/create_text.dart';
import 'package:cric_scoring/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Settings extends StatefulWidget {
  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final _playersController = TextEditingController();

  final _oversController = TextEditingController();

  final _whiteRunController = TextEditingController();

  bool validatePlayers() {
    int players = int.parse(_playersController.text);
    if (players > 11) {
      return false;
    }
    return true;
  }

  bool validateOvers() {
    int overs = int.parse(_oversController.text);
    if (overs > 50) {
      return false;
    }
    return true;
  }

  bool validateWhiteBallRun() {
    int whiteRun = int.parse(_whiteRunController.text);
    if (whiteRun > 3) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: APPBAR(
        text: "Settings",
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
          Form(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Expanded(
                            child: Create_Text(
                                text: "Players", txt_weight: FontWeight.w500)),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: TextFormField(
                              controller: _playersController,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Expanded(
                            child: Create_Text(
                                text: "Overs", txt_weight: FontWeight.w500)),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: TextFormField(
                              controller: _oversController,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Expanded(
                            child: Create_Text(
                          text: "White Ball Run",
                          txt_weight: FontWeight.w500,
                        )),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: TextFormField(
                              controller: _whiteRunController,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: TextButton(
                        child: Create_Text(
                          text: "Save",
                          txt_color: primary_color,
                        ),
                        onPressed: () {
                          if (!validatePlayers()) {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                title: const Text("Invalid Players"),
                                content:
                                    const Text("Players number is not valid"),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () => {Navigator.pop(context)},
                                    child: const Text('Ok'),
                                  ),
                                ],
                              ),
                            );
                            return;
                          }
                          if (!validateOvers()) {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                title: const Text("Invalid Overs"),
                                content: const Text("Over number is not valid"),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () => {Navigator.pop(context)},
                                    child: const Text('Ok'),
                                  ),
                                ],
                              ),
                            );
                            return;
                          }
                          if (!validatePlayers()) {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                title: const Text("Invalid White Run"),
                                content:
                                    const Text("White Ball Run is not valid"),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () => {Navigator.pop(context)},
                                    child: const Text('Ok'),
                                  ),
                                ],
                              ),
                            );
                            return;
                          }
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
