import 'package:flutter/material.dart';
import 'package:ghosn_app/core/utils/style.dart';

// class Payment_Method_RadioButton extends StatefulWidget {
//   final String title;
//   final int value;
//   final int groupValue;
//   final Function(int?) onChanged;
//   final String imagePath;

//   const Payment_Method_RadioButton({
//     Key? key,
//     required this.title,
//     required this.value,
//     required this.groupValue,
//     required this.onChanged,
//     required this.imagePath,
//   }) : super(key: key);

//   @override
//   _PaymentMethodState createState() => _PaymentMethodState();
// }

// class _PaymentMethodState extends State<Payment_Method_RadioButton> {
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: RadioListTile<int>(
//         title: Text(widget.title, style: Styles.textStyle18Inter,),
//         value: widget.value,
//         groupValue: widget.groupValue,
//         onChanged: widget.onChanged,
//       ),
//     );
//   }
// }
// class Payment_Method_RadioButton extends StatefulWidget {
//   final String title;
//   final int value;
//   final int groupValue;
//   final Function(int?) onChanged;
//   final String imagePath;

//   const Payment_Method_RadioButton({
//     Key? key,
//     required this.title,
//     required this.value,
//     required this.groupValue,
//     required this.onChanged,
//     required this.imagePath,
//   }) : super(key: key);

//   @override
//   _PaymentMethodState createState() => _PaymentMethodState();
// }

// class _PaymentMethodState extends State<Payment_Method_RadioButton> {
//   @override
//   Widget build(BuildContext context) {
// //     return SizedBox(
// //       height: 50, // Set a fixed height for the row
// //       child: Row(
// //         children: [
// //           Radio<int>(
// //             value: widget.value,
// //             groupValue: widget.groupValue,
// //             onChanged: widget.onChanged,
// //           ),
        
// //           //  Expanded(
// //             //  child:   
// //              Expanded(
// //                child: Row(
// //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                 children: [
// //                   Text(
// //                     widget.title,
// //                     style: Styles.textStyle18Inter,
// //                   ),
                 
// //                   Image.asset(
// //                     widget.imagePath,
// //                     width: 90, // Adjust the width as needed
// //                     height: 80, // Adjust the height as needed
// //                   ),
// //                 ],
// //                         //  ),
// //                           ),
// //              ),
         
// //         ],
// //       ),
// //     );
// //   }
// // }
class Payment_Method_RadioButton extends StatefulWidget {
  final String title;
  final int value;
  final int groupValue;
  final Function(int?) onChanged;
  final String imagePath;

  const Payment_Method_RadioButton({
    super.key,
    required this.title,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.imagePath,
  });

  @override
  _PaymentMethodState createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<Payment_Method_RadioButton> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Radio<int>(
            value: widget.value,
            groupValue: widget.groupValue,
            onChanged: widget.onChanged,
          ),
        
           Expanded(
             child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.title,
                  style: Styles.textStyle18Inter,
                ),
               
                Image.asset(
                  widget.imagePath,
                  width: 90, // Adjust the width as needed
                  height: 80, // Adjust the height as needed
                ),
              ],
                       ),
           ),
         
        ],
      ),
    );
  }
}

