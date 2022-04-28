import 'package:cric_scoring/constants.dart';
import 'package:cric_scoring/screens/dashboard.dart';
import 'package:cric_scoring/screens/dashboard_page.dart';
import 'package:cric_scoring/screens/history_page.dart';
import 'package:cric_scoring/screens/stats_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = [];
  @override
  void initState() {
    _widgetOptions = <Widget>[Dashboard_Page(), History_Page(), Stats_Page()];
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        //selectedFontSize: 0,
        //unselectedFontSize: 0,
        //type: BottomNavigationBarType.fixed,
        backgroundColor: primary_color,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: background_color,
        unselectedItemColor:
            background_color.withAlpha(150), // Colors.black.withOpacity(0.7),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        //elevation: 0,
        iconSize: 30,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.analytics),
            label: 'Stats',
          ),
        ],
      ),
    );
  }
}
