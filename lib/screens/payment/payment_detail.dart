import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wedding_planner/screens/payment/payment_screen.dart';

class detailPayment extends StatefulWidget {
  const detailPayment({Key? key}) : super(key: key);

  @override
  State<detailPayment> createState() => _detailPaymentState();
}

class _detailPaymentState extends State<detailPayment> {
  @override
  Widget build(BuildContext context) {
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
                    children: [
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const PaymentPage()),
                            );
                          },
                          child: Icon(Icons.arrow_back)),
                      SizedBox(width: 50),
                      Text(
                        "Detail Payment",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 18),
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
                          Text(
                            "Groom & Bride",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          ),
                          Row(
                            children: [
                              Text(
                                "Wedding date",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                "7 April 2023",
                                style: TextStyle(
                                    color: Colors.white,
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
                Container(
                  child: Row(
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
                              "Already Paid",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 15),
                            ),
                          ),
                          Container(
                            child: Text(
                              "Rp 10.000.000",
                              style: TextStyle(
                                  fontWeight: FontWeight.w300, fontSize: 15),
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
                              "Already Paid",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 15),
                            ),
                          ),
                          Container(
                            child: Text(
                              "Rp 10.000.000",
                              style: TextStyle(
                                  fontWeight: FontWeight.w300, fontSize: 15),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Container(
                      child: Text("Transactions"),
                    ),
                    SizedBox(width: 200),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const PaymentPage()),
                              );
                            },
                            child: Icon(Icons.plumbing)),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: ListTile(
                        leading: FlutterLogo(),
                        title: Text(
                          "vdgahvhdj",
                          style: TextStyle(color: Colors.black),
                        ),
                        subtitle: Text('Ini Subtitle'),
                        trailing: Text('Ini belakang'),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: ListTile(
                        leading: FlutterLogo(),
                        title: Text(
                          "vdgahvhdj",
                          style: TextStyle(color: Colors.black),
                        ),
                        subtitle: Text('Ini Subtitle'),
                        trailing: Text('Ini belakang'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
