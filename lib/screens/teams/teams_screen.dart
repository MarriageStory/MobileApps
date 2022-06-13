// // import 'package:flutter/material.dart';
// // import 'package:google_fonts/google_fonts.dart';
// // import 'package:wedding_planner/model/teamsModel.dart';
// // import 'package:wedding_planner/screens/teams/components/background.dart';
// // import 'package:wedding_planner/screens/teams/create_teams.dart';
// // import 'package:wedding_planner/service/teamsService.dart';

// // class TeamScreen extends StatefulWidget {
// //   static const routeName = '/teams';
// //   const TeamScreen({Key? key}) : super(key: key);

// //   @override
// //   State<TeamScreen> createState() => _TeamScreenState();
// // }

// // class _TeamScreenState extends State<TeamScreen> {
// //   late Future<Team> _team;
// //   //panjang data
// //   int totalData = 0;
// //   //anggota tim
// //   int leader = 0;
// //   int staff = 0;

// //   @override
// //   void initState() {
// //     super.initState();
// //     _team = TeamsService().getAllTeams();
// //   }

// <<<<<<< Updated upstream
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Stack(children: [
//           Column(
//             // alignment: Alignment.center,
//             children: [
//               Container(
//                 height: 140,
//                 width: MediaQuery.of(context).size.width,
//                 //padding: EdgeInsets.symmetric(vertical: 20),
//                 decoration: const BoxDecoration(
//                     gradient: LinearGradient(
//                         begin: Alignment.bottomLeft,
//                         end: Alignment.topRight,
//                         colors: [
//                       Color(0xFFFC9DA1),
//                       Color(0xFFFE6A7E),
//                     ])),
//                 child: Center(
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     //crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Container(width: MediaQuery.of(context).size.width * 0.1),
//                       const Text(
//                         " Teams",
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 18,
//                           color: Colors.white,
//                         ),
//                       ),
//                       IconButton(
//                           onPressed: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => CreateTeams()),
//                             );
//                           },
//                           icon: const Icon(Icons.add, color: Colors.white))
//                     ],
//                   ),
//                 ),
//               ),
//               FutureBuilder(
//                 future: _team,
//                 builder: (context, AsyncSnapshot<Team> snapshot) {
//                   var state = snapshot.connectionState;
//                   if (state != ConnectionState.done) {
//                     return Center(
//                       child: CircularProgressIndicator(),
//                     );
//                   } else {
//                     if (snapshot.hasData) {
//                       return ListView.builder(
//                         physics: NeverScrollableScrollPhysics(),
//                         shrinkWrap: true,
//                         scrollDirection: Axis.vertical,
//                         itemBuilder: (context, index) {
//                           var team = snapshot.data!.data[index];
//                           totalData++;
//                           leader += int.parse(team.leader);
//                           staff += int.parse(team.staf);
//                           if (snapshot.data!.data.length > totalData) {
//                             return SizedBox();
//                           } else {
//                             return InkWell(child: listItem(leader, staff));
//                           }
//                         },
//                         itemCount: snapshot.data!.data.length,
//                       );
//                     } else if (snapshot.hasError) {
//                       return Center(
//                         child: Text(
//                           snapshot.error.toString(),
//                         ),
//                       );
//                     } else {
//                       return Text('');
//                     }
//                   }
//                 },
//               ),
//             ],
//           ),
//         ]),
//       ),
//       bottomNavigationBar: BottomAppBar(),
//     );
//   }

//   Widget listItem(int leader, int staff) {
//     return Column(
//       children: [
//         Container(
//           height: 65,
//           width: 325,
//           child: Container(
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(15),
//               color: Colors.white,
//               boxShadow: const [
//                 BoxShadow(
//                   color: Colors.grey,
//                   blurRadius: 0.1,
//                   offset: Offset(0, 0), // Shadow position
//                 ),
//               ],
//             ),
//             child: Stack(
//               children: [
//                 Positioned(
//                     top: 22,
//                     left: 30,
//                     child: Text(
//                       "Leader Project",
//                       style: GoogleFonts.poppins(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     )),
//                 Positioned(
//                   top: 22,
//                   right: 50,
//                   child: Image.asset(
//                     'assets/icons/people.png',
//                   ),
//                 ),
//                 Positioned(
//                     top: 22,
//                     right: 25,
//                     child: Text(
//                       leader.toString(),
//                       style: GoogleFonts.poppins(
//                         fontSize: 16,
//                         color: Color(0xFFFA5D76),
//                         fontWeight: FontWeight.w500,
//                       ),
//                     )),
//               ],
//             ),
//           ),
//         ),
//         SizedBox(
//           height: 15,
//         ),
//         Container(
//           height: 65,
//           width: 325,
//           child: Container(
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(15),
//               color: Colors.white,
//               boxShadow: const [
//                 BoxShadow(
//                   color: Colors.grey,
//                   blurRadius: 0.1,
//                   offset: Offset(0, 0), // Shadow position
//                 ),
//               ],
//             ),
//             child: Stack(
//               children: [
//                 Positioned(
//                     top: 22,
//                     left: 30,
//                     child: Text(
//                       "Staff",
//                       style: GoogleFonts.poppins(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     )),
//                 Positioned(
//                   top: 22,
//                   right: 50,
//                   child: Image.asset(
//                     'assets/icons/people.png',
//                   ),
//                 ),
//                 Positioned(
//                     top: 22,
//                     right: 25,
//                     child: Text(
//                       staff.toString(),
//                       style: GoogleFonts.poppins(
//                         fontSize: 16,
//                         color: Color(0xFFFA5D76),
//                         fontWeight: FontWeight.w500,
//                       ),
//                     )),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
// =======
// //   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Background(
//           child: Column(
//             // alignment: Alignment.center,
//             children: [
//               SizedBox(
//                 height: 35,
//               ),
//               Positioned(
//                 top: 55,
//                 left: 20,
//                 child: Row(
//                   children: [
//                     // Icon(
//                     //   Icons.menu,
//                     //   color: Colors.white,
//                     //   size: 35,
//                     // ),
//                     Image.asset(
//                       'assets/icons/menu.png',
//                     ),
//                     SizedBox(
//                       width: 107,
//                     ),
//                     Text(
//                       "Teams",
//                       style: GoogleFonts.poppins(
//                         fontSize: 16,
//                         color: Colors.white,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                     SizedBox(
//                       width: 107,
//                     ),
//                     IconButton(
//                         onPressed: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => CreateTeams()),
//                           );
//                         },
//                         icon: const Icon(Icons.add, color: Colors.white))
//                   ],
//                 ),
//               ),
//               FutureBuilder(
//                 future: _team,
//                 builder: (context, AsyncSnapshot<Team> snapshot) {
//                   var state = snapshot.connectionState;
//                   if (state != ConnectionState.done) {
//                     return Center(
//                       child: CircularProgressIndicator(),
//                     );
//                   } else {
//                     if (snapshot.hasData) {
//                       return ListView.builder(
//                         physics: NeverScrollableScrollPhysics(),
//                         shrinkWrap: true,
//                         scrollDirection: Axis.vertical,
//                         itemBuilder: (context, index) {
//                           var team = snapshot.data!.data[index];
//                           totalData++;
//                           leader += int.parse(team.leader);
//                           staff += int.parse(team.staf);
//                           if (snapshot.data!.data.length > totalData) {
//                             return SizedBox();
//                           } else {
//                             return InkWell(child: listItem(leader, staff));
//                           }
//                         },
//                         itemCount: snapshot.data!.data.length,
//                       );
//                     } else if (snapshot.hasError) {
//                       return Center(
//                         child: Text(
//                           snapshot.error.toString(),
//                         ),
//                       );
//                     } else {
//                       return Text('');
//                     }
//                   }
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//       bottomNavigationBar: BottomAppBar(),
//     );
//   }

//   Widget listItem(int leader, int staff) {
//     return Column(
//       children: [
//         Container(
//           height: 65,
//           width: 325,
//           child: Container(
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(15),
//               color: Colors.white,
//               boxShadow: const [
//                 BoxShadow(
//                   color: Colors.grey,
//                   blurRadius: 0.1,
//                   offset: Offset(0, 0), // Shadow position
//                 ),
//               ],
//             ),
//             child: Stack(
//               children: [
//                 Positioned(
//                     top: 22,
//                     left: 30,
//                     child: Text(
//                       "Leader",
//                       style: GoogleFonts.poppins(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     )),
//                 Positioned(
//                   top: 22,
//                   right: 50,
//                   child: Image.asset(
//                     'assets/icons/people.png',
//                   ),
//                 ),
//                 Positioned(
//                     top: 22,
//                     right: 25,
//                     child: Text(
//                       leader.toString(),
//                       style: GoogleFonts.poppins(
//                         fontSize: 16,
//                         color: Color(0xFFFA5D76),
//                         fontWeight: FontWeight.w500,
//                       ),
//                     )),
//               ],
//             ),
//           ),
//         ),
//         SizedBox(
//           height: 15,
//         ),
//         Container(
//           height: 65,
//           width: 325,
//           child: Container(
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(15),
//               color: Colors.white,
//               boxShadow: const [
//                 BoxShadow(
//                   color: Colors.grey,
//                   blurRadius: 0.1,
//                   offset: Offset(0, 0), // Shadow position
//                 ),
//               ],
//             ),
//             child: Stack(
//               children: [
//                 Positioned(
//                     top: 22,
//                     left: 30,
//                     child: Text(
//                       "Staff",
//                       style: GoogleFonts.poppins(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     )),
//                 Positioned(
//                   top: 22,
//                   right: 50,
//                   child: Image.asset(
//                     'assets/icons/people.png',
//                   ),
//                 ),
//                 Positioned(
//                     top: 22,
//                     right: 25,
//                     child: Text(
//                       staff.toString(),
//                       style: GoogleFonts.poppins(
//                         fontSize: 16,
//                         color: Color(0xFFFA5D76),
//                         fontWeight: FontWeight.w500,
//                       ),
//                     )),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
