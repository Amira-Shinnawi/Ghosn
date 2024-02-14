import 'package:flutter/material.dart';
import 'package:ghosn_app/Features/Payment/data/model/payment_date_model.dart';



import 'package:ghosn_app/core/widgets/custom_appbar.dart';

import 'widgets/payment_detail_body.dart';

class RadioListTitleWidget extends StatefulWidget {

   final PaymentDataModel paymentData;

  const RadioListTitleWidget(
      {super.key,
     
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
      appBar: CustomAppBar(title: "Payment Details", 
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),),
      body: PaymentDetailsBody(paymentData: widget.paymentData,  
     
        )
    );
  }
}
