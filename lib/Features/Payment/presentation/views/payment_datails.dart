import 'package:flutter/material.dart';


import 'package:ghosn_app/Features/Payment/presentation/views/Bill.dart';
import 'package:ghosn_app/Features/Payment/presentation/views/Executepaypal.dart';

import 'package:ghosn_app/Features/Payment/presentation/views/widgets/PaymentDate.dart';
import 'package:ghosn_app/Features/Payment/presentation/views/widgets/payment_method_radio.dart';

import 'package:ghosn_app/constants.dart';
import 'package:ghosn_app/core/widgets/custom_appbar.dart';

import 'widgets/payment_detail_body.dart';

class RadioListTitleWidget extends StatefulWidget {
  final String selectedPaymentMethod;
   final PaymentData paymentData;

  const RadioListTitleWidget(
      {super.key,
      required this.selectedPaymentMethod, required this.paymentData,
   });
  @override
  _RadioListTitleWidgetState createState() => _RadioListTitleWidgetState();
}

class _RadioListTitleWidgetState extends State<RadioListTitleWidget> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  bool showCreditCard = false;
  late int _selectedIndex;
  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.selectedPaymentMethod == 'Visa' ? 0 : 1;
    showCreditCard = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Payment Details", 
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),),
      body: PaymentDetailsBody(paymentData: widget.paymentData,    selectedPaymentMethod:widget.selectedPaymentMethod )
    );
  }
}
