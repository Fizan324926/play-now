import 'package:cric_scoring/components/widgets/create_text.dart';
import 'package:cric_scoring/components/widgets/header_part.dart';
import 'package:cric_scoring/constants.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class Stats_Page extends StatefulWidget {
  @override
  State<Stats_Page> createState() => _Stats_PageState();
}

class _Stats_PageState extends State<Stats_Page> {
  Map<String, double> batdata = new Map();
  Map<String, double> bowdata = new Map();
  bool _loadChart = false;
  bool _batvalue = true;
  bool _bowvalue = false;
  @override
  void initState() {
    batdata.addAll({'Ahmad': 36, 'Asad': 87, 'Ali': 9, 'Mavia': 44});
    bowdata.addAll({'Ali': 3, 'Asad': 7, 'Ali': 92, 'Mavia': 44});

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Header_Part(textMain: "Stats", totalHeight: 0.15),
            SizedBox(
              height: 40,
            ),
            Container(
              height: _height * 0.1,
              width: _width,
              padding:
                  EdgeInsets.only(left: _width * 0.24, right: _width * 0.24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Create_Text(
                        text: "Batsman",
                        txt_color: Colors.black.withAlpha(180),
                      ),
                      Checkbox(
                          hoverColor: primary_color.withOpacity(0.2),
                          activeColor: primary_color,
                          value: this._batvalue,
                          onChanged: (bool) {
                            setState(() {
                              if (this._batvalue != true) {
                                this._batvalue = true;
                                this._bowvalue = false;
                              }
                            });
                          }),
                    ],
                  ),
                  Row(
                    children: [
                      Create_Text(
                        text: "Bowler",
                        txt_color: Colors.black.withAlpha(180),
                      ),
                      Checkbox(
                          hoverColor: primary_color.withOpacity(0.2),
                          activeColor: primary_color,
                          value: this._bowvalue,
                          onChanged: (bool) {
                            setState(() {
                              if (this._bowvalue != true) {
                                this._batvalue = false;
                                this._bowvalue = true;
                              } else {
                                this._bowvalue = false;
                                this._batvalue = true;
                              }
                            });
                          }),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 70,
            ),
            Create_Chart(_width, _height),
          ],
        ),
      ),
    );
  }

  Stack Create_Chart(double _width, double _height) {
    return Stack(
      children: [
        _batvalue
            ? PieChart(
                dataMap: batdata,
                // if not declared, random colors will be chosen
                animationDuration: Duration(milliseconds: 1500),
                chartLegendSpacing: _width * 0.2,
                chartRadius: _height * 0.3, //determines the size of the chart

                chartType: ChartType.disc, //can be changed to ChartType.ring
              )
            : SizedBox(
                height: _height * 0.3,
              ),
        _bowvalue
            ? PieChart(
                dataMap: bowdata,
                // if not declared, random colors will be chosen
                animationDuration: Duration(milliseconds: 1500),
                chartLegendSpacing: 32.0,
                chartRadius: _height * 0.3,

                chartType: ChartType.disc, //can be changed to ChartType.ring
              )
            : SizedBox(
                height: _height * 0.3,
              ),
      ],
    );
  }
}
