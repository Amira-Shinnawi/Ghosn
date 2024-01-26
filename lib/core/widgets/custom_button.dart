import 'package:flutter/material.dart';

import '../../constants.dart';
import '../utils/style.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.borderRadius,
    required this.text,
    this.fontSize,
    this.onPressed,
    this.width, this.backgroundColor,
  });
  final String text;
  final BorderRadius? borderRadius;
  final double? fontSize;
  final void Function()? onPressed;
  final double? width;
 final Color? backgroundColor;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 11.5),
      child: SizedBox(
        height: 50,
        width: width ?? 328,
        child: TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            backgroundColor:backgroundColor?? kGreenColor,
            shape: RoundedRectangleBorder(
              borderRadius: borderRadius ??
                  BorderRadius.circular(
                    40,
                  ),
            ),
          ),
          child: Text(
            text,
            style: Styles.textStyle22Inter,
          ),
        ),
      ),
    );
  }
}
