import 'package:flutter/material.dart';
import 'package:ghosn_app/User%20Features/home/presentation/views/widgets/categoriesBar.dart';
import 'package:ghosn_app/constants.dart';

class Page3 extends StatelessWidget {
  Page3({super.key, required this.i3, required this.n3, required this.p3});
  String i3;
  String n3;
  int p3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          categoriesBar(
              color1: kWhiteColor,
              color2: kWhiteColor,
              color3: kLightGreenColor),
        const  SizedBox(
            height: 10,
          ),
          // Expanded(
          //   child: GridView.builder(
          //       itemCount: 6,
          //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //           crossAxisCount: 2),
          //       itemBuilder: (context, index) {
          //         return PlantContainer(
          //           image: i3,
          //           name: n3,
          //           price: p3,
          //         );
          //       }),
          // ),
        ],
      ),
    );
  }
}
