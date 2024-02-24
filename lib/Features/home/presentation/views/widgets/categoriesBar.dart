import 'package:ghosn_app/Features/home/presentation/views/gardens.dart';
import 'package:flutter/material.dart';
import 'package:ghosn_app/Features/home/presentation/views/home.dart';
import 'package:ghosn_app/Features/home/presentation/views/blooming.dart';

class categoriesBar extends StatelessWidget {
  const categoriesBar(
      {super.key,
      required this.color1,
      required this.color2,
      required this.color3});
  final Color color1;
  final Color color2;
  final Color color3;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(children: [
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return HomePage();
            }));
          },
          child: Container(
            color: color1,
            child: const Text('indoor plants'),
          ),
        ),
        const Spacer(),
        GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return gardens();
              }));
            },
            child: Container(color: color2, child: const Text('gardens'))),
        const Spacer(),
        GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return blooming();
              }));
            },
            child: Container(color: color3, child: const Text('bloombing')))
      ]),
    );
  }
}
