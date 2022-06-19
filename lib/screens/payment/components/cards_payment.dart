import 'package:flutter/material.dart';

class CardsPayment extends StatelessWidget {
  final String name;
  final String date;
  final String pay;
  final color;
  final String status;

  const CardsPayment({
    Key? key,
    required this.name,
    required this.date,
    required this.pay,
    required this.color,
    required this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: size.width * 0.9,
            height: 115,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 2,
                    offset: Offset(0, 0),
                  ),
                ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: size.width * 0.6,
                  padding: EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                          color: Colors.grey[800],
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        date,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      Text(
                        pay,
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  height: 115,
                  width: size.width * 0.3,
                  decoration: BoxDecoration(
                      color: color,
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      )),
                  child: Text(
                    status,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 8,
          ),
        ]);

    // return Padding(
    //   padding: EdgeInsets.only(bottom: 10.0),
    //   child: Container(
    //     padding: EdgeInsets.all(16.0),
    //     decoration: BoxDecoration(
    //       color: Colors.white,
    //       borderRadius: BorderRadius.circular(15),
    //     ),
    //     child: Row(
    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //       children: [
    //         Column(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [
    //             Text(
    //               name,
    //               style: TextStyle(
    //                 color: Colors.grey[800],
    //                 fontSize: 14,
    //                 fontWeight: FontWeight.bold,
    //               ),
    //             ),
    //             Text(
    //               date,
    //               style: TextStyle(
    //                 color: Colors.grey,
    //                 fontSize: 12,
    //                 fontWeight: FontWeight.w300,
    //               ),
    //             ),
    //             SizedBox(
    //               height: 20.0,
    //             ),
    //             Text(
    //               pay,
    //               style: TextStyle(
    //                 color: Colors.grey[700],
    //                 fontSize: 18,
    //                 fontWeight: FontWeight.w800,
    //               ),
    //             ),
    //           ],
    //         ),
    //         Column(
    //           crossAxisAlignment: CrossAxisAlignment.end,
    //           children: [
    //             Container(
    //               height: 90,
    //               width: 120,
    //               padding: EdgeInsets.all(10.0),
    //               decoration: BoxDecoration(
    //                 color: color,
    //                 borderRadius: BorderRadius.circular(15),
    //               ),
    //               child: Center(
    //                 child: Text(
    //                   status,
    //                   style: TextStyle(
    //                     color: Colors.white,
    //                     fontSize: 16,
    //                     fontWeight: FontWeight.bold,
    //                   ),
    //                 ),
    //               ),
    //             ),
    //           ],
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
