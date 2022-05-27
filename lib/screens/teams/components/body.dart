import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wedding_planner/screens/teams/components/background.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                  Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 25,
                  ),
                ],
              ),
            ),
            Positioned(
              top: 150,
              child: Container(
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
                            "15",
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
            ),
          ],
        ),
      ),
    );
  }
}
