// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wedding_planner/model/payment_model.dart';
import 'package:wedding_planner/model/schedule_model.dart';
import 'package:wedding_planner/model/user_model.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wedding_planner/screens/homePage/widgets/box_card.dart';
import 'package:wedding_planner/screens/task/task_detail.dart';
import 'package:wedding_planner/service/auth_service.dart';
import 'package:intl/src/intl/date_format.dart';
import 'package:wedding_planner/service/payment_service.dart';
import 'package:wedding_planner/service/schedule_service.dart';

class HomePage extends StatefulWidget {
  static const route = '/home-page';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<SchedulesModel> _schedule;
  late Future<PaymentsModel> _payments;
  int allPayment = 0;
  int paymentDone = 0;
  UserModel user = UserModel(
      id: 0,
      name: "",
      email: "",
      emailVerifiedAt: DateTime.now(),
      role: "",
      createdAt: DateTime.now(),
      updatedAt: DateTime.now());
  int allTask = 0;

  @override
  void initState() {
    super.initState();
    getUserProfile();
    _payments = PaymentService.getAllPayments();

    try {
      _schedule = ScheduleService.getAllSchedules();
    } catch (e) {
      print(e);
    }
  }

  Future<void> getUserProfile() async {
    try {
      var data = await AuthService.authUserProfile();

      setState(() {
        user = data;
      });
    } catch (e) {
      Navigator.pushReplacementNamed(context, "/base-screen");
    }
  }

  _launchURLApp() async {
    var url = Uri.parse("https://www.youtube.com");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
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
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 36),
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
                        "Hallo, ",
                        style: TextStyle(fontSize: 14),
                      ),
                      Text(
                        user.name,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                  // SvgPicture.asset("assets/icons/notification.svg")
                ],
              ),
              SizedBox(
                height: 16,
              ),
              FutureBuilder(
                future: _schedule,
                builder: (context, AsyncSnapshot<SchedulesModel> snapshot) {
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
                          var schedule = snapshot.data?.data.first;
                          return InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, DetailTask.url,
                                    arguments: schedule);
                              },
                              child: listItem(schedule!));
                        },
                        itemCount: 1,
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text(
                          snapshot.error.toString(),
                        ),
                      );
                    } else {
                      return Text('No Schedule');
                    }
                  }
                },
              ),
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
              FutureBuilder(
                future: _schedule,
                builder: (context, AsyncSnapshot<SchedulesModel> snapshot) {
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
                          var schedule_2 = snapshot.data?.data.first;
                          return InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, DetailTask.url,
                                    arguments: schedule_2);
                              },
                              child: listItem2(schedule_2!));
                        },
                        itemCount: 1,
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text(
                          snapshot.error.toString(),
                        ),
                      );
                    } else {
                      return Text('No Schedule');
                    }
                  }
                },
              ),
              SizedBox(
                height: 24,
              ),
              Text(
                "All Results",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Color(0xFF2F2F2F).withOpacity(0.7)),
              ),
              SizedBox(
                height: 4,
              ),
              FutureBuilder(
                  future: _schedule,
                  builder: (context, AsyncSnapshot<SchedulesModel> snapshot) {
                    var state = snapshot.connectionState;
                    if (snapshot.hasData) {
                      allTask = snapshot.data!.data.length;

                      return Row(
                        children: [
                          Flexible(
                            flex: 1,
                            child: BoxCard(
                              nameTask: "All Tasks",
                              totalTask: allTask,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Flexible(
                            flex: 1,
                            child: BoxCard(
                              nameTask: "Completed Task\n(coming soon)",
                              totalTask: 0,
                            ),
                          ),
                        ],
                      );
                    } else {
                      return Text("");
                    }
                  }),
              SizedBox(
                height: 9,
              ),
              FutureBuilder(
                future: _payments,
                builder: (context, AsyncSnapshot<PaymentsModel> snapshot) {
                  var state = snapshot.connectionState;
                  if (state != ConnectionState.done) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          var payment = snapshot.data!.data[index];
                          allPayment++;
                          if (payment.status == "done" &&
                              allPayment <= snapshot.data!.data.length) {
                            paymentDone++;
                          }
                          if (allPayment > snapshot.data!.data.length) {
                            allPayment--;
                          }

                          if (allPayment == snapshot.data!.data.length) {
                            return Row(
                              children: [
                                Flexible(
                                  flex: 1,
                                  child: BoxCard(
                                    nameTask: "Payment Pending",
                                    totalTask: allPayment,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Flexible(
                                  flex: 1,
                                  child: BoxCard(
                                    nameTask: "Payment\nCompleted",
                                    totalTask: paymentDone,
                                  ),
                                ),
                              ],
                            );
                          } else {
                            return SizedBox();
                          }
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
                      return SizedBox();
                    }
                  }
                },
              )
            ],
          ),
        )),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _launchURLApp,
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

  Widget listItem2(ScheduleModel view) {
    String tanggal = DateFormat.yMd().format(view.tanggal);
    return Container(
      margin: EdgeInsets.only(top: 4),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
      width: double.infinity,
      height: 121,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15)),
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
                    view.jam,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                  ),
                  Text(
                    DateFormat.yMd().format(view.tanggal),
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              Text(
                view.namaKegiatan,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
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
    );
  }

  Widget listItem(ScheduleModel view) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16),
      height: 100,
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
                view.namaClient,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
              Row(
                children: [
                  Text(
                    "Wedding Party",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w300),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                ],
              )
            ],
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.end,
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   children: [
          //     SvgPicture.asset("assets/icons/people.svg"),
          //     SizedBox(
          //       width: 8,
          //     ),
          //     Text(
          //       "7",
          //       style:
          //           TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
          //     )
          //   ],
          // ),
        ],
      ),
    );
  }
}
