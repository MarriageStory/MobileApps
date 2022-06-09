import 'package:flutter/material.dart';
import 'package:wedding_planner/screens//task/task_screen.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:wedding_planner/components/date.dart';
import 'package:wedding_planner/service/scheduleService.dart';
import 'package:intl/intl.dart';

class TaskForm extends StatefulWidget {
  const TaskForm({Key? key}) : super(key: key);

  @override
  State<TaskForm> createState() => _TaskFormState();
}

class _TaskFormState extends State<TaskForm> {
  TextEditingController _nameClientController = TextEditingController();
  TextEditingController _nameKegiatanController = TextEditingController();
  TextEditingController _detailKegiatanController = TextEditingController();
  TextEditingController _tanggalController = TextEditingController();
  TextEditingController _jamController = TextEditingController();
  TextEditingController _tempatController = TextEditingController();

  TimeOfDay time = TimeOfDay.now();
  void showTime() {
    showTimePicker(context: context, initialTime: TimeOfDay.now())
        .then((value) {
      setState(() {
        _jamController.text = value!.format(context).toString();
      });
    });
  }

  DateTime tanggal = DateTime.now();
  final TextStyle valueStyle = TextStyle(fontSize: 16.0);
  Future<Null> _selectDate(BuildContext context) async {
    // Initial DateTime FIinal Picked
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: tanggal,
        firstDate: DateTime(2015),
        lastDate: DateTime(2101));

    if (picked != null && picked != tanggal)
      setState(() {
        _tanggalController.text = picked.toString();
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
                                  builder: (context) => const TaskScreen()),
                            );
                          },
                          icon: const Icon(Icons.arrow_back,
                              color: Colors.black)),
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Client Name",
                      ),
                      TextField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        controller: _nameClientController,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 30, right: 16, left: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Task Name",
                      ),
                      TextField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        controller: _nameKegiatanController,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 30, right: 16, left: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Detail Task",
                      ),
                      TextField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        controller: _detailKegiatanController,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 30, right: 16, left: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Place",
                      ),
                      TextField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        controller: _tempatController,
                      ),
                    ],
                  ),
                ),
                // Container(
                //   margin: const EdgeInsets.only(top: 30, right: 16, left: 16),
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       Text(
                //         "Date",
                //       ),
                //       TextField(
                //         decoration: const InputDecoration(
                //           border: OutlineInputBorder(),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                Container(
                  margin: const EdgeInsets.only(top: 20, right: 16, left: 16),
                  child: Column(children: [
                    Divider(
                      color: Colors.black,
                    ),
                    DateDropDown(
                      labelText: "tanggal kegiatan",
                      valueText: DateFormat.yMd().format(tanggal),
                      valueStyle: valueStyle,
                      onPressed: () {
                        _selectDate(context);
                      },
                    ),
                  ]),
                ),
                // Container(
                //   margin: const EdgeInsets.only(top: 30, right: 16, left: 16),
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       Text(
                //         "Time",
                //       ),
                //       TextField(
                //         decoration: const InputDecoration(
                //           border: OutlineInputBorder(),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                Container(
                  margin: const EdgeInsets.only(top: 20, right: 16, left: 16),
                  child: Column(children: [
                    Divider(
                      color: Colors.black,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(children: [
                          Text("Jam"),
                          IconButton(
                            onPressed: showTime,
                            icon: const Icon(Icons.timer),
                          ),
                        ]),
                        Text("\n\n" + _jamController.text),
                      ],
                    ),
                    Divider(
                      color: Colors.black,
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
                            style: TextStyle(color: Colors.black),
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
                            'nama_kegiatan': _nameKegiatanController.text,
                            'detail_kegiatan': _detailKegiatanController.text,
                            'tanggal': _tanggalController.text,
                            'jam': _jamController.text,
                            'tempat': _tempatController.text,
                            'nama_client': _nameClientController.text,
                          };

                          await ScheduleService()
                              .createSchedule(body)
                              .then((value) {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return TaskScreen();
                            }));
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
