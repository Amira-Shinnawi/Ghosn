import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ghosn_app/constants.dart';
import 'package:ghosn_app/core/utils/style.dart';

class CustompayTextField extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  
  final bool obscureText;
  final TextInputType keyboardType;
   

  const CustompayTextField({super.key, 
    required this.labelText,
    required this.controller,
   
    
    this.obscureText = false,
    this.keyboardType = TextInputType.text, 
  });
   

  @override
  Widget build(BuildContext context) {
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: Styles.textStyle16Inter,
          
        ),
        const SizedBox(height: 8),
        Container(
          height: 58,
       decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      
      ),
          child: Container(
            padding: EdgeInsets.symmetric(vertical:3, horizontal: 2),

            child: TextFormField(
              controller: controller,
              obscureText: obscureText,
              keyboardType: keyboardType,
               
              
                  style: Styles.textStyle22Inter.copyWith(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                validator: (value) {
                    if (value == null || value.isEmpty) {
            return 'Please enter $labelText';
                    }
                    return null;
                  },
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: kGreenColor, width: 2.5),
                ),
              enabledBorder:OutlineInputBorder (
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: Colors.black,width: 2.5),
                
                ),
                 errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: Colors.red, width: 2.5),
                 
                ),
                focusedErrorBorder: new OutlineInputBorder(
               borderRadius:   BorderRadius.circular(30),
              borderSide: new BorderSide(color: Colors.red, width: 2.5),
                    ),
             
                    
                //  contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal:15),
                 
              ),
            ),
          ),
        ),
      ],
    );
  }
}