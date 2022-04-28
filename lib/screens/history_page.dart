import 'package:cric_scoring/components/widgets/create_text.dart';
import 'package:cric_scoring/components/widgets/header_part.dart';
import 'package:cric_scoring/components/widgets/raised_button.dart';
import 'package:cric_scoring/constants.dart';
import 'package:cric_scoring/screens/main_page.dart';
import 'package:flutter/material.dart';

class History_Page extends StatefulWidget {
  @override
  State<History_Page> createState() => _History_PageState();
}

class _History_PageState extends State<History_Page> {
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    void _goToHome() {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MainPage()));
    }

    return Column(
      children: [
        /*
        

               Header Part


         */
        Container(
          child: const Header_Part(
            textMain: "History",
            totalHeight: 0.1,
            //boxMargin: 50,
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        Container(
          height: _height * 0.7,
          width: _width,
          //decoration: BoxDecoration(color: primary_color),
          child: Container(
            margin: EdgeInsets.all(_height * 0.08),
            padding: EdgeInsets.all(_width * 0.05),
            height: _height * 0.55 - _height * 0.04,
            width: _width - _height * 0.04,
            decoration: BoxDecoration(
                color: primary_color.withOpacity(0.2),
                borderRadius:
                    const BorderRadius.all(const Radius.circular(20))),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    color: background_color,
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 10,
                          offset: const Offset(0, 10),
                          color: primary_color.withOpacity(0.23))
                    ],
                  ),
                  height: _height * 0.08,
                  width: _width * 0.75,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: _height * 0.075,
                        width: _width * 0.5,
                        padding: const EdgeInsets.only(left: 20),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [const Create_Text(text: "Name")],
                        ),
                      ),
                      Container(
                        child: ButtonTheme(
                          height: 55,
                          minWidth: 65,
                          child: RaisedButton(
                            onPressed: () {},
                            color: primary_color,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                side: const BorderSide(color: primary_color)),
                            child: const Create_Text(
                              text: "+",
                              txt_color: background_color,
                              txt_size: 20,
                              txt_weight: FontWeight.w900,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
