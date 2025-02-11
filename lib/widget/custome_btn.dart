import 'package:flutter/material.dart';

import '../helper/global.dart';


class CustomeBtn extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const CustomeBtn({super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return Align(
      child: ElevatedButton(style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          shape: const StadiumBorder(),
          elevation: 0,
          minimumSize: Size(mq.width * .5, 50)),
          onPressed: onTap,
          child: Text(style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),
              text)),
    );

  }
}
