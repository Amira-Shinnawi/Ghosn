import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:ghosn_app/Features/Payment/presentation/views/payment_datails.dart';

import 'package:ghosn_app/Features/Payment/presentation/views/widget/PaymentDate.dart';
import 'package:ghosn_app/core/utils/style.dart';
import 'package:ghosn_app/core/widgets/custom_appbar.dart';
import 'package:ghosn_app/core/widgets/custom_button.dart';
import 'package:ghosn_app/core/widgets/custom_dropdown.dart';
import 'package:ghosn_app/core/widgets/custom_payment_textfield.dart';
import 'package:ghosn_app/core/widgets/customdropDownItem.dart';

class PaymentPage extends StatefulWidget {
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final _formKey = GlobalKey<FormState>();
  final _streetController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final List<String> _paymentMethodChoices = ['Credit Card', 'PayPal'];
  
     late String _selectedPaymentMethod;
  late PaymentData paymentData;


    
  
 @override
  void initState() {
    super.initState();
     _selectedPaymentMethod = _paymentMethodChoices[0];
    paymentData = PaymentData(
      street: '',
      phoneNumber: '',
      paymentMethod: _paymentMethodChoices[0],
      country: '',
      state: '',
      city: '',
    );
     
 
    
      
  }
// late PaymentData paymentData;
 String getAddress() {
    return '${paymentData.street}, ${paymentData.country}, ${paymentData.state}, ${paymentData.city}';
  }

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
  
  
  value:  paymentData.country,
  items: [],
  onChanged: (String? value) {  },
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

            const SizedBox(height: 24),
             CustompayTextField(
              labelText: 'Street:',
              controller:_streetController,
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
    
    

 
    //  DropdownButtonFormField<String>(
    //             value:paymentData.paymentMethod,
    //             decoration: InputDecoration(
    //     filled: true,
    //     fillColor: Colors.grey[100],
       
    //     labelStyle: TextStyle(
    //       color: Colors.grey[500],
    //     ),
    //     enabledBorder: OutlineInputBorder(
          
    //        borderRadius: BorderRadius.circular(30),
    //        borderSide: BorderSide(color: Colors.black,width:2.5),
    //     ),
    //     focusedBorder: OutlineInputBorder(
    //       borderRadius: BorderRadius.circular(30),
    //       borderSide: BorderSide(
    //         color: Colors.black,
    //         width:2.5,
    //       ),
    //     ),
    //      contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal:15),
    //   ),
    //             onChanged: (value) {
    //               setState(() {
    //                 paymentData.paymentMethod = value!;
    //               });
    //             },
    //              icon: Icon(Icons.arrow_drop_down),
    //   iconSize: 24,
                
    //             items:  _paymentMethodChoices.map((choice) {
    //               return  DropdownMenuItem<String>(
    //                   value: choice,
    //                   child: Padding(
    //                           padding: EdgeInsets.only(left: 8, right: 8),
    //                           child: Text(choice,
    //                            style: Styles.textStyle16Inter
    //                           ),
    //                         ),
    //                 );
                  
                  
                  
    //             }).toList(),
    //          ),
          //  ),
                // const SizedBox(height: 24),
          //     CustomDropdown(
          //       labelText: 'Payment Method',
          //       value: _paymentMethodChoices[0], // Default value
          //       items: _paymentMethodChoices.map((String value) {
          //         return DropdownMenuItem<String>(
          //           value: _selectedPaymentMethod,
          //           child: Text(value),
          //         );
          //       }).toList(),
          //       onChanged: (String? value) {
          //         // Handle payment method change
          //       }, child:   Text(choice,
          //                      style: Styles.textStyle16Inter
          //                      ),
           
          // ),
  //           CustomDropdown(
  //               labelText: 'Payment Method',
  //               value: _selectedPaymentMethod, 
  //               items: _paymentMethodChoices.map((String value) {
  //                     return DropdownMenuItem<String>(
  //                       value: value,
  //                       child: Text(value),
  //            ); }).toList(),
  //  onChanged: (String? value) {
  // setState(() {
  //    _selectedPaymentMethod = value!;
  // });


  //               }, child: Container(),
  //             ),
  CustomDropdownItem<String>(
  labelText: 'Payment Method',
  value: paymentData.paymentMethod,
  items: _paymentMethodChoices.map((value) {
    return DropdownMenuItem<String>(
      value: value,
      child: Text(value),
    );
  }).toList(),
  validator: (String? value) {
    if (value == null || value.isEmpty) {
      return 'Please select a payment method';
    }
    return null;
  },
  onChanged: (String? value) {
    setState(() {
      paymentData.paymentMethod = value!;
    });
  },
 
),
        
        
            
            
           
    
            const SizedBox(height:60),
          CustomButton(
              text: 'Pay',
              
              
            // onPressed: () {
            //         if (_formKey.currentState!.validate()) {
            //         _formKey.currentState!.save();
            //         // Navigator.push(
            //         //   context,
            //         //   MaterialPageRoute(
            //             // builder: (context) => 
            //             Navigator.of(context)
            //         .push(MaterialPageRoute(builder: (context) {
            //       return  RadioListTitleWidget(selectedPaymentMethod: _paymentMethod,
            //                 address: '$_country, $_state, $_city',
            //                 phoneNumber: _phoneNumberController.text,
            //                 street:_addressController.text
            //           );
            //     }));
            //   } else {
            //         // Form fields are not valid, show an error message or handle accordingly
            //         print("Please fill in all required fields.");
            //       }
            //     },
             onPressed: () {
                  if (_formKey.currentState!.validate()) {
                   
                    // Construct PaymentData object with entered data
                    paymentData = PaymentData(
                      street: _streetController.text,
                      phoneNumber: _phoneNumberController.text,
                      paymentMethod: _selectedPaymentMethod,
                      country: paymentData.country,
                      state: paymentData.state,
                      city: paymentData.city,
                    );
                    // Navigate to the next page with paymentData
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RadioListTitleWidget(paymentData: paymentData,    selectedPaymentMethod: _selectedPaymentMethod,),
                      ),
                    );
                  }
                },
              ),
        
              const SizedBox(height: 60),
              const Text("Help", style: Styles.textStyle16Intergreen)
            ],
          ),
        ]),
      ),
    )
    );
  }
}
