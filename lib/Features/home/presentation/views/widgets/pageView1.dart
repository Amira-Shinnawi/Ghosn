import 'package:flutter/material.dart';
import 'package:ghosn_app/Features/home/presentation/views/widgets/categoriesBar.dart';
import 'package:ghosn_app/Features/home/presentation/views/widgets/plantContainer.dart';
import 'package:ghosn_app/constants.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});
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
              child: Image(image: AssetImage('assets/Component 1.jpg'))),
          SizedBox(
            height: 30,
          ),
          Expanded(
            child: GridView.builder(
                itemCount: 6,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return plantContainer();
                }),
          )
        ],
      ),
    );
  }
}
