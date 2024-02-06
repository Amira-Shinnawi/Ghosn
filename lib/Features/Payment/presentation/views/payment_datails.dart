import 'package:flutter/material.dart';
import 'package:ghosn_app/core/widgets/custom_appbar.dart';

import 'widgets/payment_detail_body.dart';

class RadioListTitleWidget extends StatelessWidget {
  final String selectedPaymentMethod;
  final String address;
  final String phoneNumber;
  final String street;
  const RadioListTitleWidget(
      {super.key,
      required this.selectedPaymentMethod,
      required this.address,
      required this.phoneNumber,
      required this.street});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: "Payment Details",
      ),
      body: SafeArea(
        child: PaymentDetailsBody(
          selectedPaymentMethod: selectedPaymentMethod,
          phoneNumber: phoneNumber,
          street: street,
          address: address,
        ),
      ),
    );
  }
}
