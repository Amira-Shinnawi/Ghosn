import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../core/utils/style.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../../../../../translations/local_keys.g.dart';

class DetailForPot extends StatelessWidget {
  const DetailForPot({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double blockHeight = (height / 100);

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        LocaleKeys.PotDetails.tr(),
        style: Styles.textStyle18Inter,
      ),
      SizedBox(
        height: blockHeight * 1,
      ),
      CustomTextField(
        showSuffixIcon: false,
        hintText: LocaleKeys.PotName.tr(),
        labelText: LocaleKeys.PotName.tr(),
      ),
      CustomTextField(
        showSuffixIcon: false,
        hintText: LocaleKeys.PotDescription.tr(),
        labelText: LocaleKeys.PotDescription.tr(),
        minLength: 4,
      ),
      CustomTextField(
        showSuffixIcon: false,
        hintText: LocaleKeys.PotColor.tr(),
        labelText: LocaleKeys.PotColor.tr(),
      ),
      CustomTextField(
        showSuffixIcon: false,
        hintText: LocaleKeys.PotMaterial.tr(),
        labelText: LocaleKeys.PotMaterial.tr(),
      ),
      CustomTextField(
        showSuffixIcon: false,
        hintText: LocaleKeys.CategoryID.tr(),
        labelText: LocaleKeys.CategoryID.tr(),
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      ),
    ]);
  }
}
