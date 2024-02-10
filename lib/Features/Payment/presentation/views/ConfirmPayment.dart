import 'package:flutter/material.dart';
import 'package:ghosn_app/Features/Payment/presentation/views/Bill.dart';

import 'package:ghosn_app/Features/Payment/presentation/views/widgets/PaymentDate.dart';
import 'package:ghosn_app/Features/Payment/presentation/views/widgets/SpaceRow.dart';
import 'package:ghosn_app/core/utils/style.dart';
import 'package:ghosn_app/core/widgets/custom_button.dart';

class ConfirmPayment extends StatelessWidget {
  final PaymentData paymentData;
  ConfirmPayment({Key? key, required this.paymentData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Expanded(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Confirm Payment'),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
            child: Column(
              children: [
                const SpaceBetweenRow(
                  label: 'Date',
                  value: '26jan2025',
                ),
                SpaceBetweenRow(
                  label: 'Address',
                  value: paymentData.address,
                ),
                SpaceBetweenRow(
                  label: 'Payment Method',
                  value: paymentData.paymentMethod,
                ),
                SpaceBetweenRow(
                  label: 'Phone Number',
                  value: paymentData.phoneNumber,
                ),
                const SpaceBetweenRow(
                  label: 'Total Amount',
                  value: '123',
                ),
                SizedBox(height: height * .04),
                Center(
                  child: CustomButton(
                    text: "Confirm",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Bill(paymentData: paymentData),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: height * .08),
                const Center(
                    child: Text(
                  "Help",
                  style: Styles.textStyle16Intergreen,
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
