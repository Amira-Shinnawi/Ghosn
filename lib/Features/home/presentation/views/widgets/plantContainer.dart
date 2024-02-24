import 'package:flutter/material.dart';
import 'package:ghosn_app/constants.dart';

class plantContainer extends StatelessWidget {
  plantContainer({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kWhiteColor,
      width: 150,
      height: 400,
      child: Column(
        children: [
          const Image(image: AssetImage('assets/image 21.jpg')),
          const Text('sliver snak plant',
              style: TextStyle(
                fontSize: 20,
              )),
          const Text('150 e.l',
              style: TextStyle(
                fontSize: 20,
              )),
        ],
      ),
    );
  }
}
