import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ghosn_app/Features/Payment/data/model/payment_date_model.dart';
import 'package:ghosn_app/Features/Payment/presentation/views/payment_datails.dart';
import 'package:ghosn_app/constants.dart';
import 'package:ghosn_app/core/widgets/custom_dropdown.dart';
import 'package:ghosn_app/core/widgets/custom_text_field.dart';

import '../../../../../core/utils/style.dart';
import '../../../../../core/widgets/custom_button.dart';

class PaymentMethodBody extends StatefulWidget {
  const PaymentMethodBody({super.key});

  @override
  _PaymentMethodBody createState() => _PaymentMethodBody();
}

class _PaymentMethodBody extends State<PaymentMethodBody> {
  final _formKey = GlobalKey<FormState>();
  final _streetController = TextEditingController();
  final _phoneNumberController = TextEditingController();

  late PaymentDataModel paymentData;

  @override
  void initState() {
    super.initState();
    paymentData = PaymentDataModel(
      street: '',
      phoneNumber: '',
      country: '',
      state: '',
      city: '',
    );
  }

  String getAddress() {
    return '${paymentData.street}, ${paymentData.country}, ${paymentData.state}, ${paymentData.city}';
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomDropdown(
              labelText: 'Address',
              value: paymentData.country,
              items: const [],
              onChanged: (String? value) {},
              child: CSCPicker(
                onCountryChanged: (value) {
                  setState(() {
                    paymentData.country = value.toString();
                  });
                },
                onStateChanged: (value) {
                  setState(() {
                    paymentData.state = value.toString();
                  });
                },
                onCityChanged: (value) {
                  setState(() {
                    paymentData.city = value.toString();
                  });
                },
              ),
            ),
            SizedBox(height: height * .024),
            const Text(
              'Street',
              style: Styles.textStyle20Inter,
            ),
            SizedBox(height: height * .008),
            CustomTextFelid(
              hinText: 'Street',
              controller: _streetController,
              keyboardType: TextInputType.streetAddress,
              width: 1,
              color: Colors.black,
            ),
            SizedBox(height: height * .024),
            const Text(
              'Phone Number',
              style: Styles.textStyle20Inter,
            ),
            SizedBox(height: height * .008),
            CustomTextFelid(
              hinText: 'Phone Number',
              controller: _phoneNumberController,
              keyboardType: TextInputType.phone,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              width: 1,
              color: Colors.black,
            ),
            SizedBox(height: height * .024),
            SizedBox(height: height * .05),
            Center(
              child: CustomButton(
                text: 'Pay',
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    paymentData = PaymentDataModel(
                      street: _streetController.text,
                      phoneNumber: _phoneNumberController.text,
                      country: paymentData.country,
                      state: paymentData.state,
                      city: paymentData.city,
                    );
                    // Navigate to the next page with paymentData
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RadioListTitleWidget(
                          paymentData: paymentData,
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
            SizedBox(height: height * .05),
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
