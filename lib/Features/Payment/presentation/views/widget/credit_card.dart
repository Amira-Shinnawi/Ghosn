import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class CreditCard extends StatefulWidget {
 
    const CreditCard({super.key, required this.formKey, required this.autovalidateMode});
   final GlobalKey<FormState> formKey;
    final AutovalidateMode autovalidateMode;

  @override
  State<CreditCard> createState() => _CreditCardState();
}

class _CreditCardState extends State<CreditCard> {
      
  String cardNumber='',
    expiryDate='',
     cardHolderName='',
     cvvCode='';
   
    // final GlobalKey<FormState> formKey=GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CreditCardForm(cardNumber: cardNumber,
         expiryDate: expiryDate,
          cardHolderName: cardHolderName,
           cvvCode: cvvCode, 
           autovalidateMode: widget.autovalidateMode,
          
           onCreditCardModelChange:(CreditCardModel){
            cardNumber=CreditCardModel.cardNumber;
            cardHolderName=CreditCardModel.cardHolderName;
            expiryDate=CreditCardModel.expiryDate;
            cvvCode=CreditCardModel.cvvCode;
         
          
            
            setState(() {
              
            });

           },
            formKey: widget.formKey,
            obscureCvv: true, // Set to true if you want to obscure CVV
          obscureNumber: true,
         

       
        
        ),
      ],
    );
  }
}
         