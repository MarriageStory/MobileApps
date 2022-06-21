// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:wedding_planner/components/rounded_button.dart';
import 'package:wedding_planner/components/text_field_container.dart';
import 'package:wedding_planner/components/rounded_input_field_form.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:wedding_planner/components/dateTime.dart';
import 'package:wedding_planner/model/payment_model.dart';
import 'package:wedding_planner/navbar/navbar.dart';
import 'package:wedding_planner/service/payment_service.dart';

class EditPayment extends StatefulWidget {
  static final url = "/payment-edit";
  const EditPayment({Key? key}) : super(key: key);

  get hintText => null;

  @override
  State<EditPayment> createState() => _EditPaymentState();
}

class _EditPaymentState extends State<EditPayment> {
  //controller
  TextEditingController _namePaymentController = TextEditingController();
  TextEditingController _amountPaymentController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  TextEditingController _statusPaymentController = TextEditingController();
  //pengecekan date
  bool cekTgl = false;
  //tanggal
  DateTime tanggal = DateTime.now();
  //style
  final TextStyle valueStyle = GoogleFonts.poppins(
    fontSize: 14,
  );
  //cek inisialisasi
  bool inisialisasi = false;

  Future<Null> _selectDate(BuildContext context, DateTime date) async {
    // Initial DateTime FIinal Picked
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: date,
        firstDate: DateTime(2015),
        lastDate: DateTime(2101));

    if (picked != null)
      setState(() {
        cekTgl = true;
        tanggal = picked;
        _dateController.text = picked.toString();
      });
  }

  @override
  Widget build(BuildContext context) {
    final PaymentModel payment =
        ModalRoute.of(context)!.settings.arguments as PaymentModel;

    if (payment != null && inisialisasi == false) {
      _namePaymentController.text = payment.namaClient;
      _amountPaymentController.text = payment.tunaiKeseluruhan.toString();
      _dateController.text = payment.tanggal.toString();
      _statusPaymentController.text = payment.status;
      tanggal = payment.tanggal;

      inisialisasi = true;
    }
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
                    Icon(Icons.arrow_back),
                    Text(
                      'Edit Payment',
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
                          valueText: DateFormat.yMd().format(tanggal),
                          valueStyle: valueStyle,
                          onPressed: () {
                            _selectDate(context, payment.tanggal);
                          },
                        ),
                      ]),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    //Status
                    // Container(
                    //     alignment: Alignment.centerLeft,
                    //     margin:
                    //         const EdgeInsets.only(top: 30, right: 16, left: 16),
                    //     child: Text("Status")),
                    // Container(
                    //   margin:
                    //       const EdgeInsets.only(top: 15, right: 16, left: 16),
                    //   child: ToggleSwitch(
                    //     minWidth: 120.0,
                    //     minHeight: 40.0,
                    //     initialLabelIndex: 0,
                    //     // payment.status == "done" ? 1 : 0,
                    //     activeFgColor: Colors.white,
                    //     activeBgColor: [Colors.pink.shade300],
                    //     inactiveBgColor: Colors.white,
                    //     inactiveFgColor: Colors.black,
                    //     borderWidth: 1,
                    //     borderColor: [Color.fromARGB(165, 241, 66, 101)],
                    //     totalSwitches: 2,
                    //     labels: ['Pending', 'Done'],
                    //     onToggle: (index) {
                    //       if (index == 0) {
                    //         setState(() {
                    //           _statusPaymentController.text = "pending";
                    //         });
                    //       } else {
                    //         setState(() {
                    //           _statusPaymentController.text = "done";
                    //         });
                    //       }

                    //       print('switched to: $index');
                    //     },
                    //   ),
                    // ),


                    //Status
                    Container(
                        alignment: Alignment.centerLeft,
                        margin:
                            const EdgeInsets.only(top: 15, right: 16, left: 16),
                        child: Text("Status")),
                    Container(
                      margin:
                          const EdgeInsets.only(top: 8, right: 16, left: 16),
                      child: ToggleSwitch(
                        minWidth: 150,
                        minHeight: 40.0,
                        initialLabelIndex: payment.status == "done" ? 1 : 0,
                        activeFgColor: Colors.white,
                        activeBgColor: [Color(0xFFFE6A7E)],
                        inactiveBgColor: Colors.white,
                        inactiveFgColor: Colors.black,
                        borderWidth: 1,
                        borderColor: [Color.fromARGB(165, 241, 66, 101)],
                        totalSwitches: 2,
                        labels: ['Pending', 'Done'],
                        onToggle: (index) {
                          if (index == 0) {
                            _statusPaymentController.text = "pending";
                          } else {
                            _statusPaymentController.text = "done";
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
                              // if (int.parse(_amountPaymentController.text) >
                              //     int.parse(payment.terbayar)) {
                              //   _statusPaymentController.text = "pending";
                              // }

                              Map<String, dynamic> body = {
                                'nama_client': _namePaymentController.text,
                                'tunai_keseluruhan':
                                    _amountPaymentController.text,
                                'tanggal': _dateController.text,
                                'status': _statusPaymentController.text,
                                'terbayar': payment.terbayar,
                              };

                              await PaymentService.updatePayment(
                                      payment.id, body)
                                  .then((value) {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return BaseScreen(index: 2);
                                }));
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            'You have successfully update a payment')));
                              });
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
