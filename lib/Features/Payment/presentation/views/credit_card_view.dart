// import 'package:flutter/material.dart';
// import 'package:ghosn_app/Features/Payment/presentation/views/Bill.dart';
// import 'package:ghosn_app/Features/Payment/presentation/views/widget/credit_card.dart';
// import 'package:ghosn_app/core/widgets/custom_button.dart';

// class CreditCard_View extends StatefulWidget {
//     final String selectedPaymentMethod;
//    final String address;
//   final String phoneNumber;
//   final String street;
//   const CreditCard_View({super.key, required this.selectedPaymentMethod, required this.address, required this.phoneNumber, required this.street});

//   @override
//   State<CreditCard_View> createState() => _CreditCard_ViewState();
// }

// class _CreditCard_ViewState extends State<CreditCard_View> {
//    final GlobalKey<FormState> formKey=GlobalKey();
//   AutovalidateMode autovalidateMode =AutovalidateMode.disabled;
   
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: 
//     Column(
//       children: [
      
//          CreditCard(formKey: formKey, autovalidateMode: autovalidateMode,),
          
//              CustomButton(
//       text: 'Pay Now',
//       onPressed:(){
//         if(formKey.currentState!.validate()){
//           formKey.currentState!.save();
//           Navigator.of(context).push(MaterialPageRoute(builder: (context){
//             return Bill(   paymentMethod: widget.selectedPaymentMethod,
//                           address: widget.address,
//                       phoneNumber: widget.phoneNumber,
//                       street:widget.street,);
//           }
//           )
//           );
          
//         }
//         else{
//           autovalidateMode=AutovalidateMode.always;
//           setState(() {
            
//           });
//         }

//       },
              
            
//             ),

//       ],
//     )
//     );
//   }
// }