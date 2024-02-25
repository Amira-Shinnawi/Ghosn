import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ghosn_app/Features/Payment/data/model/payment_date_model.dart';
import 'package:ghosn_app/core/widgets/custom_appbar.dart';

import '../../../../core/utils/style.dart';
import '../../../../translations/local_keys.g.dart';
import 'widgets/payment_detail_body.dart';

class RadioListTitleWidget extends StatefulWidget {
  final PaymentDataModel paymentData;

  const RadioListTitleWidget({
    super.key,
    required this.paymentData,
  });
  @override
  _RadioListTitleWidgetState createState() => _RadioListTitleWidgetState();
}

class _RadioListTitleWidgetState extends State<RadioListTitleWidget> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  bool showCreditCard = false;

  @override
  void initState() {
    super.initState();

    showCreditCard = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          titleAppBar: Text(
            LocaleKeys.paymentdetails.tr(),
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
        body: PaymentDetailsBody(
          paymentData: widget.paymentData,
        ));
  }
}
