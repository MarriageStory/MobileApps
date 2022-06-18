import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wedding_planner/model/user_model.dart';
import 'package:wedding_planner/screens/other/components/background.dart';
import 'package:wedding_planner/screens/signin/signin_screen.dart';
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
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Column(
      children: [
        Container(
          width: size.width,
          height: size.height * 0.23,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15)),
              gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: [
                    Color(0xFFFC9DA1),
                    Color(0xFFFE6A7E),
                  ])),
          child: Padding(
            padding: const EdgeInsets.only(left: 34, right: 34),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage('assets/images/profile.png'),
                  radius: 40,
                ),
                const SizedBox(
                  width: 16,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(user.name,
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        )),
                    Text(user.role,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: Colors.white,
                        )),
                  ],
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 36,
        ),
        Container(
          margin: EdgeInsets.only(left: 20, right: 20),
          width: size.width,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text("Others",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: Colors.black54,
                  fontWeight: FontWeight.w600,
                )),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                const Icon(
                  Icons.logout,
                  color: Color(0xFFFE6A7E),
                  size: 24,
                ),
                const SizedBox(
                  width: 20,
                ),
                TextButton(
                    onPressed: () async {
                      final prefs = await SharedPreferences.getInstance();
                      prefs.remove("token");
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignInScreen()),
                      );
                    },
                    child: Text(
                      "Logoout",
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: Colors.black54,
                        fontWeight: FontWeight.w600,
                      ),
                    )),
              ],
            ),
          ]),
        )
      ],
    )
        // child: Background(
        //   child: Stack(
        //     alignment: Alignment.centerLeft,
        //     children: [
        //       Positioned(
        //           top: MediaQuery.of(context).size.height * 0.07,
        //           left: 34,
        //           child: Row(
        //             children: [
        //               CircleAvatar(
        //                 backgroundImage: AssetImage('assets/images/profile.png'),
        //                 radius: 45,
        //               ),
        //               SizedBox(
        //                 width: 30,
        //               ),
        //               Column(
        //                 crossAxisAlignment: CrossAxisAlignment.start,
        //                 children: <Widget>[
        //                   Text(user.name,
        //                       style: GoogleFonts.poppins(
        //                         fontSize: 18,
        //                         color: Colors.white,
        //                         fontWeight: FontWeight.w700,
        //                       )),
        //                   Text(user.role,
        //                       style: GoogleFonts.poppins(
        //                         fontSize: 14,
        //                         color: Colors.white,
        //                       )),
        //                 ],
        //               )
        //             ],
        //           )),
        //       // Positioned(
        //       //   top: MediaQuery.of(context).size.height * 0.25,
        //       //   left: 20,
        //       //   child: Column(
        //       //     crossAxisAlignment: CrossAxisAlignment.start,
        //       //     children: <Widget>[
        //       //       Text("Others",
        //       //           style: GoogleFonts.poppins(
        //       //             fontSize: 16,
        //       //             color: Colors.grey,
        //       //             fontWeight: FontWeight.w600,
        //       //           )),
        //       //       SizedBox(
        //       //         height: 20,
        //       //       ),
        //       //       Row(
        //       //         children: [
        //       //           Icon(
        //       //             Icons.notifications_none,
        //       //             color: Color(0xFFfcabaa),
        //       //             size: 32,
        //       //           ),
        //       //           SizedBox(
        //       //             width: 22,
        //       //           ),
        //       //           Text("Notifications",
        //       //               style: GoogleFonts.poppins(
        //       //                 fontSize: 14,
        //       //                 color: Colors.grey,
        //       //                 fontWeight: FontWeight.w500,
        //       //               )),
        //       //         ],
        //       //       ),
        //       //       SizedBox(
        //       //         height: 20,
        //       //       ),
        //       //       Row(
        //       //         children: [
        //       //           Icon(
        //       //             Icons.settings,
        //       //             color: Color(0xFFfcabaa),
        //       //             size: 32,
        //       //           ),
        //       //           SizedBox(
        //       //             width: 22,
        //       //           ),
        //       //           Text("Settings",
        //       //               style: GoogleFonts.poppins(
        //       //                 fontSize: 14,
        //       //                 color: Colors.grey,
        //       //                 fontWeight: FontWeight.w500,
        //       //               )),
        //       //         ],
        //       //       ),
        //       //       SizedBox(
        //       //         height: 20,
        //       //       ),
        //       //       Row(
        //       //         children: [
        //       //           Icon(
        //       //             Icons.logout,
        //       //             color: Color(0xFFfcabaa),
        //       //             size: 32,
        //       //           ),
        //       //           SizedBox(
        //       //             width: 22,
        //       //           ),
        //       //           TextButton(
        //       //               onPressed: () async {
        //       //                 final prefs = await SharedPreferences.getInstance();
        //       //                 prefs.remove("token");
        //       //                 Navigator.push(
        //       //                   context,
        //       //                   MaterialPageRoute(
        //       //                       builder: (context) => SignInScreen()),
        //       //                 );
        //       //               },
        //       //               child: Text(
        //       //                 "Logoout",
        //       //                 style: GoogleFonts.poppins(
        //       //                   fontSize: 14,
        //       //                   color: Colors.grey,
        //       //                   fontWeight: FontWeight.w500,
        //       //                 ),
        //       //               )),
        //       //         ],
        //       //       ),
        //       //     ],
        //       //   ),
        //       // ),
        //     ],
        //   ),
        // ),
        );
  }
}
