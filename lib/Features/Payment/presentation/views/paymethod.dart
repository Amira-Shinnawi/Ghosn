import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:ghosn_app/Features/Payment/presentation/views/payment_datails.dart';
import 'package:ghosn_app/core/utils/style.dart';
import 'package:ghosn_app/core/widgets/custom_appbar.dart';
import 'package:ghosn_app/core/widgets/custom_button.dart';
import 'package:ghosn_app/core/widgets/custom_dropdown.dart';
import 'package:ghosn_app/core/widgets/custom_payment_textfield.dart';

class PaymentPage extends StatefulWidget {
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
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
    return Scaffold(
      appBar: custom_appbar(title: "Payment Page"),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const Text(
                'Date: 26 January 2024',
                style: Styles.textStyle16Inter,
              ),
              const SizedBox(height: 24),
              CustomDropdown(
                labelText: 'Address',
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
              const SizedBox(height: 24),
              CustompayTextField(
                labelText: 'Street:',
                controller: _addressController,
                keyboardType: TextInputType.streetAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your street address';
                  }
                },
              ),
              const SizedBox(height: 24),
              CustompayTextField(
                labelText: 'Phone Number:',
                controller: _phoneNumberController,
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your phone number';
                  }
                },
              ),
              const SizedBox(height: 24),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const SizedBox(
                    height: 8), // Add space between label and DropdownButton
                const Text(
                  'Payment Method',
                  style: Styles.textStyle16Inter,
                ),
                const SizedBox(height: 8),

                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: DropdownButtonFormField<String>(
                    value: _paymentMethod,
                    onChanged: (value) {
                      setState(() {
                        _paymentMethod = value!;
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select a payment method';
                      }
                      return null;
                    },
                    items: _paymentMethodChoices.map((choice) {
                      return DropdownMenuItem<String>(
                        value: choice,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8, right: 8),
                          child: Text(choice, style: Styles.textStyle16Inter),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ]),
              const SizedBox(height: 60),
              CustomButton(
                text: 'Pay',
                onPressed: () {
                  if (_formKey.currentState?.validate() == true) {
                    // All form fields are valid, proceed with your logic
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RadioListTitleWidget(
                            selectedPaymentMethod: _paymentMethod,
                            address: '$_country, $_state, $_city',
                            phoneNumber: _phoneNumberController.text,
                            street: _addressController.text),
                      ),
                    );
                  } else {
                    // Form fields are not valid, show an error message or handle accordingly
                    print("Please fill in all required fields.");
                  }
                },
                width: 300,
                fontSize: 10,
              ),
              const SizedBox(height: 60),
              const Text("Help", style: Styles.textStyle16Intergreen)
            ],
          ),
        ),
      ),
    );
  }
}
