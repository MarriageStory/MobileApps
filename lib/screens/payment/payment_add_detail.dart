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
import 'package:wedding_planner/model/paymentModel.dart';
import 'package:wedding_planner/service/paymentService.dart';
import 'package:wedding_planner/service/paymentDetailService.dart';
import 'package:wedding_planner/navbar/navbar.dart';

class AddDetailPayment extends StatefulWidget {
  static final url = "/payment-add-detail";
  const AddDetailPayment({Key? key}) : super(key: key);

  get hintText => null;

  @override
  State<AddDetailPayment> createState() => _AddDetailPaymentState();
}

class _AddDetailPaymentState extends State<AddDetailPayment> {
  //controller detail payment
  TextEditingController _paymentForController = TextEditingController();
  TextEditingController _bayarController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  TextEditingController _timeController = TextEditingController();
  TextEditingController _detailController = TextEditingController();
  //controller payment
  TextEditingController _namePaymentController = TextEditingController();
  TextEditingController _amountPaymentController = TextEditingController();
  TextEditingController _datePaymentController = TextEditingController();
  TextEditingController _terbayarController = TextEditingController();
  TextEditingController _statusPaymentController = TextEditingController();
  //date & time
  DateTime tanggal = DateTime.now();
  TimeOfDay time = TimeOfDay.now();
  //total pembayaran
  int total = 0;
  //inisialisasi
  bool inisialisasi = false;
  //cek date & time
  bool cekDate = false;
  bool cekTime = false;

  void showTime() {
    showTimePicker(context: context, initialTime: TimeOfDay.now())
        .then((value) {
      setState(() {
        cekTime = true;
        _timeController.text = value!.format(context).toString();
      });
    });
  }

  final TextStyle valueStyle = GoogleFonts.poppins(
    fontSize: 14,
  );
  final TextStyle valueStyleBefore =
      GoogleFonts.poppins(fontSize: 14, color: Color(0xFF8d8d8d));

  Future<Null> _selectDate(BuildContext context) async {
    // Initial DateTime FIinal Picked
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: tanggal,
        firstDate: DateTime(2015),
        lastDate: DateTime(2101));

    if (picked != null)
      setState(() {
        _dateController.text = picked.toString();
        tanggal = picked;
        cekDate = true;
      });
  }

  @override
  Widget build(BuildContext context) {
    final payments payment =
        ModalRoute.of(context)!.settings.arguments as payments;

    if (payment != null && inisialisasi == false) {
      _namePaymentController.text = payment.namaClient;
      _amountPaymentController.text = payment.tunaiKeseluruhan;
      _dateController.text = payment.tanggal.toString();
      _terbayarController.text = payment.terbayar;
      _statusPaymentController.text = payment.keterangan;

      inisialisasi = true;
    }

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
                        "Add Detail Payment",
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
                    labelText: "Paid for",
                    controller: _paymentForController,
                    valueHintStyle: valueStyle,
                    hintText: "Paid for",
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 30, right: 16, left: 16),
                  child: RoundedInputFieldForm(
                    valueLabelStyle: valueStyle,
                    labelText: "Amount",
                    controller: _bayarController,
                    valueHintStyle: valueStyle,
                    hintText: "Amount",
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 30, right: 16, left: 16),
                  child: RoundedInputFieldForm(
                    valueLabelStyle: valueStyle,
                    labelText: "Detail Payment",
                    controller: _detailController,
                    valueHintStyle: valueStyle,
                    hintText: "Detail Payment",
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 30, right: 16, left: 16),
                  child: Column(children: [
                    dateTime(
                      // labelText: "Date",
                      valueText: cekDate != false
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
                      // labelText: "Time",
                      // valueText: time.format(context),
                      valueText:
                          cekTime != false ? _timeController.text : "Time",
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
                          //data detail payment
                          Map<String, dynamic> body = {
                            'payment_for': _paymentForController.text,
                            'bayar': _bayarController.text,
                            'tanggal': _dateController.text,
                            'detail': _detailController.text,
                            'id_payment': payment.id.toString(),
                            'jam': _timeController.text,
                          };
                          await PaymentDetailService()
                              .createPaymentDetail(body);

                          total = int.parse(_terbayarController.text) +
                              int.parse(_bayarController.text);
                          if (total ==
                              int.parse(_amountPaymentController.text)) {
                            _statusPaymentController.text = "done";
                          }

                          Map<String, dynamic> body1 = {
                            'nama_client': _namePaymentController.text,
                            'tunai_keseluruhan': _amountPaymentController.text,
                            'tanggal': _dateController.text,
                            'terbayar': total.toString(),
                            'keterangan': _statusPaymentController.text,
                          };

                          await PaymentService()
                              .updatePayment(body1, payment.id)
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
        ),
      ),
    );
  }
}
