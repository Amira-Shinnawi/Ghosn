import 'package:flutter/material.dart';
import 'package:ghosn_app/Features/Payment/presentation/views/widgets/payment_method_body.dart';

import '../../../../core/utils/style.dart';
import '../../../../core/widgets/custom_appbar.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios)),
        titleAppBar: Text(
          "Payment Page",
          style: Styles.textStyle22Inter.copyWith(
            fontSize: 25,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: const SafeArea(
        child: PaymentMethodBody(),
      ),
    );
  }
}
