import 'package:flutter/material.dart';
import 'package:wedding_planner/screens/teams/components/body.dart';

class TeamScreen extends StatelessWidget {
  static const routeName = '/teams';
  const TeamScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.green,
      body: Body(),
      bottomNavigationBar: BottomAppBar(),
    );
  }
}
