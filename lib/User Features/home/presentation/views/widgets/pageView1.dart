import 'package:flutter/material.dart';
import 'package:ghosn_app/User%20Features/home/presentation/views/widgets/categoriesBar.dart';
import 'package:ghosn_app/User%20Features/home/presentation/views/widgets/plantContainer.dart';
import 'package:ghosn_app/constants.dart';
import 'package:ghosn_app/core/utils/assets_data.dart';

class Page1 extends StatelessWidget {
  Page1({super.key, required this.i1, required this.n1, required this.p1});
  String i1;
  String n1;
  int p1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          categoriesBar(
              color1: kLightGreenColor,
              color2: kWhiteColor,
              color3: kWhiteColor),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              children: [
                Text(
                  'offers up to 30% ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ],
            ),
          ),
          SizedBox(
              width: 330,
              height: 200,
              child: Image.asset(AssetsData.imageTest2)),
          SizedBox(
            height: 30,
          ),
          Expanded(
            child: GridView.builder(
                itemCount: 6,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return plantContainer(image: i1, name: n1, price: p1);
                }),
          )
        ],
      ),
    );
  }
}
