import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ghosn_app/Features/Payment/presentation/views/widgets/payment_method_body.dart';
import 'package:ghosn_app/translations/local_keys.g.dart';

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
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
        titleAppBar: Text(
          LocaleKeys.paymentpage.tr(),
          style: Styles.textStyle22Inter.copyWith(
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
