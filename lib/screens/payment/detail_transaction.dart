import 'dart:async';
import 'package:wedding_planner/components/formatAngka.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:wedding_planner/model/paymentDetailModel.dart';
import 'package:wedding_planner/model/paymentModel.dart';
import 'package:wedding_planner/navbar/navbar.dart';
import 'package:wedding_planner/screens/payment/payment_screen.dart';
import 'package:wedding_planner/service/paymentDetailService.dart';

class detailTransaction extends StatefulWidget {
  const detailTransaction({Key? key}) : super(key: key);

  @override
  State<detailTransaction> createState() => _detailTransactionState();
}

class _detailTransactionState extends State<detailTransaction> {
  late Future<PaymentDetail> _payments;
  int id = 0;
  int totalBayar = 0;
  int unpaid = 0;
  int totalData = 0;
  bool cek = false;

  @override
  void initState() {
    super.initState();
    _payments = PaymentDetailService().getAllPaymentDetail();
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
    final payments payment =
        ModalRoute.of(context)!.settings.arguments as payments;

    String tanggalPayment = DateFormat.yMd().format(payment.tanggal);
    unpaid = int.parse(payment.tunaiKeseluruhan);

    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              height: 70,
              child: Row(
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
                  SizedBox(width: 50),
                  Text(
                    "Detail Payment",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                  SizedBox(width: 50),
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const PaymentPage(),
                            ));
                      },
                      icon: Icon(Icons.list))
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            FutureBuilder(
              future: _payments,
              builder: (context, AsyncSnapshot<PaymentDetail> snapshot) {
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
                        var payment_detail = snapshot.data!.data[index];

                        return SizedBox(
                          child: payment_detail.idPayment == payment.id
                              ? listItem(payment_detail)
                              : SizedBox(),
                        );
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
                    return Text('');
                  }
                }
              },
            ),
          ]),
        ),
      )),
    );
  }

  Widget listItem(PaymentDetails DetailTransaction) {
    String tanggal = DateFormat.yMd().format(DetailTransaction.tanggal);
    cek = true;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16),
      height: 240,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text(
              "Paid for " + DetailTransaction.paymentFor,
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
            ),
          ),
          SizedBox(height: 10),
          Container(
            child: Text(
              formatAngka.convertToIdr(int.parse(DetailTransaction.bayar), 2),
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 27),
            ),
          ),
          SizedBox(height: 10),
          Container(
            child: Text(
              "Date :",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
            ),
          ),
          Container(
            child: Text(
              tanggal,
              style: TextStyle(fontSize: 16),
            ),
          ),
          Container(
            child: Text(
              "Detail : ",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
            ),
          ),
          Container(
            child: Text(
              DetailTransaction.detail,
              style: TextStyle(fontSize: 16),
            ),
          )
        ],
      ),
    );
  }
}
