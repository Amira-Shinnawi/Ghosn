import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter/material.dart';


class Percent extends StatelessWidget {
  Percent({super.key, required this.i, required this.p});
  double i;
  String p;
  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: 45,
      progressColor: Colors.green,
      percent: i * .01,
      center: Text(p + '%'),
      animation: true,
    );
  }
}
