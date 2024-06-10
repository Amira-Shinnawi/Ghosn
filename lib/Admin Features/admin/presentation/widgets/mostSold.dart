
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';


class MostSold extends StatelessWidget {
  MostSold({super.key, required this.i, required this.p});
  int i;
  String p;
  @override
  Widget build(BuildContext context) {
    return Column(children: [Row(children: [ Text(p,style: const TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: 13,
        color: Colors.black,
        decoration: TextDecoration.none),),const Spacer(),Text('$i',style: const TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: 13,
        color: Colors.black,
        decoration: TextDecoration.none),),const Text('%',style:  TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: 13,
        color: Colors.black,
        decoration: TextDecoration.none),)],),LinearPercentIndicator(
      lineHeight: 10,
      percent: i*.01,
      animation: true,
      progressColor: Colors.green,
    ),],);}}
