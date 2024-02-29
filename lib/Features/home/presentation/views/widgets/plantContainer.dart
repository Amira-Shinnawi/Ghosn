import 'package:flutter/material.dart';

import '../../../../../constants.dart';

class plantContainer extends StatelessWidget {
  plantContainer(
      {super.key,
        required this.image,
        required this.name,
        required this.price});
  String image;
  String name;
  int price;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kWhiteColor,
      width: 150,
      height: 400,
      child: Column(
        children: [
          Image(image: AssetImage(image)),
          Text(name,
              style: TextStyle(
                fontSize: 20,
              )),
          Text('$price',
              style: TextStyle(
                fontSize: 20,
              )),
        ],
      ),
    );
  }
}
