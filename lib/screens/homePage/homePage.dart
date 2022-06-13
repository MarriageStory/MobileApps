import 'package:flutter/material.dart';
import 'package:wedding_planner/model/schedule_model.dart';
import 'package:wedding_planner/model/user_model.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wedding_planner/screens/homePage/widgets/box_card.dart';
import 'package:wedding_planner/service/auth_service.dart';

class homePage extends StatefulWidget {
  static const route = '/home-page';
  const homePage({Key? key}) : super(key: key);

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
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

  // late Future<Schedule> _schedul;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      body: SafeArea(
        child: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hallo",
                        style: TextStyle(fontSize: 14),
                      ),
                      Text(
                        user.name,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                  SvgPicture.asset("assets/icons/notification.svg")
                ],
              ),
              SizedBox(
                height: 15,
              ),
              // FutureBuilder(
              //   future: _schedul,
              //   builder: (context, AsyncSnapshot<Schedule> snapshot) {
              //     var state = snapshot.connectionState;
              //     if (state != ConnectionState.done) {
              //       return Center(
              //         child: CircularProgressIndicator(),
              //       );
              //     } else {
              //       if (snapshot.hasData) {
              //         return ListView.builder(
              //           physics: NeverScrollableScrollPhysics(),
              //           shrinkWrap: true,
              //           scrollDirection: Axis.vertical,
              //           itemBuilder: (context, index) {
              //             var schedule = snapshot.data!.data[index];
              //             return InkWell(child: listItem(schedule));
              //           },
              //           itemCount: snapshot.data!.data.length,
              //         );
              //       } else if (snapshot.hasError) {
              //         return Center(
              //           child: Text(
              //             snapshot.error.toString(),
              //           ),
              //         );
              //       } else {
              //         return Text('No Schedule');
              //       }
              //     }
              //   },
              // ),

              SizedBox(
                height: 20,
              ),
              Text(
                "Next Task",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Color(0xFF2F2F2F).withOpacity(0.7)),
              ),
              Container(
                margin: EdgeInsets.only(top: 5),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                width: double.infinity,
                height: 130,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "20.00",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w600),
                            ),
                            Text(
                              "Thursday, 23 April 2022",
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "Meeting dengan MUA",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w300),
                        )
                      ],
                    ),
                    Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [
                              Color(0xFFFE6A7E).withOpacity(0.65),
                              Color(0xFFFE6A7E),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(15)),
                      child: Icon(
                        Icons.navigate_next,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "All Results",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Color(0xFF2F2F2F).withOpacity(0.7)),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: BoxCard(
                      nameTask: "All Tasks",
                      totalTask: 12,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Flexible(
                    flex: 1,
                    child: BoxCard(
                      nameTask: "Completed Task",
                      totalTask: 2,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: BoxCard(
                      nameTask: "Payment Pending",
                      totalTask: 3,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Flexible(
                    flex: 1,
                    child: BoxCard(
                      nameTask: "Payment\nCompleted",
                      totalTask: 1,
                    ),
                  ),
                ],
              ),
            ],
          ),
        )),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: const Text(
          "Help",
          style: TextStyle(color: Color(0xFFFF5596)),
        ),
        icon: const Icon(
          Icons.help_outline,
          color: Color(0xFFFF5596),
        ),
        backgroundColor: Colors.white,
      ),
    );
  }

  Widget listItem(SchedulesModel view) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16),
      height: 115,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/bg.png"), fit: BoxFit.cover),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Groom & Bride",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
              Row(
                children: [
                  Text(
                    "Wedding date",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w300),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    "7 April 2023",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w600),
                  )
                ],
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset("assets/icons/people.svg"),
              SizedBox(
                width: 8,
              ),
              Text(
                "7",
                style:
                    TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
              )
            ],
          ),
        ],
      ),
    );
  }
}
