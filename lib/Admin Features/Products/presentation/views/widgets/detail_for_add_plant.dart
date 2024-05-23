import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/utils/style.dart';
import '../../../../../core/widgets/custom_text_field.dart';

class DetailForAddPlant extends StatelessWidget {
  const DetailForAddPlant({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double blockHeight = (height / 100);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Plant Details',
          style: Styles.textStyle18Inter,
        ),
        SizedBox(
          height: blockHeight * 1,
        ),
        CustomTextField(
          hintText: 'Plant Name',
          labelText: 'Plant Name',
        ),
        CustomTextField(
          hintText: 'Plant Description',
          labelText: 'Plant Description',
          minLength: 4,
        ),
        CustomTextField(
          hintText: 'Quantity',
          labelText: 'Quantity',
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        ),
        CustomTextField(
          hintText: 'Price',
          labelText: 'Price',
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
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
          style: Styles.textStyle18Inter,
        ),
        SizedBox(
          height: blockHeight * 1,
        ),
        CustomTextField(
          hintText: 'Amount Of Water',
          labelText: 'Amount Of Water',
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
          prefixIcon: const Icon(
            Icons.opacity_outlined,
            size: 20,
          ),
        ),
        CustomTextField(
          hintText: 'Min Temperature',
          labelText: 'Min Temperature',
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
        ),
        CustomTextField(
          hintText: 'Category ID',
          labelText: 'Category ID',
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        ),
      ],
    );
  }
}
