import 'package:flutter/material.dart';
import 'package:ghosn_app/constants.dart';
import 'package:ghosn_app/core/utils/style.dart';

class CustompayTextField extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  
  final bool obscureText;
  final TextInputType keyboardType;

  CustompayTextField({
    required this.labelText,
    required this.controller,
    
    this.obscureText = false,
    this.keyboardType = TextInputType.text, required String? Function(dynamic value) validator,
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
        SizedBox(height: 8),
        Container(
          height: 48,
       decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      
      ),
          child: TextField(
            controller: controller,
            obscureText: obscureText,
            keyboardType: keyboardType,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: kGreenColor, width: 2.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: Colors.black,width: 2.0),
              ),
 
        
               contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
            ),
          ),
        ),
      ],
    );
  }
}