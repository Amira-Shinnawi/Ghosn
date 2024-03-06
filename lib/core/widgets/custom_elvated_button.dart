import 'package:flutter/material.dart';
import 'package:ghosn_app/core/utils/style.dart';

import '../../constants.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    required this.onPressed,
    required this.buttonName,
    super.key,
  });
  final void Function() onPressed;
  final String buttonName;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      child: Ink(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Color.fromARGB(255, 4, 102, 53),
              kGreenColor,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(10.0),
          child: Text(
            buttonName,
            style: Styles.textStyle22Inter.copyWith(
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}
