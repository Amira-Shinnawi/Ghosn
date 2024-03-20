import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ghosn_app/User%20Features/Payment/data/model/item_list_model/items.dart';
import 'package:ghosn_app/User%20Features/Payment/data/model/payment_date_model.dart';
import 'package:ghosn_app/User%20Features/Payment/presentation/views/confirm_payment.dart';
import 'package:ghosn_app/User%20Features/Payment/presentation/views/widgets/payment_method_radio.dart';
import 'package:ghosn_app/core/utils/assets_data.dart';

import '../../../../../constants.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../translations/local_keys.g.dart';
import '../../../data/model/amount_model/amount_model.dart';
import '../../../data/model/amount_model/details.dart';
import '../../../data/model/item_list_model/item_list_model.dart';
import '../execute_paypal.dart';
import 'credit_card.dart';

class PaymentDetailsBody extends StatefulWidget {
  const PaymentDetailsBody({
    super.key,
    required this.paymentData,
  });

  final PaymentDataModel paymentData;

  @override
  State<PaymentDetailsBody> createState() => _PaymentDetailsBodyState();
}

class _PaymentDetailsBodyState extends State<PaymentDetailsBody> {
  final GlobalKey<FormState> formKey = GlobalKey();
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  int? selectedPaymentMethod = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool showCreditCard = true;
    double height = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 58, 15, 15),
          child: Container(
            height: height * .09,
            decoration: ShapeDecoration(
              color: const Color(0xFFFAF6F6),
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  width: 2,
                  color: selectedPaymentMethod == 0 ? kGreenColor : kHintColor,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Row(
              children: [
               PaymentMethodRadioButton(
                  title: 'Credit Card',
                  value: 0,
                  groupValue: selectedPaymentMethod,
                  onChanged: (int? value) {
                    setState(() {
                      selectedPaymentMethod = value!;
                     
                    });
                  },
                  imagePath: AssetsData.visa,
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 16, 15, 15),
          child: Container(
            height: height * .09,
            decoration: ShapeDecoration(
              color: const Color(0xFFFAF6F6),
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  width: 2,
                  color: selectedPaymentMethod == 1 ? kGreenColor : kHintColor,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Row(
              children: [
               PaymentMethodRadioButton(
                  title: 'PayPal',
                  value: 1,
                  groupValue: selectedPaymentMethod,
                  onChanged: (int? value) {
                    setState(() {
                      selectedPaymentMethod = value!;

                    
                    });
                  },
                  imagePath: AssetsData.paypal,
                ),
              ],
            ),
          ),
        ),
        if (selectedPaymentMethod == 0)
          AnimatedCrossFade(
            duration: const Duration(milliseconds: 300),
            crossFadeState: showCreditCard
                ? CrossFadeState.showFirst
                // ignore: dead_code
                : CrossFadeState.showSecond,
            firstChild: CreditCard(
              formKey: formKey,
              autovalidateMode: autovalidateMode, 
            ),
            secondChild: SizedBox(
              height: height * .3,
            ),
          ),
        SizedBox(
          height: height * .1,
        ),
        CustomButton(
          text:  LocaleKeys.PayNow.tr(),
          onPressed: () async {
  if (selectedPaymentMethod == 0) {
    
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ConfirmPayment(
            paymentData: widget.paymentData,
            paymentMethod:  LocaleKeys.creditcard.tr(),
          ),
        ),
      );
    } else {
      // If form validation fails, enable auto validation and update the UI
      setState(() {
        autovalidateMode = AutovalidateMode.always;
      });
    }
  } else if (selectedPaymentMethod == 1) {
    // If PayPal is selected, process the PayPal transaction
    var transactionData = getTransactionsDate();
   
     bool transactionCompleted = await ExecutePaypal(
      context,
       paymentData: widget.paymentData,
    
      amount: transactionData.amount,
      itemlist: transactionData.itemlist,
    );
    if (!transactionCompleted) {
      // If PayPal transaction is completed, navigate to the confirmation page
 
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ConfirmPayment(
            paymentData: widget.paymentData,
            paymentMethod: 'PayPal',
          ),
        ),
      );
    } else {
      
      print("please complete the process");
    }
  }
},

          
        ),
      ]),
    );
  }
}

({AmountModel amount, ItemListModel itemlist}) getTransactionsDate() {
  var amount = AmountModel(
      total: "100",
      currency: "USD",
      details: Details(
        shipping: "0",
        shippingDiscount: 0,
        subtotal: "100",
      ));
  List<OrderItemModel> orders = [
    OrderItemModel(
      currency: "USD",
      name: "Apple",
      price: "4",
      quantity: 10,
    ),
    OrderItemModel(
      currency: "USD",
      name: "Apple",
      price: "5",
      quantity: 12,
    )
  ];
  var ItemList = ItemListModel(
    orders: orders,
  );
  return (
    amount: amount,
    itemlist: ItemList,
  );
}
