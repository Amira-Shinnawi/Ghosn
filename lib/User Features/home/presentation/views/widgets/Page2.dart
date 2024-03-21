import 'package:flutter/material.dart';
import 'package:ghosn_app/User%20Features/home/presentation/views/widgets/categoriesBar.dart';
import 'package:ghosn_app/User%20Features/home/presentation/views/widgets/plantContainer.dart';
import 'package:ghosn_app/constants.dart';

class Page2 extends StatelessWidget {
  Page2({super.key, required this.i2, required this.n2, required this.p2});
  String i2;
  String n2;
  int p2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          categoriesBar(
              color1: kWhiteColor,
              color2: kLightGreenColor,
              color3: kWhiteColor),
          const SizedBox(
            height: 10,
          ),
          // Expanded(
          //   child: GridView.builder(
          //       itemCount: 6,
          //       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          //           crossAxisCount: 2),
          //       itemBuilder: (context, index) {
          //         return PlantContainer(image: i2, name: n2, price: p2);
          //       }),
          // ),
        ],
      ),
    );
  }
}
