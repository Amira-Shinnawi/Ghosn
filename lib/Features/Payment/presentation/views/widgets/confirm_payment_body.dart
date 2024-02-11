import 'package:flutter/material.dart';
import 'package:ghosn_app/Features/Payment/presentation/views/bill.dart';
import 'package:ghosn_app/core/widgets/space_row.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/style.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../data/model/payment_date_model.dart';

class ConfirmPaymentBody extends StatelessWidget {
  const ConfirmPaymentBody({super.key, required this.paymentData});
  final PaymentDataModel paymentData;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(top: height * 0.064, left: 24, right: 24),
        child: Column(
          children: [
            const SpaceBetweenRow(
              label: 'Date',
              value: '26jan2025',
            ),
            SizedBox(
              height: height * .024,
            ),
            SpaceBetweenRow(
              label: 'Address',
              value: paymentData.address,
            ),
            SizedBox(
              height: height * .024,
            ),
            SpaceBetweenRow(
              label: 'Payment Method',
              value: paymentData.paymentMethod,
            ),
            SizedBox(
              height: height * .024,
            ),
            SpaceBetweenRow(
              label: 'Phone Number',
              value: paymentData.phoneNumber,
            ),
            SizedBox(
              height: height * .024,
            ),
            const SpaceBetweenRow(
              label: 'Total Amount',
              value: '123 EGP',
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
            SizedBox(height: height * .1),
            Center(
              child: Text(
                'Help',
                style: Styles.textStyle22Inter.copyWith(
                  fontSize: 16,
                  color: kGreenColor,
                  decoration: TextDecoration.underline,
                  decorationColor: kGreenColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
