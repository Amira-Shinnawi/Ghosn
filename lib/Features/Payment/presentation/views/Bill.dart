import 'package:flutter/material.dart';

import 'package:ghosn_app/Features/Payment/presentation/views/widget/PaymentDate.dart';
import 'package:ghosn_app/Features/Payment/presentation/views/widget/SpaceColumn.dart';

import 'package:ghosn_app/constants.dart';
import 'package:ghosn_app/core/utils/style.dart';



class Bill extends StatelessWidget {
  final PaymentData paymentData;
  const Bill({Key? key, required this.paymentData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width= MediaQuery.of(context).size.width;
    return SafeArea(
      child: Expanded(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Bill Payment'),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SpaceColumn(
                  label: 'Date:',
                  value: '26jan2025',
                ),
                SizedBox(height: height*.022),
                SpaceColumn(
                  label: 'Name:',
                  value: "Esraa",
                ),
                SizedBox(height: height*.022),
                SpaceColumn(
                  label: 'Address:',
                  value: paymentData.address,
                ),
                SizedBox(height: height*.022),
                SpaceColumn(
                  label: 'Phone Number:',
                  value: paymentData.phoneNumber,
                ),
                 SizedBox(height: height*.022),
                //  SpaceColumn(label: 'Payment Method', value: paymentData.paymentMethod,
                Row(
                  children: [
                    SpaceColumn(
                      label: 'Total Amount:',
                      value: '123',
                    ),
                    const Expanded(
                        child: SizedBox(
                      width: 73,
                    )),
                    const CompletedContainer(),
                  ],
                ),

               

                SizedBox(height: height*.040),
                CreditCardContainer(width: width),
                SizedBox(height: height*.035),
                 const Center(
                   child: Text("Please keep a copy of this receipt via a screenshot until needed when receiving the order to ensure user rights.",
                                   style: Styles.textStyle16Intergray,
                                   
                                   ),
                 )

                

             
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CreditCardContainer extends StatelessWidget {
  const CreditCardContainer({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width:366 ,
      height: 87,
       decoration: BoxDecoration(
            color: const Color.fromRGBO(250, 246, 246, 1),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color:const Color.fromRGBO(229, 220, 220, 1)
            , width: 1.0),
          ),
          child: Row(children: [
            Image.asset('assets/images/mascard.png',  width: 100,
            height: 100,),
            SizedBox(width:width*.013 ,),
            const Padding(
              padding: EdgeInsets.only(top: 17),
              child: Column(
              
                children: [
                  Text("Credit Card",style:Styles.textStyle18Inter,),
                   Text("Master Card",style:Styles.textStyle18Intergray,),
                ],
              ),
            )
    
    
          ],),
    );
  }
}

class CompletedContainer extends StatelessWidget {
  const CompletedContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 116,
      height: 39,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(40),
        border: Border.all(color: kGreenColor, width: 1.0),
      ),
      child: const Center(
        child: Text(
          'Completed',
          style: TextStyle(
              fontSize: 14,
              color: kGreenColor,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
