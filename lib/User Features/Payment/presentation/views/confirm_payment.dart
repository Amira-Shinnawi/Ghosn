import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ghosn_app/core/widgets/custom_appbar.dart';

import '../../../../core/utils/style.dart';
import '../../../../translations/local_keys.g.dart';
import '../../data/model/payment_date_model.dart';
import 'widgets/confirm_payment_body.dart';

class ConfirmPayment extends StatelessWidget {
  const ConfirmPayment(
      {super.key, required this.paymentData, required this.paymentMethod});
  final PaymentDataModel paymentData;
  final String paymentMethod;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        titleAppBar: Text(
          LocaleKeys.confirmpayment.tr(),
          style: Styles.textStyle22Inter.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: SafeArea(
        child: ConfirmPaymentBody(
          paymentData: paymentData,
          paymentMethod: paymentMethod,
        ),
      ),
    );
  }
}
