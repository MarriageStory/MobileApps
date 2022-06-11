// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:wedding_planner/components/rounded_button.dart';
import 'package:wedding_planner/components/text_field_container.dart';

class AddPayment extends StatefulWidget {
  const AddPayment({Key? key}) : super(key: key);

  get hintText => null;

  @override
  State<AddPayment> createState() => _AddPaymentState();
}

class _AddPaymentState extends State<AddPayment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                children: [
                  Icon(Icons.arrow_back),
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFieldContainer(
                    child: TextField(
                      // onChanged: widget.onChanged,
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.pink),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.pink),
                        ),
                        hintText: 'Enter your payment name',
                        hintStyle: const TextStyle(
                          color: Color(0xFF2F2F2F),
                          fontWeight: FontWeight.w300,
                          fontSize: 14,
                          letterSpacing: -0.2,
                          height: 2,
                        ),
                        labelText: 'Payment Name',
                        labelStyle: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      style: const TextStyle(
                        color: Color(0xFF2F2F2F),
                        fontWeight: FontWeight.w300,
                        fontSize: 14,
                        letterSpacing: -0.2,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextFieldContainer(
                    child: TextField(
                      // onChanged: widget.onChanged,
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.pink),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.pink),
                        ),
                        hintText: 'DD/MM/YYYY',
                        hintStyle: const TextStyle(
                          color: Color(0xFF2F2F2F),
                          fontWeight: FontWeight.w300,
                          fontSize: 14,
                          letterSpacing: -0.2,
                          height: 2,
                        ),
                        labelText: 'Payment Date',
                        labelStyle: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      style: const TextStyle(
                        color: Color(0xFF2F2F2F),
                        fontWeight: FontWeight.w300,
                        fontSize: 14,
                        letterSpacing: -0.2,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextFieldContainer(
                    child: TextField(
                      // onChanged: widget.onChanged,
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.pink),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.pink),
                        ),
                        hintText: '000xxxxx',
                        hintStyle: const TextStyle(
                          color: Color(0xFF2F2F2F),
                          fontWeight: FontWeight.w300,
                          fontSize: 14,
                          letterSpacing: -0.2,
                          height: 2,
                        ),
                        labelText: 'Amount',
                        labelStyle: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      style: const TextStyle(
                        color: Color(0xFF2F2F2F),
                        fontWeight: FontWeight.w300,
                        fontSize: 14,
                        letterSpacing: -0.2,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),

                  //Status
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ToggleSwitch(
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
                            print('switched to: $index');
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  RoundedButton(
                    text: "Save",
                    press: () {
                      // var data = <String, dynamic>{
                      //   'email': _emailController.text,
                      //   'password': _passwordController.text,
                      // };

                      // try {
                      //   loginService().logins(data).then(
                      //     (response) {
                      //       if (response.token != "") {
                      //         Navigator.pushNamedAndRemoveUntil(
                      //           context,
                      //           "/base-screen",
                      //           (route) => false,
                      //         );
                      //       } else {
                      //         print("Gagal login");
                      //       }
                      //     },
                      //   );
                      // } catch (e) {
                      //   print(e);
                      // }
                    },
                    color: Colors.pink.shade300,
                    borderColor: Color(0xFFFA5D76),
                    textColor: Color(0xFFFFFFFF),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
