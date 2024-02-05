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
      appBar: 
      AppBar(
        
      )
      // CustomAppBar(title: "Payment Page")
      ,
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
   validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter Address';
        }
        return null;
      },
  
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
              controller:_addressController ,
              keyboardType: TextInputType.streetAddress,
            
            ),
            
            const SizedBox(height: 24),
           
            CustompayTextField(
              labelText: 'Phone Number:',
              controller: _phoneNumberController,
              keyboardType: TextInputType.phone,
             
            ),
            
            const SizedBox(height: 24),
           Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    const SizedBox(height: 8), // Add space between label and DropdownButton
    const Text(
      'Payment Method',
      style: Styles.textStyle16Inter,
    ),
    const SizedBox(height: 8),
    

 
  //          Container(
  //           decoration: BoxDecoration(
  //   border: Border.all(
  //     color: Colors.black,
  //     width: 2.0,
  //   ),
  //      borderRadius: BorderRadius.circular(30),
  // ),
             DropdownButtonFormField<String>(
                value: _paymentMethod,
                decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey[100],
       
        labelStyle: TextStyle(
          color: Colors.grey[500],
        ),
        enabledBorder: OutlineInputBorder(
          
           borderRadius: BorderRadius.circular(30),
           borderSide: BorderSide(color: Colors.black,width:2.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(
            color: Colors.black,
            width:2.5,
          ),
        ),
         contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal:15),
      ),
                onChanged: (value) {
                  setState(() {
                    _paymentMethod = value!;
                  });
                },
                 icon: Icon(Icons.arrow_drop_down),
      iconSize: 24,
                
                items: _paymentMethodChoices.map((choice) {
                  return  DropdownMenuItem<String>(
                      value: choice,
                      child: Padding(
                              padding: EdgeInsets.only(left: 8, right: 8),
                              child: Text(choice,
                               style: Styles.textStyle16Inter
                              ),
                            ),
                    );
                  
                  
                  
                }).toList(),
             ),
          //  ),
           
          ]),
        
            
            
           
    
            const SizedBox(height:60),
          CustomButton(
              text: 'Pay',
              
              
            onPressed: () {
                    if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                        // builder: (context) => 
                        Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return  RadioListTitleWidget(selectedPaymentMethod: _paymentMethod,
                            address: '$_country, $_state, $_city',
                            phoneNumber: _phoneNumberController.text,
                            street:_addressController.text
                      );
                }));
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
