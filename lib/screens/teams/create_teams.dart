import 'package:flutter/material.dart';
import 'package:wedding_planner/navbar/navbar.dart';
import 'package:wedding_planner/screens/teams/teams_screen.dart';
import 'package:wedding_planner/service/scheduleService.dart';
import 'package:wedding_planner/service/teamsService.dart';

class CreateTeams extends StatefulWidget {
  const CreateTeams({Key? key}) : super(key: key);

  @override
  State<CreateTeams> createState() => _CreateTeamsState();
}

class _CreateTeamsState extends State<CreateTeams> {
  TextEditingController leaders = TextEditingController();
  TextEditingController staff = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const TeamScreen()),
                            );
                          },
                          icon: const Icon(Icons.arrow_back,
                              color: Colors.black)),
                      const Text(
                        "Add Teams",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 30, right: 16, left: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Total projek leader",
                  ),
                  TextField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    controller: leaders,
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 30, right: 16, left: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Total Staf",
                  ),
                  TextField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    controller: staff,
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10, right: 20),
              child: Column(
                children: <Widget>[
                  InkWell(
                    child: Container(
                      height: 45,
                      padding: EdgeInsets.symmetric(vertical: 10),
                      width: MediaQuery.of(context).size.width,
                      margin:
                          const EdgeInsets.only(right: 16, left: 16, top: 20),
                      child: Text(
                        "save",
                        style: TextStyle(color: Colors.black),
                        textAlign: TextAlign.center,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            Color(0xFFFE6A7E).withOpacity(0.65),
                            Color(0xFFFE6A7E),
                          ],
                        ),
                      ),
                    ),
                    onTap: () async {
                      Map<String, dynamic> body = {
                        'leader': leaders.text,
                        'staf': staff.text,
                      };
                      
                      await TeamsService().createTeams(body).then((value) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return BaseScreen(
                            index: 3,
                          );
                        }));
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text(
                                    'You have successfully create a scedule')));
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
