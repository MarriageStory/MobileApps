import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wedding_planner/model/payment_model.dart';
import 'package:wedding_planner/screens/payment/payment_screen.dart';
import 'package:wedding_planner/components/formatAngka.dart';
import 'package:intl/intl.dart';
import 'package:wedding_planner/navbar/navbar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wedding_planner/screens/payment/payment_screen.dart';
import 'package:wedding_planner/screens/payment/payment_edit.dart';
import 'package:wedding_planner/screens/payment/payment_add_detail.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wedding_planner/service/payment_service.dart';
import 'package:url_launcher/url_launcher.dart';

class detailPayment extends StatefulWidget {
  static final url = "/detail-payment";
  const detailPayment({Key? key}) : super(key: key);

  @override
  State<detailPayment> createState() => _detailPaymentState();
}

class _detailPaymentState extends State<detailPayment> {
  int id = 0;
  int totalBayar = 0;
  int unpaid = 0;
  int totalData = 0;
  bool cek = false;

  launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final PaymentModel payment =
        ModalRoute.of(context)!.settings.arguments as PaymentModel;

    String tanggalPayment = DateFormat.yMd().format(payment.tanggal);

    print(payment.paymentDetails.length);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  // color: Colors.blue,
                  height: 70,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        color: Colors.blue,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BaseScreen(index: 2)),
                            );
                          },
                          child: const Icon(
                            Icons.arrow_back,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                      const Text(
                        "Detail Payment",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.black87),
                      ),
                      GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, "/payment-edit",
                                arguments: payment);
                          },
                          child: const Icon(
                            Icons.edit,
                            color: Colors.black87,
                          )),
                    ],
                  ),
                ),
                
                //card payment status
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(
                          top: 15, bottom: 15, left: 25, right: 25),
                      height: 130,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          gradient: const LinearGradient(
                              begin: Alignment.bottomLeft,
                              end: Alignment.topRight,
                              colors: [
                                Color(0xFFFC9DA1),
                                Color(0xFFFE6A7E),
                              ]),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 3,
                              blurRadius: 3,
                              offset: Offset(0, 0),
                            ),
                          ]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          SizedBox(
                            height: 100,
                            width: size.width * 0.5,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  payment.namaClient,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700),
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                Text(
                                  tanggalPayment,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  formatAngka.convertToIdr(
                                      int.parse(
                                          payment.tunaiKeseluruhan.toString()),
                                      2),
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            alignment: Alignment.topRight,
                            width: size.width * 0.2,
                            height: 100,
                            child: Text(
                              payment.status.toUpperCase(),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    var payment_detail = payment.paymentDetails[index];
                    // if (payment_detail.idPayment == payment.id) {
                    //   totalBayar += int.parse(payment_detail.bayar);
                    //   unpaid -= int.parse(payment_detail.bayar);
                    //   totalData++;
                    // }
                    if (totalData < payment.paymentDetails.length) {
                      return SizedBox();
                    } else {
                      return Row(
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 45,
                                height: 45,
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topRight,
                                      end: Alignment.bottomLeft,
                                      colors: [
                                        Color(0xFF8CDA8A).withOpacity(0.65),
                                        Color(0xFFFFFFFF),
                                      ],
                                    ),
                                    color: Color(0xFF8CDA8A).withOpacity(0.65),
                                    borderRadius: BorderRadius.circular(15)),
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Text(
                                  "Already Paid",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15),
                                ),
                              ),
                              Container(
                                child: Text(
                                  formatAngka.convertToIdr(totalBayar, 2),
                                  style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 15),
                                ),
                              )
                            ],
                          ),
                          SizedBox(width: 20),
                          Row(
                            children: [
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
                          SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Text(
                                  "Unpaid",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15),
                                ),
                              ),
                              Container(
                                child: Text(
                                  formatAngka.convertToIdr(unpaid, 2),
                                  style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 15),
                                ),
                              )
                            ],
                          ),
                        ],
                      );
                    }
                  },
                  itemCount: payment.paymentDetails.length,
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text("Transactions"),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "/payment-add-detail",
                              arguments: payment);
                        },
                        child: Icon(Icons.add)),
                  ],
                ),
                payment.paymentDetails.length != 0
                    ? ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          var payment_detail = payment.paymentDetails[index];

                          return listItem(payment_detail);
                        },
                        itemCount: payment.paymentDetails.length,
                      )
                    : Container(
                        margin: const EdgeInsets.only(top: 20),
                        child: const Center(
                          child: Text("Detail Pembayaran Masih Kosong"),
                        ),
                      ),
                Container(
                  margin: const EdgeInsets.only(top: 10, right: 20),
                  child: Row(
                    children: <Widget>[
                      InkWell(
                          child: Container(
                            height: 45,
                            padding: EdgeInsets.symmetric(vertical: 10),
                            // width: MediaQuery.of(context).size.width,
                            width: 150,
                            margin: const EdgeInsets.only(
                                right: 16, left: 16, top: 20),
                            child: Text(
                              "Delete",
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
                            await PaymentService.deletePayment(payment.id)
                                .then((value) {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return BaseScreen(index: 2);
                              }));
                            });
                          }),
                      InkWell(
                          child: Container(
                            height: 45,
                            padding: EdgeInsets.symmetric(vertical: 10),
                            // width: MediaQuery.of(context).size.width,
                            width: 150,
                            margin: const EdgeInsets.only(
                                right: 16, left: 16, top: 20),
                            child: Text(
                              "payment receipt",
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
                            const url =
                                'https://drive.google.com/drive/folders/1x8Xm3ZZsXvXXshcj3p47pBiNMb0Eqme1?usp=sharing';
                            launchURL(url);
                          }),
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

  Widget listItem(PaymentDetailModel paymentDetail) {
    String tanggal = DateFormat.yMd().format(paymentDetail.tanggal);
    cek = true;

    return Row(
      children: [
        Expanded(
          child: ListTile(
            leading: FlutterLogo(),
            title: Text(
              "Paid for " + paymentDetail.namaPayment,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
            subtitle: Text(tanggal),
            trailing: Text(formatAngka.convertToIdr(
                int.parse(paymentDetail.bayar.toString()), 2)),
          ),
        ),
      ],
    );
  }
}
