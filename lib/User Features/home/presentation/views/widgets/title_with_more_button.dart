import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/style.dart';

class TitleWithMoreButton extends StatelessWidget {
  const TitleWithMoreButton({
    super.key,
    required this.title,
    required this.morePressed,
  });

  final String title;
  final Function() morePressed;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double blockWidth = (width / 100);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: blockWidth * 5),
      child: Row(
        children: [
          Text(
            title,
            style: Styles.textStyle18Inter,
          ),
          const Spacer(),
          MaterialButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            onPressed: morePressed,
            color: kGreenColor,
            child: const Text(
              "Filter",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
