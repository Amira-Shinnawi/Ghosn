import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../core/utils/style.dart';
import '../../../../../core/widgets/custom_text_field.dart';

class DetailForPot extends StatelessWidget {
  const DetailForPot({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double blockHeight = (height / 100);

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Text(
        'Pot Details',
        style: Styles.textStyle18Inter,
      ),
      SizedBox(
        height: blockHeight * 1,
      ),
      CustomTextField(
        hintText: 'Pot Name',
        labelText: 'Pot Name',
      ),
      CustomTextField(
        hintText: 'Pot Description',
        labelText: 'Pot Description',
        minLength: 4,
      ),
      CustomTextField(
        hintText: 'Pot Color',
        labelText: 'Pot Color',
      ),
      CustomTextField(
        hintText: 'Pot Material',
        labelText: 'Pot Material',
      ),
      CustomTextField(
        hintText: 'Category ID ',
        labelText: 'Category ID',
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      ),
    ]);
  }
}
