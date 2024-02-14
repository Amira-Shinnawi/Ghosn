import 'package:flutter/material.dart';
import 'package:ghosn_app/Features/Payment/presentation/views/widgets/check_out_body.dart';
import 'package:ghosn_app/Features/Payment/presentation/views/widgets/credit_card_container.dart';

import 'package:ghosn_app/core/widgets/custom_button.dart';
import 'package:ghosn_app/core/widgets/space_column.dart';

import '../../../../../core/utils/style.dart';
import '../../../data/model/payment_date_model.dart';
import 'complete_container.dart';

class BillPaymentBody extends StatelessWidget {
  const BillPaymentBody({
    super.key,
    required this.paymentData, 
  });

  final PaymentDataModel paymentData;
   

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
     

    return SingleChildScrollView(
      padding: EdgeInsets.only(top: height * 0.045, left: 24, right: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SpaceColumn(
                label: 'Date',
                value: '26jan2025',
              ),
              SpaceColumn(
                label: 'Time',
                value: '12:20:20',
              ),
            ],
          ),
          SizedBox(
            height: height * .024,
          ),
           const SpaceColumn(
            label: 'Name',
            value: "esraa"
          ),
          SizedBox(
            height: height * .024,
          ),
          SpaceColumn(
            label: 'Address',
            value: paymentData.address,
          ),
          SizedBox(
            height: height * .024,
          ),
          SpaceColumn(
            label: 'Phone Number',
            value: paymentData.phoneNumber,
          ),
          SizedBox(
            height: height * .024,
          ), //  SpaceColumn(label: 'Payment Method', value: paymentData.paymentMethod,
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SpaceColumn(
                label: 'Total Amount',
                value: '123 EGP',
              ),
              CompletedContainer(),
            ],
          ),
          SizedBox(height: height * .03),
          const CreditCardContainer(),
          SizedBox(height: height * .030),
          const Text(
            "Please keep a copy of this receipt via a screenshot until needed when receiving the order to ensure user rights.",
            style: Styles.textStyle16Intergray,
            textAlign: TextAlign.center,
          ),
           SizedBox(height: height * .015),
            CustomButton(text: "Done",
           onPressed: () {
               Navigator.push(
       context,
      MaterialPageRoute(builder: (context) => const CheckOutBody()),
     );
           },
           )
           
          
        ],
      ),
    );
  }
}
