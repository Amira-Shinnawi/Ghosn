import 'package:flutter/material.dart';
import 'package:ghosn_app/constants.dart';
import 'package:ghosn_app/core/utils/style.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    this.borderRadius,
    required this.text,
    this.fontSize,
    this.onPressed,
    this.width,
    this.childIcon,
  });
  final String text;
  final BorderRadius? borderRadius;
  final double? fontSize;
  final void Function()? onPressed;
  final double? width;
  final Widget? childIcon;
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
            backgroundColor: kGreenColor,
            shape: RoundedRectangleBorder(
              borderRadius: borderRadius ??
                  BorderRadius.circular(
                    40,
                  ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  text,
                  style: Styles.textStyle22Inter,
                ),
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: childIcon,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
