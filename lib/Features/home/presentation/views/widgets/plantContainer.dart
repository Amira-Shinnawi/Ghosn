import 'package:flutter/material.dart';
import 'package:ghosn_app/Features/home/data/plantModel.dart';

import '../../../../../constants.dart';

class plantContainer extends StatelessWidget {
  plantContainer({
    super.key,
    required this.plantModel,
  });
  PlantModel plantModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: kWhiteColor,
        width: 150,
        height: 200,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                color: kLightGreenColor,
                child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Image(image: AssetImage(plantModel.image))),
              ),
            ),
            Text(plantModel.name,
                style: TextStyle(
                  fontSize: 20,
                )),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  Text(plantModel.price,
                      style: TextStyle(
                        fontSize: 20,
                      )),
                  Spacer(),
                  ImageIcon(AssetImage('assets/image 24.png'))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
