import 'package:flutter/material.dart';
import 'package:ghosn_app/constants.dart';
import 'package:ghosn_app/core/utils/assets_data.dart';

class plantContainer extends StatelessWidget {
  plantContainer({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kWhiteColor,
      width: 150,
      height: 400,
      child: const Column(
        children: [
          Image(image: AssetImage(AssetsData.imageTest2)),
          Text('sliver snak plant',
              style: TextStyle(
                fontSize: 20,
              )),
          Text('150 EGP',
              style: TextStyle(
                fontSize: 20,
              )),
        ],
      ),
    );
  }
}
