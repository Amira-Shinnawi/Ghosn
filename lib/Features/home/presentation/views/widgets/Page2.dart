import 'package:flutter/material.dart';
import 'package:ghosn_app/Features/home/presentation/views/widgets/categoriesBar.dart';
import 'package:ghosn_app/Features/home/presentation/views/widgets/plantContainer.dart';
import 'package:ghosn_app/constants.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          categoriesBar(
              color1: kWhiteColor,
              color2: kLightGreenColor,
              color3: kWhiteColor),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: GridView.builder(
                itemCount: 6,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return plantContainer();
                }),
          ),
        ],
      ),
    );
  }
}
