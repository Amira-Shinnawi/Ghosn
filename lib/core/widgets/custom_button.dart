import 'package:flutter/material.dart';
import 'package:ghosn_app/constants.dart';

import '../utils/style.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.borderRadius,
    required this.text,
    this.fontSize,
    this.onPressed,
    this.width,
    this.backgroundColor,
    this.height,
    this.decoration,
  });
  final String text;
  final BorderRadius? borderRadius;
  final double? fontSize;
  final void Function()? onPressed;
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final Decoration? decoration;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Container(
        height: height ?? 50,
        width: width ?? 328,
        decoration: decoration ??
            BoxDecoration(
              borderRadius: borderRadius ??
                  BorderRadius.circular(
                    40,
                  ),
              gradient: const LinearGradient(
                colors: [
                  Color.fromARGB(255, 4, 102, 53),
                  kGreenColor,
                ],
              ),
            ),
        child: TextButton(
          onPressed: onPressed,
          child: Text(
            text,
            style: Styles.textStyle22Inter.copyWith(
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
