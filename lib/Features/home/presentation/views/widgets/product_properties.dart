import 'package:flutter/material.dart';
import 'package:ghosn_app/constants.dart';

import 'product_property.dart';

class ProductProperties extends StatelessWidget {
  const ProductProperties({
    super.key,
    required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * .5,
      decoration: const BoxDecoration(
        color: kGreenColor,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: height * .04),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductProperty(
              propertyName: 'Temperature',
              propertyValue: '19-29 C',
            ),
            ProductProperty(
              propertyName: 'Humidity',
              propertyValue: '70%',
            ),
            ProductProperty(
              propertyName: 'Sunlight',
              propertyValue: '30%',
            ),
            ProductProperty(
              propertyName: 'Height',
              propertyValue: '30cm',
            ),
          ],
        ),
      ),
    );
  }
}
