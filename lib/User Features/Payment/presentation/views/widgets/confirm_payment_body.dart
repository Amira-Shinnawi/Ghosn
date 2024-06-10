import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ghosn_app/core/widgets/space_row.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/style.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../translations/local_keys.g.dart';
import '../../../data/model/payment_date_model.dart';
import '../Bill.dart';

class ConfirmPaymentBody extends StatelessWidget {
  const ConfirmPaymentBody(
      {super.key, required this.paymentData, required this.paymentMethod});
  final PaymentDataModel paymentData;
  final String paymentMethod;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    double blocHeight = (height / 100);
    double blocWidth = (width / 100);
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: blocHeight * 4, horizontal: blocWidth * 6),
        child: Column(
          children: [
            SpaceBetweenRow(
              label: LocaleKeys.date.tr(),
              value: '10June2024',
            ),
            SpaceBetweenRow(
              label: LocaleKeys.address.tr(),
              value: paymentData.address,
            ),
            SpaceBetweenRow(
              label: LocaleKeys.paymentmethod.tr(),
              value: paymentMethod,
            ),
            SpaceBetweenRow(
              label: LocaleKeys.phoneNumber.tr(),
              value: paymentData.phoneNumber,
            ),
            SpaceBetweenRow(
              label: LocaleKeys.TotalAmount.tr(),
              value: '54.0LE',
            ),
            SizedBox(height: blocHeight * 4),
            Center(
              child: CustomButton(
                text: LocaleKeys.confirm.tr(),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Bill(paymentData: paymentData),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: blocHeight * 4),
            Center(
              child: Text(
                LocaleKeys.help.tr(),
                style: Styles.textStyle22Inter.copyWith(
                  fontSize: 16,
                  color: kGreenColor,
                  decoration: TextDecoration.underline,
                  decorationColor: kGreenColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
