import 'package:flutter/material.dart';
import 'package:ghosn_app/core/utils/style.dart';

class CustomDropdown extends StatefulWidget {
  final Widget child;
  final String labelText;
    final FormFieldValidator<String>? validator;

  CustomDropdown({required this.child,required this.labelText, this.validator});

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  bool isOpen = false;
   

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
   
       children: [
        Text(
          widget.labelText,
          style:Styles.textStyle16Inter,),
         const SizedBox(height: 8),
        GestureDetector(
          onTap: () {
            setState(() {
              isOpen = !isOpen;
            });
          },
         
          child: Container(
            height: 57,

            decoration: BoxDecoration(
        color: Colors.white,
         border: Border.all(color: const Color.fromARGB(255, 0, 0, 0),width: 2.5),
        borderRadius: BorderRadius.circular(30),
    
      ),
          
            padding: EdgeInsets.symmetric(vertical: 13, horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Select', style:TextStyle(fontWeight:FontWeight.w500) ,),
                Icon(Icons.arrow_drop_down),
              ],
            ),
          ),
        ),
        if (isOpen)
          Container(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              
            child: widget.child,
          ),
       
      ],
    );
  }
}
