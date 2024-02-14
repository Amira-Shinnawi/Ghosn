import 'package:flutter/material.dart';
import 'package:ghosn_app/Features/Payment/data/model/payment_date_model.dart';
import 'package:ghosn_app/core/widgets/custom_appbar.dart';

import 'widgets/confirm_payment_body.dart';

class ConfirmPayment extends StatelessWidget {
  const ConfirmPayment({super.key, required this.paymentData,  required this.paymentMethod});
  final PaymentDataModel paymentData;
   final String paymentMethod; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Confirm Payment',
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: SafeArea(
        child: ConfirmPaymentBody(
          paymentData: paymentData, paymentMethod:paymentMethod,
        ),
      ),
    );
  }
}
