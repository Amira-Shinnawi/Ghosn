import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ghosn_app/Features/Payment/presentation/views/widgets/check_out_body.dart';
import 'package:ghosn_app/Features/Payment/presentation/views/widgets/credit_card_container.dart';

import 'package:ghosn_app/core/widgets/custom_button.dart';
import 'package:ghosn_app/core/widgets/space_column.dart';

import '../../../../../core/utils/style.dart';
import '../../../../../translations/local_keys.g.dart';
import '../../../data/model/payment_date_model.dart';
import 'complete_container.dart';

class BillPaymentBody extends StatelessWidget {
  const BillPaymentBody({
    super.key,
    required this.paymentData, 
  });

  final PaymentDataModel paymentData;
   

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
     

    return SingleChildScrollView(
      padding: EdgeInsets.only(top: height * 0.045, left: 24, right: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SpaceColumn(
                label: LocaleKeys.date.tr(),
                value: '26jan2025',
              ),
              SpaceColumn(
                label: LocaleKeys.time.tr(),
                value: '12:20:20',
              ),
            ],
          ),
          SizedBox(
            height: height * .024,
          ),
            SpaceColumn(
            label: LocaleKeys.name.tr(),
            value: "esraa"
          ),
          SizedBox(
            height: height * .024,
          ),
          SpaceColumn(
            label:  LocaleKeys.address.tr(),
            value: paymentData.address,
          ),
          SizedBox(
            height: height * .024,
          ),
          SpaceColumn(
            label: LocaleKeys.phoneNumber.tr(),
            value: paymentData.phoneNumber,
          ),
          SizedBox(
            height: height * .024,
          ), //  SpaceColumn(label: 'Payment Method', value: paymentData.paymentMethod,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SpaceColumn(
                label:  LocaleKeys.TotalAmount.tr(),
                value: '123 EGP',
              ),
              const CompletedContainer(),
            ],
          ),
          SizedBox(height: height * .03),
          const CreditCardContainer(),
          SizedBox(height: height * .030),
         Text(
           LocaleKeys.reciet.tr(),
            style: Styles.textStyle16Intergray,
            textAlign: TextAlign.center,
          ),
           SizedBox(height: height * .015),
            CustomButton(text:LocaleKeys.done.tr(),
           onPressed: () {
               Navigator.push(
       context,
      MaterialPageRoute(builder: (context) => const CheckOutBody()),
     );
           },
           )
           
          
        ],
      ),
    );
  }
}
