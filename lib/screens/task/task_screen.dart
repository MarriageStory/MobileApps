import 'dart:async';
import 'package:flutter/material.dart';
import 'package:wedding_planner/model/schedule_model.dart';
import 'package:wedding_planner/screens/task/task_form.dart';
import 'package:wedding_planner/screens/task/task_detail.dart';
import 'package:intl/intl.dart';
import 'package:wedding_planner/service/schedule_service.dart';

class TaskScreen extends StatefulWidget {
  static const routeName = "/task-page";
  const TaskScreen({Key? key}) : super(key: key);

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  late Future<SchedulesModel> _schedule;
  int id = 0;
  int allTask = 0;
  int totalData = 0;

  @override
  void initState() {
    super.initState();
    try {
      _schedule = ScheduleService.getAllSchedules();
    } catch (e) {
      print(e);
    }
  }

  void refreshData() {
    id++;
  }

  FutureOr onGoBack(dynamic value) {
    refreshData();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final bottomNavigation = MediaQuery.of(context).viewInsets.bottom;

    return Scaffold(
      backgroundColor: Color(0xFFF6F6F6),
      // body: Stack(
      //   children: <Widget>[
      //     //AppBar Background
      //     Container(
      //         height: MediaQuery.of(context).size.height * 0.2,
      //         decoration: const BoxDecoration(
      //           image: DecorationImage(
      //             image: AssetImage("assets/images/main-top3.png"),
      //             fit: BoxFit.fill,
      //           ),
      //         )),
      //     //TaskStatus
      //     Container(
      //       height: 200,
      //       child: Card(
      //           elevation: 20.0,
      //           margin:
      //               const EdgeInsets.only(left: 15.0, right: 15.0, top: 100.0),
      //           child: ListView(
      //               padding: const EdgeInsets.only(
      //                   top: 20.0, left: 20.0, right: 18.0, bottom: 5.0),
      //               children: <Widget>[
      //                 FutureBuilder(
      //                   future: _schedule,
      //                   builder: (context, AsyncSnapshot<Schedule> snapshot) {
      //                     var state = snapshot.connectionState;
      //                     if (snapshot.hasData) {
      //                       allTask = snapshot.data!.data.length;

      //                       return Row(
      //                         children: <Widget>[
      //                           Expanded(
      //                             child:
      //                             Text("Ainul"),
      //                           ),
      //                           Expanded(
      //                             child:
      //                               Text("Ainul"),
      //                           )
      //                         ],
      //                       );
      //                     } else {
      //                       return Text('');
      //                     }
      //                   },
      //                 ),
      //               ])),
      //     ),
      //   ],
      // ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    height: 140,
                    width: size.width,
                    padding: EdgeInsets.symmetric(vertical: 20),
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                            colors: [
                          Color(0xFFFC9DA1),
                          Color(0xFFFE6A7E),
                        ])
                        // image: DecorationImage(
                        //     image:
                        //         AssetImage("assets/images/bg-taskScreen.png"),
                        //     fit: BoxFit.fill
                        //       )
                        ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const TaskScreen()),
                              );
                            },
                            icon: const Icon(
                              Icons.menu,
                              color: Colors.white,
                            )),
                        const Text(
                          "Checklist",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TaskForm()),
                              );
                            },
                            icon: const Icon(Icons.add, color: Colors.white))
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 40, right: 20, left: 20),
                    // margin: const EdgeInsets.symmetric(vertical: 50, horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Task in progress',
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.w500),
                        ),
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              "Sort by",
                              style: TextStyle(color: Colors.grey[600]),
                            ))
                      ],
                    ),
                  ),

                  //pembatas
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
                              var schedule = snapshot.data?.data[index];
                              return InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(context, DetailTask.url,
                                        arguments: schedule);
                                  },
                                  child: listItem(schedule!));
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
                          return Text('No Schedule');
                        }
                      }
                    },
                  ),
                ],
              ),
              FutureBuilder(
                future: _schedule,
                builder: (context, AsyncSnapshot<SchedulesModel> snapshot) {
                  var state = snapshot.connectionState;
                  if (snapshot.hasData) {
                    allTask = snapshot.data!.data.length;

                    return Positioned(
                      top: 80,
                      left: 0,
                      right: 0,
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 24),
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: IntrinsicHeight(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 20.0),
                                child: Column(
                                  children: [
                                    Text(
                                      "coming soon",
                                    ),
                                    Text("All Tasks"),
                                  ],
                                ),
                              ),
                              const VerticalDivider(
                                width: 20,
                                thickness: 1,
                                indent: 4,
                                endIndent: 4,
                                color: Color(0xFFD9D9D9),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 20.0),
                                child: Column(
                                  children: [
                                    Text(allTask.toString()),
                                    Text("Completed Tasks"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  } else {
                    return Text('');
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget listItem(ScheduleModel view) {
    String tanggal = DateFormat.yMd().format(view.tanggal);

    return Card(
      color: Colors.white,
      child: SizedBox(
        height: 80,
        width: 335,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      tanggal,
                      style: TextStyle(
                        color: Colors.grey[500],
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      view.namaKegiatan,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 120,
              ),
              const VerticalDivider(
                  width: 10,
                  thickness: 1,
                  indent: 10,
                  endIndent: 10,
                  color: Color(0xFFD9D9D9)),
              Expanded(
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    view.tanggal.toString(),
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFFE6A7E),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
