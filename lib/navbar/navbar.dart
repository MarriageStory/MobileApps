// ignore_for_file: implementation_imports, unnecessary_import

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:wedding_planner/screens/homePage/homePage.dart';
import 'package:wedding_planner/screens/task/task_screen.dart';
import 'package:wedding_planner/screens/payment/payment_screen.dart';
import 'package:wedding_planner/screens/teams/teams_screen.dart';
import 'package:wedding_planner/screens/other/other_screen.dart';
import 'package:wedding_planner/model/my_flutter_app_icons.dart';

class BaseScreen extends StatefulWidget {
  int index;
  BaseScreen({Key? key, required this.index}) : super(key: key);

  @override
  State<BaseScreen> createState() => _BaseScreenState(index);
}

class _BaseScreenState extends State<BaseScreen> {
  int _selectedIndex;
  _BaseScreenState(this._selectedIndex);

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static const List<Widget> _widgetOptions = <Widget>[
    homePage(),
    TaskScreen(),
    PaymentPage(),
    TeamScreen(),
    OtherScreen(),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: Row(
        children: <Widget>[
          buildNavItem(MyFlutterApp.home, 0, ),
          buildNavItem(MyFlutterApp.task, 1, ),
          buildNavItem(MyFlutterApp.payment, 2, ),
          buildNavItem(MyFlutterApp.user, 3, ),
          buildNavItem(MyFlutterApp.menu, 4, ),
        ],
      ),

    );
  }
  Widget buildNavItem(IconData icon, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width / 5,
        decoration: index == _selectedIndex ? BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 3.5, 
              color: Color(0xFFFF5596),
              )
          ),
          ): const BoxDecoration(),
        child: Icon(icon, color: index == _selectedIndex ? Color(0xFFFF5596) :Colors.grey[400],size: 18,),
      ),
    );
  }
}
