import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ghosn_app/constants.dart';
import 'package:ghosn_app/core/utils/style.dart';

class CustomTextFelid extends StatelessWidget {
  CustomTextFelid(
      {super.key,
      this.prefixIcon,
      required this.hinText,
      this.controller,
      this.onChanged,
      this.keyboardType,
      this.pass = false,
      this.inputFormatters});

  final Widget? prefixIcon;
  final String hinText;
  TextEditingController? controller;
  void Function(String)? onChanged;
  TextInputType? keyboardType;
  bool pass;
  List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: pass,
      onChanged: onChanged,
      controller: controller,
      validator:  (data) {
        if (data!.isEmpty) {
          return 'field is required';
        }
        return null;
      },
      keyboardType: keyboardType,
      inputFormatters:inputFormatters,
      style: Styles.textStyle22Inter.copyWith(
        fontSize: 18,
        color: Colors.black,
      ),
      decoration: InputDecoration(
        hintText: hinText,
        hintStyle: TextStyle(
          color: Colors.black.withOpacity(0.4000000059604645),
          fontSize: 18,
          fontWeight: FontWeight.w400,
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        border: builtOutLineBorder(),
        enabledBorder: builtOutLineBorder(),
        focusedBorder: builtOutLineBorder(),
        prefixIcon: prefixIcon,
      ),
    );
  }

  OutlineInputBorder builtOutLineBorder() {
    return const OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(30),
      ),
      borderSide: BorderSide(
        color: kGreenColor,
        width: 3,
      ),
    );
  }
}
