import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ghosn_app/constants.dart';
import 'package:ghosn_app/translations/local_keys.g.dart';

import 'product_property.dart';

class ProductProperties extends StatelessWidget {
  const ProductProperties({
    super.key,
    required this.height,
    required this.width,
  });

  final double height, width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 45,
      decoration: const BoxDecoration(
        color: kGreenColor,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * 4,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ProductProperty(
              propertyName: LocaleKeys.Temperature.tr(),
              propertyValue: '19-29 C',
            ),
            ProductProperty(
              propertyName: LocaleKeys.Humidity.tr(),
              propertyValue: '70%',
            ),
            ProductProperty(
              propertyName: LocaleKeys.Sunlight.tr(),
              propertyValue: '30%',
            ),
            ProductProperty(
              propertyName: LocaleKeys.Height.tr(),
              propertyValue: '30cm',
            ),
          ],
        ),
      ),
    );
  }
}
