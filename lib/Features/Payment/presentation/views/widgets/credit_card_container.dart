import 'package:flutter/material.dart';

import '../../../../../core/utils/style.dart';

class CreditCardContainer extends StatelessWidget {
  const CreditCardContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      width: 366,
      height: 87,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(250, 246, 246, 1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: const Color.fromRGBO(229, 220, 220, 1),
          width: 1.0,
        ),
      ),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width * .05,
            ),
            child: Image.asset(
              'assets/images/mascard.png',
              width: 60,
              height: 34,
            ),
          ),
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Credit Card",
                style: Styles.textStyle18Inter,
              ),
              Text(
                "Master Card",
                style: Styles.textStyle18Intergray,
              ),
            ],
          )
        ],
      ),
    );
  }
}
