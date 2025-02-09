import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


class CustomeLoading extends StatelessWidget {
  const CustomeLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Lottie.asset("assets/lottie/loading.json",width: 120);
  }
}
