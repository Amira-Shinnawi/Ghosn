import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ghosn_app/core/widgets/custom_button.dart';
import 'package:ghosn_app/core/widgets/space_column.dart';

import '../../../../../core/utils/style.dart';
import '../../../../../translations/local_keys.g.dart';
import '../../../data/model/payment_date_model.dart';
import 'check_out_body.dart';
import 'complete_container.dart';
import 'credit_card_container.dart';

class BillPaymentBody extends StatelessWidget {
  const BillPaymentBody({
    super.key,
    required this.paymentData,
  });

  final PaymentDataModel paymentData;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    double blocHeight = (height / 100);
    double blocWidth = (width / 100);
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
          vertical: blocHeight * 4, horizontal: blocWidth * 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SpaceColumn(
                label: LocaleKeys.date.tr(),
                value: '24June2024',
              ),
              SpaceColumn(
                label: LocaleKeys.time.tr(),
                value: '3:31 AM',
              ),
            ],
          ),
          SizedBox(height: blocHeight * 2),

          SpaceColumn(label: LocaleKeys.name.tr(), value: "Amira"),
          SizedBox(height: blocHeight * 2),

          SpaceColumn(
            label: LocaleKeys.address.tr(),
            value: paymentData.address,
          ),
          SizedBox(height: blocHeight * 2),

          SpaceColumn(
            label: LocaleKeys.phoneNumber.tr(),
            value: paymentData.phoneNumber,
          ),
          SizedBox(height: blocHeight * 2),
//  SpaceColumn(label: 'Payment Method', value: paymentData.paymentMethod,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SpaceColumn(
                label: LocaleKeys.TotalAmount.tr(),
                value: '54.0LE',
              ),
              const CompletedContainer(),
            ],
          ),
          SizedBox(height: blocHeight * 3),
          const CreditCardContainer(),
          SizedBox(height: blocHeight * 3),
          Text(
            LocaleKeys.reciet.tr(),
            style: Styles.textStyle16Intergray,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: blocHeight * 2),
          Center(
            child: CustomButton(
              text: LocaleKeys.done.tr(),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CheckOutBody()),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
