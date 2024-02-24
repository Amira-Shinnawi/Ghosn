import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ghosn_app/Features/Payment/data/model/payment_date_model.dart';
import 'package:ghosn_app/core/widgets/custom_appbar.dart';

import '../../../../translations/local_keys.g.dart';
import 'widgets/bill_payment_body.dart';

class Bill extends StatelessWidget {
  const Bill({
    super.key,
    required this.paymentData,
  });
  final PaymentDataModel paymentData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
      titleAppBar: Text(LocaleKeys.billpayment.tr(),),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: BillPaymentBody(
        paymentData: paymentData,
      ),
    );
  }
}
