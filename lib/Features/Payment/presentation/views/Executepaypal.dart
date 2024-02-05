import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:ghosn_app/Features/Payment/data/model/amount_model/amount_model.dart';
import 'package:ghosn_app/Features/Payment/data/model/item_list_model/item_list_model.dart';
import 'package:ghosn_app/core/utils/Api_Key.dart';

void ExecutePaypal(BuildContext context, ({AmountModel amount, ItemListModel itemlist}) transactionData) {
        Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) => PaypalCheckoutView(
        sandboxMode: true,
        clientId: ApiKeys.clientID,
        secretKey: ApiKeys.paypal_secretKey,
        transactions:  [
          {
            "amount": transactionData.amount.toJson(),
            "description": "The payment transaction description.",
            // "payment_options": {
            //   "allowed_payment_method":
            //       "INSTANT_FUNDING_SOURCE"
            // },
            "item_list": transactionData.itemlist.toJson(),
                }
              ],
               note: "Contact us for any questions on your order.",
        onSuccess: (Map params) async {
          log("onSuccess: $params");
          Navigator.pop(context);
        },
        onError: (error) {
          log("onError: $error");
          Navigator.pop(context);
        },
        onCancel: () {
          print('cancelled:');
          Navigator.pop(context);
        },
      ),
    ));
      }