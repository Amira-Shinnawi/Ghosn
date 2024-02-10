import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ghosn_app/Features/Payment/presentation/views/payment_datails.dart';
import 'package:ghosn_app/constants.dart';
import 'package:ghosn_app/core/widgets/custom_text_field.dart';

import '../../../../../core/utils/style.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_drop_down.dart';

class PaymentMethodBody extends StatefulWidget {
  const PaymentMethodBody({
    super.key,
  });
  @override
  State<PaymentMethodBody> createState() => _PaymentMethodBodyState();
}

class _PaymentMethodBodyState extends State<PaymentMethodBody> {
  
  final _formKey = GlobalKey<FormState>();
  String _paymentMethod = 'Visa';
  String _country = '';
  String _state = '';
  String _city = '';

  final _paymentMethodChoices = ['Visa', 'PayPal'];
  final _phoneNumberController = TextEditingController();
  final _addressController = TextEditingController();

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
            // const Text(
            //   'Date: 26 January 2024',
            //   style: Styles.textStyle16Inter,
            // ),
            // const SizedBox(height: 24),

            CustomDropdown(
              labelText: 'Address',
              controller: TextEditingController(
                text: '$_country, $_state, $_city',
              ),
              child: CSCPicker(
                onCountryChanged: (value) {
                  setState(() {
                    _country = value.toString();
                  });
                },
                onStateChanged: (value) {
                  setState(() {
                    _state = value.toString();
                  });
                },
                onCityChanged: (value) {
                  setState(() {
                    _city = value.toString();
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
              controller: _addressController,
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
            const Text(
              'Payment Method',
              style: Styles.textStyle20Inter,
            ),
            SizedBox(height: height * .008),
            DropdownButtonFormField(
              value: _paymentMethod,
              decoration: InputDecoration(
                filled: true,
                enabledBorder: builtOutLineBorder(),
                focusedBorder: builtOutLineBorder(),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              ),
              onChanged: (value) {
                setState(() {
                  _paymentMethod = value!;
                });
              },
              icon: const Icon(
                Icons.arrow_drop_down,
              ),
              items: _paymentMethodChoices.map((choice) {
                return DropdownMenuItem(
                  value: choice,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8),
                    child: Text(
                      choice,
                      style: Styles.textStyle20Inter.copyWith(
                        fontSize: 18,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: height * .05),
            Center(
              child: CustomButton(
                text: 'Pay',
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();

                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return RadioListTitleWidget(
                          selectedPaymentMethod: _paymentMethod,
                          address: '$_country, $_state, $_city',
                          phoneNumber: _phoneNumberController.text,
                          street: _addressController.text);
                    }));
                  } else {
                    // Form fields are not valid, show an error message or handle accordingly
                    print("Please fill in all required fields.");
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

  OutlineInputBorder builtOutLineBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: const BorderSide(width: 1),
    );
  }
}
