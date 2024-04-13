import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:ghosn_app/User%20Features/Payment/data/model/amount_model/amount_model.dart';
import 'package:ghosn_app/User%20Features/Payment/data/model/item_list_model/item_list_model.dart';
import 'package:ghosn_app/core/utils/Api_Key.dart';
import 'dart:async';

import '../../data/model/payment_date_model.dart';
import 'confirm_payment.dart';

Future<bool> ExecutePaypal(BuildContext context,
    {required PaymentDataModel paymentData,
    required AmountModel amount,
    required ItemListModel itemlist}) async {
  Completer<bool> completer = Completer<bool>();

  Navigator.of(context).push(MaterialPageRoute(
    builder: (BuildContext context) => PaypalCheckoutView(
      sandboxMode: true,
      clientId: ApiKeys.clientID,
      secretKey: ApiKeys.paypalSecretKey,
      transactions: [
        {
          "amount": amount.toJson(),
          "description": "The payment transaction description.",
          "item_list": itemlist.toJson(),
        }
      ],
      note: "Contact us for any questions on your order.",
      onSuccess: (Map params) async {
        log("onSuccess: $params");
        completer.complete(true); // Transaction completed successfully
        Navigator.pop(context); // Pop the PayPal view
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ConfirmPayment(
              paymentData: paymentData,
              paymentMethod: 'PayPal',
            ),
          ),
        );
      },
      onError: (error) {
        log("onError: $error");
        completer.complete(false); // Transaction failed
        Navigator.pop(context);
      },
      onCancel: () {
        print('cancelled:');
        completer.complete(false); // Transaction cancelled
        Navigator.pop(context);
      },
    ),
  ));

  return completer.future;
}
