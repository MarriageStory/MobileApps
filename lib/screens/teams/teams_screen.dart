import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wedding_planner/model/teams.dart';
import 'package:wedding_planner/screens/teams/components/background.dart';
import 'package:wedding_planner/screens/teams/create_teams.dart';

class TeamScreen extends StatefulWidget {
  static const routeName = '/teams';
  const TeamScreen({Key? key}) : super(key: key);

  @override
  State<TeamScreen> createState() => _TeamScreenState();
}

class _TeamScreenState extends State<TeamScreen> {
  late Future<TeamsModel> team;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Background(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                top: 55,
                left: 20,
                child: Row(
                  children: [
                    // Icon(
                    //   Icons.menu,
                    //   color: Colors.white,
                    //   size: 35,
                    // ),
                    Image.asset(
                      'assets/icons/menu.png',
                    ),
                    SizedBox(
                      width: 107,
                    ),
                    Text(
                      "Teams",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      width: 107,
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CreateTeams()),
                          );
                        },
                        icon: const Icon(Icons.add, color: Colors.white))
                  ],
                ),
              ),
              FutureBuilder(
                future: team,
                builder: (context, AsyncSnapshot<TeamsModel> snapshot) {
                  var state = snapshot.connectionState;
                  if (state != ConnectionState.done) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          var _team = snapshot.data!.data[index];
                          return InkWell(child: listItem(_team));
                        },
                        itemCount: snapshot.data!.data.length,
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text(
                          snapshot.error.toString(),
                        ),
                      );
                    } else {
                      return Text('');
                    }
                  }
                },
              ),
              Positioned(
                top: 150,
                child: Column(
                  children: [
                    Container(
                      height: 65,
                      width: 325,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 0.1,
                              offset: Offset(0, 0), // Shadow position
                            ),
                          ],
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                                top: 22,
                                left: 30,
                                child: Text(
                                  "Project Leader",
                                  style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )),
                            Positioned(
                              top: 22,
                              right: 50,
                              child: Image.asset(
                                'assets/icons/people.png',
                              ),
                            ),
                            Positioned(
                                top: 22,
                                right: 25,
                                child: Text(
                                  "hjbjbj",
                                  style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    color: Color(0xFFFA5D76),
                                    fontWeight: FontWeight.w500,
                                  ),
                                )),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(),
    );
  }

  Widget listItem(Teams view) {
    return Column(
      children: [
        Container(
          height: 65,
          width: 325,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 0.1,
                  offset: Offset(0, 0), // Shadow position
                ),
              ],
            ),
            child: Stack(
              children: [
                Positioned(
                    top: 22,
                    left: 30,
                    child: Text(
                      "Leader",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    )),
                Positioned(
                  top: 22,
                  right: 50,
                  child: Image.asset(
                    'assets/icons/people.png',
                  ),
                ),
                Positioned(
                    top: 22,
                    right: 25,
                    child: Text(
                      view.leader,
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: Color(0xFFFA5D76),
                        fontWeight: FontWeight.w500,
                      ),
                    )),
              ],
            ),
          ),
        ),
        Container(
          height: 65,
          width: 325,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 0.1,
                  offset: Offset(0, 0), // Shadow position
                ),
              ],
            ),
            child: Stack(
              children: [
                Positioned(
                    top: 22,
                    left: 30,
                    child: Text(
                      "Staff",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    )),
                Positioned(
                  top: 22,
                  right: 50,
                  child: Image.asset(
                    'assets/icons/people.png',
                  ),
                ),
                Positioned(
                    top: 22,
                    right: 25,
                    child: Text(
                      view.staf,
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: Color(0xFFFA5D76),
                        fontWeight: FontWeight.w500,
                      ),
                    )),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
