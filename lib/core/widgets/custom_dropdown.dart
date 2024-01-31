import 'package:flutter/material.dart';
import 'package:ghosn_app/core/utils/style.dart';

class CustomDropdown extends StatefulWidget {
  final Widget child;
  final String labelText;

  CustomDropdown({required this.child,required this.labelText});

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  bool isOpen = false;
   

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      // children: [
      //   GestureDetector(
      //     onTap: () {
      //       setState(() {
      //         isOpen = !isOpen;
      //       });
      //     },
       children: [
        Text(
          widget.labelText,
          style:Styles.textStyle16Inter,),
         SizedBox(height: 8),
        GestureDetector(
          onTap: () {
            setState(() {
              isOpen = !isOpen;
            });
          },
            
           
        
          child: Container(
            decoration: BoxDecoration(
        color: Colors.white,
         border: Border.all(color: const Color.fromARGB(255, 0, 0, 0),width: 2.0),
        borderRadius: BorderRadius.circular(30),
      //   boxShadow: [
      //     BoxShadow(
      //       color: Colors.grey.withOpacity(0.5),
      //       spreadRadius: 2,
      //       blurRadius: 3,
      //       offset: Offset(0, 3),
      //     ),
      //   ],
      ),
            // decoration: BoxDecoration(
            //   borderRadius: BorderRadius.circular(20),
            //   border: Border.all(color: Colors.green),
            // ),
            padding: EdgeInsets.symmetric(vertical: 13, horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Select'),
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