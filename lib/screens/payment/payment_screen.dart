// ignore_for_file: prefer_const_constructors, duplicate_ignore, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import 'components/cards_payment.dart';

class PaymentPage extends StatefulWidget {
  static const routeName = '/payment';
  const PaymentPage({Key? key}) : super(key: key);

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
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
                children: const [
                  SizedBox(
                    width: 5.0,
                  ),
                  Text(
                    'Payment',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(Icons.menu),
                ],
              ),
            ),
            SizedBox(
              height: 30.0,
            ),

            //Cards
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Container(
                      width: 160,
                      height: 140,
                      padding: EdgeInsets.all(30.0),
                      decoration: BoxDecoration(
                        color: Colors.pink[200],
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Payment Done',
                            // ignore: prefer_const_constructors
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: 40.0,
                          ),
                          Text(
                            '1',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      width: 160,
                      height: 140,
                      padding: EdgeInsets.all(30.0),
                      decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'All Payment',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[700],
                            ),
                          ),
                          SizedBox(
                            height: 40.0,
                          ),
                          Text(
                            '4',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),

            //List cards
            Expanded(
              child: Container(
                padding: EdgeInsets.all(25.0),
                child: Center(
                  child: Column(
                    children: [
                      //Heading payment
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Payment in Progress ',
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.0,
                      ),

                      //List view payment
                      Expanded(
                        child: ListView(
                          children: [
                            CardsPayment(
                              name: 'Ainul & Rosa',
                              date: 'Juni 23, 2022',
                              pay: 'Rp. 50.000.000,-',
                              color: Colors.green[600],
                              status: 'Done',
                            ),
                            CardsPayment(
                              name: 'Ainul & Rosa',
                              date: 'July 04, 2022',
                              pay: 'Rp. 13.000.000,-',
                              color: Colors.amber[600],
                              status: 'Pending',
                            ),
                            CardsPayment(
                              name: 'Ainul & Rosa',
                              date: 'August 14, 2022',
                              pay: 'Rp. 30.000.000,-',
                              color: Colors.amber[600],
                              status: 'Pending',
                            ),
                            CardsPayment(
                              name: 'Ainul & Rosa',
                              date: 'August 30, 2022',
                              pay: 'Rp. 3.000.000,-',
                              color: Colors.amber[600],
                              status: 'Pending',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(),
    );
  }
}
