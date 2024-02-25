import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/style.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../translations/local_keys.g.dart';

class TotalAmount extends StatelessWidget {
  const TotalAmount({
    super.key,
  });

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
                  style: Styles.textStyle18Inter.copyWith(
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
                    '150EGP',
                    maxLines: 1,
                    overflow: TextOverflow.clip,
                    style: Styles.textStyle22Inter.copyWith(
                      fontSize: 18,
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
        onPressed: () {
          GoRouter.of(context).push(AppRouter.kPaymentPage);
        },
      ),
    ]);
  }
}
