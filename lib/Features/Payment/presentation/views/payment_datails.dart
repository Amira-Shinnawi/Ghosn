import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ghosn_app/Features/Payment/data/model/amount_model/amount_model.dart';
import 'package:ghosn_app/Features/Payment/data/model/amount_model/details.dart';
import 'package:ghosn_app/Features/Payment/data/model/item_list_model/item_list_model.dart';
import 'package:ghosn_app/Features/Payment/data/model/item_list_model/items.dart';
import 'package:ghosn_app/Features/Payment/presentation/views/Bill.dart';
import 'package:ghosn_app/Features/Payment/presentation/views/Executepaypal.dart';
import 'package:ghosn_app/Features/Payment/presentation/views/credit_card_view.dart';
import 'package:ghosn_app/Features/Payment/presentation/views/paypal_body.dart';
import 'package:ghosn_app/Features/Payment/presentation/views/widgets/PaymentDate.dart';

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
      appBar: CustomAppBar(title: "Payment Details"),
      body: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 58, 15, 15),
          

            child: Container(
              height: 80,
              decoration: ShapeDecoration(
                color: const Color(0xFFFAF6F6),
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 2,
                    color: _selectedIndex == 0
                        ? kGreenColor
                        : const Color(0xFFE5DBDB),
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Row(
                children: [
                  Payment_Method_RadioButton(
                    title: 'Credit Card',
                    value: 0,
                    groupValue: _selectedIndex,
                    onChanged: (int? value) {
                      setState(() {
                        _selectedIndex = value!;
                        showCreditCard = _selectedIndex == 0;
                      });
                    },
                    imagePath: 'assets/images/visa.png',
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 16, 15, 15),
            child: Container(
              height: 80,
              decoration: ShapeDecoration(
                color: const Color(0xFFFAF6F6),
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 2,
                    color: _selectedIndex == 1
                        ? kGreenColor
                        : const Color(0xFFE5DBDB),
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Row(
                children: [
                  Payment_Method_RadioButton(
                    title: 'PayPal',
                    value: 1,
                    groupValue: _selectedIndex,
                    onChanged: (int? value) {
                      setState(() {
                        _selectedIndex = value!;
                       
                        var transactionData = getTransactionsDate();
                        ExecutePaypal(context, transactionData);
                           });
                  },
 
                   
                     

                    imagePath: 'assets/images/paypal.png',
                  ),
                ],
              ),
            ),
          ),
          AnimatedCrossFade(
            duration: const Duration(milliseconds: 300),
            crossFadeState: showCreditCard
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
            firstChild: CreditCard(
              formKey: formKey,
              autovalidateMode: autovalidateMode,
            ),
            secondChild: Container(
              child: SizedBox(
                height: 300,
              ),
            ),
          ),
       
         
          CustomButton(
            text: 'Pay Now',
            onPressed: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return Bill(
                    paymentMethod: widget.selectedPaymentMethod,
                    address: widget.address,
                    phoneNumber: widget.phoneNumber,
                    street: widget.street,
                  );
                }));
              } else {
                autovalidateMode = AutovalidateMode.always;
                setState(() {});
              }
            },
          ),
        ]),
      ),
    );
  }
}
