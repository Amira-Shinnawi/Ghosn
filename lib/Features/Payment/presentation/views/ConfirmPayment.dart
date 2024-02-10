

// import 'package:flutter/material.dart';
// import 'package:ghosn_app/core/utils/style.dart';
// import 'package:ghosn_app/core/widgets/custom_dash_line.dart';





// class Bill extends StatelessWidget {
//   const Bill(
//       {super.key,
//       required this.address,
//       required this.phoneNumber,
//       required this.paymentMethod, required this.street
//       });

//   final String address;
//   final String phoneNumber;
//   final String paymentMethod;
//   final String street;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: custom_appbar(title: "Payment Bill"),

//       body: Container(
//         color: Colors.grey[200],
//         padding: const EdgeInsets.only(top: 40),
//         child: Stack(
//           clipBehavior: Clip.none,
//           children: [
//             Padding(
//                 padding:  const EdgeInsets.all(20),
//                 child: Container(
//                   decoration: ShapeDecoration(
//                     color: Colors.white,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(11),
//                     ),
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.only(
//                       top: 60,
//                     ),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         const Center(
//                           child: Text("Thank You",
//                               style: Styles.textStyle20Inter,
//                               textAlign: TextAlign.center),
//                         ),
//                         const SizedBox(
//                           height: 24,
//                         ),
//                         const Text("Payment was completed successfully",
//                             style: Styles.textStyle18Intergray,
//                             textAlign: TextAlign.center),
//                         const SizedBox(
//                           height: 32,
//                         ),
//                         const dash_line(),
//                         const SizedBox(
//                           height: 45,
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(left: 20, right: 20),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               const Text(
//                                 "Total Paid Amount:",
//                                 textAlign: TextAlign.start,
//                                 style: Styles.textStyle20Inter,
//                               ),
//                               const SizedBox(
//                                 height: 14.5,
//                               ),
//                               const Text(
//                                 "123",
//                                 style: Styles.textStyle18Intergray,
//                               ),
//                               const SizedBox(
//                                 height: 32,
//                               ),
//                               const Text(
//                                 "Phone Number:",
//                                 style: Styles.textStyle20Inter,
//                               ),
//                               const SizedBox(
//                                 height: 14.5,
//                               ),
//                               Text(
//                                 phoneNumber,
//                                 style: Styles.textStyle18Intergray,
//                               ),
//                               const SizedBox(
//                                 height: 32,
//                               ),
//                               const Text(
//                                 "Address:",
//                                 style: Styles.textStyle20Inter,
//                               ),
//                               const SizedBox(
//                                 height: 14.5,
//                               ),
//                               Text(
//                                 address+ "-"+street,
//                                 style: Styles.textStyle18Intergray,
//                               ),
//                               const SizedBox(
//                                 height: 32,
//                               ),
//                               const Text(
//                                 "Name:",
//                                 style: Styles.textStyle20Inter,
//                               ),
//                               const SizedBox(
//                                 height: 14.5,
//                               ),
//                               const Text(
//                                 "esraa",
//                                 style: Styles.textStyle18Intergray,
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
                  
                  
//                 )),
//             const Positioned(
//               top: -30,
//               left: 0,
//               right: 0,
//               child: CircleAvatar(
//                 backgroundColor: Colors.white,
//                 radius: 50,
//                 child: CircleAvatar(
//                   backgroundColor: Color(0xFFB1E98E),
//                   radius: 40,
//                   child: Icon(
//                     Icons.check,
//                     color: Colors.white,
//                     size: 75,
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(
//               height: 15,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:ghosn_app/Features/Payment/presentation/views/Bill.dart';
import 'package:ghosn_app/Features/Payment/presentation/views/widget/PaymentDate.dart';
import 'package:ghosn_app/Features/Payment/presentation/views/widget/SpaceRow.dart';
import 'package:ghosn_app/core/utils/style.dart';
import 'package:ghosn_app/core/widgets/custom_button.dart';
import 'package:ghosn_app/core/widgets/custom_dash_line.dart';


class ConfirmPayment extends StatelessWidget {
  final PaymentData paymentData; 
  ConfirmPayment({Key? key, required this.paymentData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     double height = MediaQuery.of(context).size.height;
      return SafeArea(
      child: Expanded(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Confirm Payment'),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
            child: Column(
              children: [
                 const SpaceBetweenRow(
                
                 label: 'Date', value: '26jan2025',
                ),
               
                SpaceBetweenRow(label: 'Address', value: paymentData.address,
              
                ),
                     
                SpaceBetweenRow(label: 'Payment Method', value: paymentData.paymentMethod,
               
                ),
                     
                SpaceBetweenRow(label: 'Phone Number', value: paymentData.phoneNumber,
               
                ),
              
                const SpaceBetweenRow(
               
                  label: 'Total Amount', value: '123',
                ),
                SizedBox(height: height*.04),
                    
                 Center(child: CustomButton(text: "Confirm",
                onPressed: () {
                                 Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => Bill(paymentData: paymentData),
  ),
);
                  
                },
  
   
                ),
                
              
                ),
                SizedBox(height: height*.08),
                const Center(child: Text("Help",style: Styles.textStyle16Intergreen,))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
