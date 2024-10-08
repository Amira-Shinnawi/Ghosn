import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/style.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../translations/local_keys.g.dart';

class TotalAmount extends StatefulWidget {
  const TotalAmount({
    super.key,
    this.onPressed,
    required this.totalAmount,
  });
  final void Function()? onPressed;
  final String totalAmount;
  @override
  State<TotalAmount> createState() => _TotalAmountState();
}

class _TotalAmountState extends State<TotalAmount> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double blockHeight = (height / 100);
    double blockWidth = (width / 100);
    return Column(children: [
      Container(
        width: blockWidth * 80,
        height: blockHeight * 5,
        decoration: BoxDecoration(
          color: kGreenColor.withOpacity(0.3),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: blockWidth * 4),
                child: Text(
                  LocaleKeys.TotalAmount.tr(),
                  style: Styles.textStyle16Inter.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Container(
              width: blockWidth * 30,
              height: blockHeight * 5,
              decoration: BoxDecoration(
                color: kGreenColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: Text(
                    '${widget.totalAmount} LE',
                    maxLines: 1,
                    overflow: TextOverflow.clip,
                    style: Styles.textStyle22Inter.copyWith(
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      CustomButton(
          text: LocaleKeys.Checkout.tr().toUpperCase(),
          onPressed: widget.onPressed),
    ]);
  }
}
