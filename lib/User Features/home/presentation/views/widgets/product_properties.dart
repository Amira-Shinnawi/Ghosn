import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ghosn_app/constants.dart';
import 'package:ghosn_app/translations/local_keys.g.dart';

import '../../../data/plant_model.dart';
import 'product_property.dart';

class ProductProperties extends StatelessWidget {
  const ProductProperties({
    super.key,
    required this.plantModel,
  });
  final Plants plantModel;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double blockHeight = (height / 100);
    double blockWidth = (width / 100);
    return Container(
      height: blockHeight * 45,
      decoration: const BoxDecoration(
        color: kGreenColor,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: blockWidth * 4,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ProductProperty(
              propertyName: LocaleKeys.Temperature.tr(),
              propertyValue:
                  '${plantModel.minTemperature}-${plantModel.maxTemperature}C',
            ),
            ProductProperty(
              propertyName: LocaleKeys.Humidity.tr(),
              propertyValue: '${plantModel.humdity}%',
            ),
            ProductProperty(
              propertyName: LocaleKeys.Sunlight.tr(),
              propertyValue: '${plantModel.amountSunlight}%',
            ),
            ProductProperty(
              propertyName: LocaleKeys.Height.tr(),
              propertyValue: '${plantModel.height}cm',
            ),
          ],
        ),
      ),
    );
  }
}
