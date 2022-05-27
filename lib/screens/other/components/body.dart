import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wedding_planner/screens/other/components/background.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Background(
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            Positioned(
                top: 55,
                left: 20,
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/images/sample.jpg'),
                      radius: 45,
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Santi Amiludin",
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            )),
                        Text("Wedding Organizer",
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: Colors.white,
                            )),
                      ],
                    )
                  ],
                )),
            Positioned(
              top: 220,
              left: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Others",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.notifications_none,
                        color: Color(0xFFfcabaa),
                        size: 32,
                      ),
                      SizedBox(
                        width: 22,
                      ),
                      Text("Notifications",
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                          )),
                      SizedBox(
                        width: 160,
                      ),
                      Text("2",
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.settings,
                        color: Color(0xFFfcabaa),
                        size: 32,
                      ),
                      SizedBox(
                        width: 22,
                      ),
                      Text("Settings",
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
