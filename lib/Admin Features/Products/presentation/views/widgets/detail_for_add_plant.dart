import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ghosn_app/translations/local_keys.g.dart';

import '../../../../../core/utils/style.dart';
import '../../../../../core/widgets/custom_text_field.dart';

class DetailForAddPlant extends StatelessWidget {
  DetailForAddPlant({
    super.key,
    required this.plantName,
    required this.plantDesc,
    required this.quantity,
    required this.price,
    required this.amountofSunlight,
    required this.amountofWater,
    required this.humidity,
    required this.minTemp,
    required this.maxTemp,
    required this.plantHeight,
    required this.soilType,
    required this.categoryId,
  });
  TextEditingController plantName = TextEditingController();
  TextEditingController plantDesc = TextEditingController();
  TextEditingController quantity = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController amountofWater = TextEditingController();
  TextEditingController amountofSunlight = TextEditingController();
  TextEditingController humidity = TextEditingController();
  TextEditingController minTemp = TextEditingController();
  TextEditingController maxTemp = TextEditingController();
  TextEditingController plantHeight = TextEditingController();
  TextEditingController soilType = TextEditingController();
  TextEditingController categoryId = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double blockHeight = (height / 100);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.PlantDetails.tr(),
          style: Styles.textStyle16Inter,
        ),
        SizedBox(
          height: blockHeight * 1,
        ),
        CustomTextField(
          showSuffixIcon: false,
          hintText: LocaleKeys.PlantName.tr(),
          labelText: LocaleKeys.PlantName.tr(),
          controller: plantName,
        ),
        CustomTextField(
          showSuffixIcon: false,
          hintText: LocaleKeys.PlantDescription.tr(),
          labelText: LocaleKeys.PlantDescription.tr(),
          controller: plantDesc,
          minLength: 4,
        ),
        CustomTextField(
          showSuffixIcon: false,
          hintText: LocaleKeys.Quantity.tr(),
          labelText: LocaleKeys.Quantity.tr(),
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          controller: quantity,
        ),
        CustomTextField(
          showSuffixIcon: false,
          hintText: LocaleKeys.Price.tr(),
          labelText: LocaleKeys.Price.tr(),
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          controller: price,
        ),
        SizedBox(
          height: blockHeight * 1,
        ),
        const Divider(),
        SizedBox(
          height: blockHeight * 1,
        ),
        Text(
          LocaleKeys.PlantProperties.tr(),
          style: Styles.textStyle16Inter,
        ),
        SizedBox(
          height: blockHeight * 1,
        ),
        CustomTextField(
          showSuffixIcon: false,
          hintText: LocaleKeys.AmountWater.tr(),
          labelText: LocaleKeys.AmountWater.tr(),
          controller: amountofWater,
          prefixIcon: const Icon(
            Icons.water_drop_outlined,
            size: 20,
          ),
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        ),
        CustomTextField(
          showSuffixIcon: false,
          hintText: LocaleKeys.AmountSunlight.tr(),
          labelText: LocaleKeys.AmountSunlight.tr(),
          controller: amountofSunlight,
          prefixIcon: const Icon(
            Icons.wb_sunny_outlined,
            size: 20,
          ),
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        ),
        CustomTextField(
          showSuffixIcon: false,
          hintText: LocaleKeys.Humidity.tr(),
          labelText: LocaleKeys.Humidity.tr(),
          controller: humidity,
          prefixIcon: const Icon(
            Icons.opacity_outlined,
            size: 20,
          ),
        ),
        CustomTextField(
          showSuffixIcon: false,
          hintText: LocaleKeys.MinTemperature.tr(),
          labelText: LocaleKeys.MinTemperature.tr(),
          controller: minTemp,
          prefixIcon: const Icon(
            FontAwesomeIcons.temperatureLow,
            size: 20,
          ),
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        ),
        CustomTextField(
          showSuffixIcon: false,
          hintText: LocaleKeys.MaxTemperature.tr(),
          labelText: LocaleKeys.MaxTemperature.tr(),
          controller: maxTemp,
          prefixIcon: const Icon(
            FontAwesomeIcons.temperatureHigh,
            size: 20,
          ),
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        ),
        CustomTextField(
          showSuffixIcon: false,
          hintText: LocaleKeys.Height.tr(),
          labelText: LocaleKeys.Height.tr(),
          controller: plantHeight,
          prefixIcon: const Icon(
            Icons.height_outlined,
            size: 20,
          ),
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        ),
        CustomTextField(
          showSuffixIcon: false,
          hintText: LocaleKeys.SoilType.tr(),
          labelText: LocaleKeys.SoilType.tr(),
          controller: soilType,
        ),
        CustomTextField(
          showSuffixIcon: false,
          hintText: LocaleKeys.CategoryID.tr(),
          labelText: 'Category ID',
          controller: categoryId,
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        ),
      ],
    );
  }
}
