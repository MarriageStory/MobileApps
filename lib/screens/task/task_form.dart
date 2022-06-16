import 'dart:math';
import 'package:flutter/material.dart';
//pubspec
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:date_time_picker/date_time_picker.dart';
//component
import 'package:wedding_planner/components/dateTime.dart';
import 'package:wedding_planner/components/rounded_input_field_form.dart';
//navbar
import 'package:wedding_planner/navbar/navbar.dart';
//screen
import 'package:wedding_planner/screens//task/task_screen.dart';
import 'package:wedding_planner/service/schedule_service.dart';

class TaskForm extends StatefulWidget {
  static final url = "/task-form";
  const TaskForm({Key? key}) : super(key: key);

  @override
  State<TaskForm> createState() => _TaskFormState();
}

class _TaskFormState extends State<TaskForm> {
  //controller
  TextEditingController _nameClientController = TextEditingController();
  TextEditingController _nameTaskController = TextEditingController();
  TextEditingController _detailTaskController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  TextEditingController _placeController = TextEditingController();
  TextEditingController _timeController = TextEditingController();
  //pengecekan date & time
  bool cekJam = false;
  bool cekTgl = false;
  //date & time
  DateTime tanggal = DateTime.now();
  TimeOfDay time = TimeOfDay.now();
  //style
  final TextStyle valueStyle = GoogleFonts.poppins(
    fontSize: 14,
  );

  void showTime() {
    showTimePicker(context: context, initialTime: TimeOfDay.now())
        .then((value) {
      setState(() {
        cekJam = true;
        _timeController.text = value!.format(context).toString();
      });
    });
  }

  Future<Null> _selectDate(BuildContext context) async {
    // Initial DateTime FIinal Picked
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: tanggal,
        firstDate: DateTime(2015),
        lastDate: DateTime(2101));

    if (picked != null && picked != tanggal)
      setState(() {
        cekTgl = true;
        _dateController.text = picked.toString();
        tanggal = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  alignment: AlignmentDirectional.topCenter,
                  padding: EdgeInsets.symmetric(vertical: 20),
                  color: Colors.white,
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BaseScreen(index: 1)),
                            );
                          },
                          icon: const Icon(Icons.arrow_back,
                              color: Colors.black)),
                      SizedBox(
                        width: 80,
                      ),
                      const Text(
                        "Add Task",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 30, right: 16, left: 16),
                  child: RoundedInputFieldForm(
                    valueLabelStyle: valueStyle,
                    labelText: "Client Name",
                    controller: _nameClientController,
                    valueHintStyle: valueStyle,
                    hintText: "Client Name",
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 30, right: 16, left: 16),
                  child: RoundedInputFieldForm(
                    valueLabelStyle: valueStyle,
                    labelText: "Task Name",
                    controller: _nameTaskController,
                    valueHintStyle: valueStyle,
                    hintText: "Task Name",
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 30, right: 16, left: 16),
                  child: RoundedInputFieldForm(
                    valueLabelStyle: valueStyle,
                    labelText: "Detail Task",
                    controller: _detailTaskController,
                    valueHintStyle: valueStyle,
                    hintText: "Detail Task",
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 30, right: 16, left: 16),
                  child: RoundedInputFieldForm(
                    valueLabelStyle: valueStyle,
                    labelText: "Place",
                    controller: _placeController,
                    valueHintStyle: valueStyle,
                    hintText: "Place",
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 30, right: 16, left: 16),
                  child: Column(children: [
                    dateTime(
                      // labelText: "Date",
                      valueText: cekTgl != false
                          ? DateFormat.yMd().format(tanggal)
                          : "Date",
                      valueStyle: valueStyle,
                      onPressed: () {
                        _selectDate(context);
                      },
                    ),
                  ]),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 30, right: 16, left: 16),
                  child: Column(children: [
                    dateTime(
                      // labelText: "Date",
                      valueText:
                          cekJam != false ? _timeController.text : "Time",
                      valueStyle: valueStyle,
                      onPressed: () {
                        showTime();
                      },
                    ),
                  ]),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10, right: 20),
                  child: Column(
                    children: <Widget>[
                      InkWell(
                        child: Container(
                          height: 45,
                          padding: EdgeInsets.symmetric(vertical: 10),
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.only(
                              right: 16, left: 16, top: 20),
                          child: Text(
                            "save",
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [
                                Color(0xFFFE6A7E).withOpacity(0.65),
                                Color(0xFFFE6A7E),
                              ],
                            ),
                          ),
                        ),
                        onTap: () async {
                          Map<String, dynamic> body = {
                            'nama_kegiatan': _nameTaskController.text,
                            'detail_kegiatan': _detailTaskController.text,
                            'tanggal': _dateController.text,
                            'tempat': _placeController.text,
                            'nama_client': _nameClientController.text,
                            'jam': _timeController.text,
                            'status': "pending",
                          };

                          await ScheduleService.createNewSchedule(body)
                              .then((value) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BaseScreen(index: 1)),
                            );
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        'You have successfully create a scedule')));
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
