import 'package:flutter/material.dart';
import 'package:ghosn_app/Features/Payment/presentation/views/Bill.dart';
import 'package:ghosn_app/Features/Payment/presentation/views/widget/credit_card.dart';
import 'package:ghosn_app/Features/Payment/presentation/views/widget/payment_method_radio.dart';
import 'package:ghosn_app/constants.dart';
import 'package:ghosn_app/core/widgets/custom_appbar.dart';
import 'package:ghosn_app/core/widgets/custom_button.dart';

class RadioListTitleWidget extends StatefulWidget {
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
  _RadioListTitleWidgetState createState() => _RadioListTitleWidgetState();
}

class _RadioListTitleWidgetState extends State<RadioListTitleWidget> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  late int _selectedIndex;
  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.selectedPaymentMethod == 'Visa' ? 0 : 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Payment Details"),
      body: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 40, 15, 15),
            //

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
                      });
                    },
                    imagePath: 'assets/images/visa.png',
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 5, 15, 15),
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
                      });
                    },
                    imagePath: 'assets/images/paypal.png',
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          CreditCard(
            formKey: formKey,
            autovalidateMode: autovalidateMode,
          ),
          const SizedBox(
            height: 10,
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
