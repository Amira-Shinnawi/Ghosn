import 'package:csc_picker/csc_picker.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ghosn_app/Features/Payment/data/model/payment_date_model.dart';
import 'package:ghosn_app/Features/Payment/presentation/views/payment_datails.dart';
import 'package:ghosn_app/constants.dart';
import 'package:ghosn_app/core/widgets/custom_dropdown.dart';
import 'package:ghosn_app/core/widgets/custom_text_field.dart';

import '../../../../../core/utils/style.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../translations/local_keys.g.dart';

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
    double width = MediaQuery.of(context).size.width;

    double blocHeight = (height / 100);
    double blocWidth = (width / 100);
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
          vertical: blocHeight * 4, horizontal: blocWidth * 4),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomDropdown(
              labelText: LocaleKeys.address.tr(),
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
            SizedBox(height: blocHeight * 2),
            Text(
              LocaleKeys.street.tr(),
              style: Styles.textStyle20Inter,
            ),
            SizedBox(height: blocHeight * 2),
            CustomTextFelid(
              hinText: LocaleKeys.street.tr(),
              controller: _streetController,
              keyboardType: TextInputType.streetAddress,
              width: 1,
              color: Colors.black,
            ),
            SizedBox(height: blocHeight * 4),
            Text(
              LocaleKeys.phoneNumber.tr(),
              style: Styles.textStyle20Inter,
            ),
            SizedBox(height: blocHeight * 2),
            CustomTextFelid(
              hinText: LocaleKeys.phoneNumber.tr(),
              controller: _phoneNumberController,
              keyboardType: TextInputType.phone,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              width: 1,
              color: Colors.black,
            ),
            SizedBox(height: blocHeight * 8),
            Center(
              child: CustomButton(
                text: LocaleKeys.Pay.tr(),
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
            SizedBox(height: blocHeight * 3),
            Center(
              child: Text(
                LocaleKeys.help.tr(),
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
