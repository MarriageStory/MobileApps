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

  @override
  Widget build(BuildContext context) {
    final PaymentModel payment =
        ModalRoute.of(context)!.settings.arguments as PaymentModel;

    String tanggalPayment = DateFormat.yMd().format(payment.tanggal);

    print(payment.paymentDetails.length);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 70,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BaseScreen(index: 2)),
                            );
                          },
                          child: Icon(Icons.arrow_back)),
                      Text(
                        "Detail Payment",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 18),
                      ),
                      IconButton(
                          onPressed: () {
                            Navigator.pushNamed(context, "/payment-edit",
                                arguments: payment);
                          },
                          icon: Icon(Icons.edit))
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(16),
                  height: 115,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/bg.png"),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                payment.namaClient,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(width: 120),
                              Text(
                                payment.keterangan,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                tanggalPayment,
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300),
                              ),
                              Text(
                                formatAngka.convertToIdr(
                                    int.parse(
                                        payment.tunaiKeseluruhan.toString()),
                                    2),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600),
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 25),
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
                                    // gradient: LinearGradient(
                                    //   begin: Alignment.topRight,
                                    //   end: Alignment.bottomLeft,
                                    //   colors: [
                                    //     Color(0xFF8CDA8A).withOpacity(0.65),
                                    //     Color(0xFFFFFFFF),
                                    //   ],
                                    // ),
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
