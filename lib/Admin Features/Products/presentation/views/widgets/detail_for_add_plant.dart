import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
        const Text(
          'Plant Details',
          style: Styles.textStyle16Inter,
        ),
        SizedBox(
          height: blockHeight * 1,
        ),
        CustomTextField(
          hintText: 'Plant Name',
          labelText: 'Plant Name',
          controller: plantName,
        ),
        CustomTextField(
          hintText: 'Plant Description',
          labelText: 'Plant Description',
          controller: plantDesc,
          minLength: 4,
        ),
        CustomTextField(
          hintText: 'Quantity',
          labelText: 'Quantity',
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          controller: quantity,
        ),
        CustomTextField(
          hintText: 'Price',
          labelText: 'Price',
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
        const Text(
          'Plant Properties',
          style: Styles.textStyle16Inter,
        ),
        SizedBox(
          height: blockHeight * 1,
        ),
        CustomTextField(
          hintText: 'Amount Of Water',
          labelText: 'Amount Of Water',
          controller: amountofWater,
          prefixIcon: const Icon(
            Icons.water_drop_outlined,
            size: 20,
          ),
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        ),
        CustomTextField(
          hintText: 'Amount Sunlight',
          labelText: 'Amount Sunlight',
          controller: amountofSunlight,
          prefixIcon: const Icon(
            Icons.wb_sunny_outlined,
            size: 20,
          ),
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        ),
        CustomTextField(
          hintText: 'Humidity',
          labelText: 'Humidity',
          controller: humidity,
          prefixIcon: const Icon(
            Icons.opacity_outlined,
            size: 20,
          ),
        ),
        CustomTextField(
          hintText: 'Min Temperature',
          labelText: 'Min Temperature',
          controller: minTemp,
          prefixIcon: const Icon(
            FontAwesomeIcons.temperatureLow,
            size: 20,
          ),
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        ),
        CustomTextField(
          hintText: 'Max Temperature',
          labelText: 'Max Temperature',
          controller: maxTemp,
          prefixIcon: const Icon(
            FontAwesomeIcons.temperatureHigh,
            size: 20,
          ),
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        ),
        CustomTextField(
          hintText: 'Height',
          labelText: 'Height',
          controller: plantHeight,
          prefixIcon: const Icon(
            Icons.height_outlined,
            size: 20,
          ),
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        ),
        CustomTextField(
          hintText: 'Soil Type',
          labelText: 'Soil Type',
          controller: soilType,
        ),
        CustomTextField(
          hintText: 'Category ID',
          labelText: 'Category ID',
          controller: categoryId,
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        ),
      ],
    );
  }
}
