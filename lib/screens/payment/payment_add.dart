// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:wedding_planner/components/rounded_input_field_form.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:wedding_planner/components/dateTime.dart';
import 'package:wedding_planner/navbar/navbar.dart';
import 'package:wedding_planner/service/payment_service.dart';

class AddPayment extends StatefulWidget {
  const AddPayment({Key? key}) : super(key: key);

  get hintText => null;

  @override
  State<AddPayment> createState() => _AddPaymentState();
}

class _AddPaymentState extends State<AddPayment> {
  //controller
  TextEditingController _namePaymentController = TextEditingController();
  TextEditingController _amountPaymentController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  TextEditingController _statusPaymentController = TextEditingController();
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
          child: Column(
            children: [
              const SizedBox(
                height: 15.0,
              ),

              //AppBar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        child: Icon(Icons.arrow_back),
                        onTap: () => Navigator.pop(context)),
                    Text(
                      'Add Payment',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 25.0,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30.0,
              ),

              //Form
              Container(
                margin: EdgeInsets.symmetric(horizontal: 25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin:
                          const EdgeInsets.only(top: 30, right: 16, left: 16),
                      child: RoundedInputFieldForm(
                        valueLabelStyle: valueStyle,
                        labelText: "Payment Name",
                        controller: _namePaymentController,
                        valueHintStyle: valueStyle,
                        hintText: "Payment Name",
                      ),
                    ),
                    Container(
                      margin:
                          const EdgeInsets.only(top: 30, right: 16, left: 16),
                      child: RoundedInputFieldForm(
                        valueLabelStyle: valueStyle,
                        labelText: "Amount",
                        controller: _amountPaymentController,
                        valueHintStyle: valueStyle,
                        hintText: "Amount",
                      ),
                    ),
                    Container(
                      margin:
                          const EdgeInsets.only(top: 35, right: 16, left: 16),
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
                    SizedBox(
                      height: 15,
                    ),
                    //Status
                    Container(
                        alignment: Alignment.centerLeft,
                        margin:
                            const EdgeInsets.only(top: 30, right: 16, left: 16),
                        child: Text("Status")),
                    Container(
                      margin:
                          const EdgeInsets.only(top: 15, right: 16, left: 16),
                      child: ToggleSwitch(
                        minWidth: 120.0,
                        minHeight: 40.0,
                        initialLabelIndex: 1,
                        activeFgColor: Colors.white,
                        activeBgColor: [Colors.pink.shade300],
                        inactiveBgColor: Colors.white,
                        inactiveFgColor: Colors.black,
                        borderWidth: 1,
                        borderColor: [Color.fromARGB(165, 241, 66, 101)],
                        totalSwitches: 2,
                        labels: ['Pending', 'Done'],
                        onToggle: (index) {
                          if (index == 0) {
                            setState(() {
                              _statusPaymentController.text = "pending";
                            });
                          } else {
                            setState(() {
                              _statusPaymentController.text = "done";
                            });
                          }

                          print('switched to: $index');
                        },
                      ),
                    ),
                    SizedBox(
                      height: 50.0,
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
                                'nama_client': _namePaymentController.text,
                                'tunai_keseluruhan':
                                    _amountPaymentController.text,
                                'tanggal': _dateController.text,
                                'status': _statusPaymentController.text,
                                'keterangan': _statusPaymentController.text,
                              };

                              try {
                                await PaymentService.createNewPayment(body)
                                    .then((value) {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return BaseScreen(index: 2);
                                  }));
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          backgroundColor: Colors.green,
                                          content: Text(
                                              'You have successfully create a scedule')));
                                });
                              } catch (e) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        backgroundColor: Colors.red,
                                        content: Text('Terjadi Kesalahan !')));
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
