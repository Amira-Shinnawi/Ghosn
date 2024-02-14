import 'package:flutter/material.dart';
import 'package:ghosn_app/Features/Payment/data/model/item_list_model/items.dart';
import 'package:ghosn_app/Features/Payment/data/model/payment_date_model.dart';
import 'package:ghosn_app/Features/Payment/presentation/views/confirm_payment.dart';
import 'package:ghosn_app/Features/Payment/presentation/views/widgets/payment_method_radio.dart';
import 'package:ghosn_app/core/utils/assets_data.dart';

import '../../../../../constants.dart';
import '../../../../../core/widgets/custom_button.dart';
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

                      var transactionData = getTransactionsDate();
                      ExecutePaypal(context, transactionData);
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
          height: height * .08,
        ),
        CustomButton(
          text: 'Pay Now',
          onPressed: () {
            if (formKey.currentState!.validate()) {
              formKey.currentState!.save();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ConfirmPayment(
                    paymentData: widget.paymentData,
                    paymentMethod:
                        selectedPaymentMethod == 0 ? 'Credit Card' : 'PayPal',
                  ),
                ),
              );
            } else {
              autovalidateMode = AutovalidateMode.always;
              setState(() {});
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
