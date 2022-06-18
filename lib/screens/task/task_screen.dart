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
  int taskDone = 0;
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    height: 130,
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                            colors: [
                          Color(0xFFFC9DA1),
                          Color(0xFFFE6A7E),
                        ])),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: size.width * 0.3,
                              color: Colors.transparent,
                            ),
                            SizedBox(
                              width: size.width * 0.3,
                              child: const Text(
                                'Checklist',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: size.width * 0.3,
                              child: IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => TaskForm()),
                                    );
                                  },
                                  icon: Icon(Icons.add, color: Colors.white)),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 50, right: 30, left: 30),
                    // margin: const EdgeInsets.symmetric(vertical: 50, horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Task in progress',
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.w600),
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
                              if (schedule!.status == "done") {
                                taskDone++;
                              }
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
                      top: 90,
                      left: 0,
                      right: 0,
                      child: Column(
                        children: [
                          Container(
                            width: size.width * 0.90,
                            padding: const EdgeInsets.only(bottom: 20, top: 20),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    spreadRadius: 3,
                                    blurRadius: 5,
                                    offset: Offset(0, 0),
                                  ),
                                ]),
                            child: IntrinsicHeight(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                    width: size.width * 0.3,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          allTask.toString(),
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Text(
                                          "All Tasks",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: Colors.grey.shade500),
                                        ),
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
                                  SizedBox(
                                    width: size.width * 0.3,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "coming soon",
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Text(
                                          "Completed Tasks",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: Colors.grey.shade500),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
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
    Size size = MediaQuery.of(context).size;
    String tanggal = DateFormat.yMd().format(view.tanggal);
    

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: size.width * 0.90,
          height: 80,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 3,
                  blurRadius: 5,
                  offset: Offset(0, 0),
                ),
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: size.width * 0.6,
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tanggal,
                      style: TextStyle(
                        color: Colors.grey[500],
                      ),
                    ),
                    Text(
                      view.namaKegiatan,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.center,
                height: 80,
                width: size.width * 0.3,
                decoration: BoxDecoration(
                  border: Border(
                    left: BorderSide(
                      width: 1,
                      color: Color(0xFFFE6A7E).withOpacity(0.3),
                    ),
                  ),
                ),
                child: Text(
                  view.jam,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFFE6A7E),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 8,
        ),
      ],
    );
  }
}
