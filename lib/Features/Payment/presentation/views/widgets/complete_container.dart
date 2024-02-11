import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/style.dart';

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
      child: Center(
        child: Text(
          'Completed',
          style: Styles.textStyle22Inter.copyWith(
            fontSize: 14,
            color: kGreenColor,
          ),
        ),
      ),
    );
  }
}
