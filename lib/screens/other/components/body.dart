import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wedding_planner/model/user_model.dart';
import 'package:wedding_planner/screens/other/components/background.dart';
import 'package:wedding_planner/service/auth_service.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  UserModel user = UserModel(
      id: 0,
      name: "",
      email: "",
      emailVerifiedAt: DateTime.now(),
      role: "",
      createdAt: DateTime.now(),
      updatedAt: DateTime.now());

  @override
  void initState() {
    getUserProfile();
    super.initState();
  }

  Future<void> getUserProfile() async {
    try {
      var data = await AuthService.authUserProfile();

      setState(() {
        user = data;
      });
    } catch (e) {
      if (mounted) {
        Navigator.pushReplacementNamed(context, "/welcome-screen");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Background(
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            Positioned(
                top: MediaQuery.of(context).size.height * 0.07,
                left: 34,
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
                        Text(user.name,
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            )),
                        Text(user.role,
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: Colors.white,
                            )),
                      ],
                    )
                  ],
                )),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.25,
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
