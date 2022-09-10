import 'package:flutter/material.dart';

class BoxCard extends StatelessWidget {
  const BoxCard({
    Key? key,
    required this.totalTask,
    required this.nameTask,
  }) : super(key: key);

  final int totalTask;
  final String nameTask;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 120,
      decoration: BoxDecoration(
        color: const Color(0xFFF6F6F6),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 0,
            blurRadius: 2,
            offset: const Offset(0, 0), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            totalTask.toString(),
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
          ),
          Text(
            nameTask,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF2F2F2F).withOpacity(0.4)),
          )
        ],
      ),
    );
  }
}
