import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ghosn_app/constants.dart';
import 'package:ghosn_app/core/utils/style.dart';

class CustomTextFelid extends StatelessWidget {
  CustomTextFelid({
    super.key,
    this.prefixIcon,
    required this.hinText,
    this.controller,
    this.onChanged,
    this.keyboardType,
    this.pass = false,
    this.inputFormatters,
    this.suffixIcon,
    this.width,
    this.color,
    this.onTap,
    this.readOnly = false,
    this.validator,
    this.maxLength,
    this.minLength,
  });

  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String hinText;

  TextEditingController? controller;
  void Function(String)? onChanged;
  TextInputType? keyboardType;
  bool pass;
  List<TextInputFormatter>? inputFormatters;
  final double? width;
  final Color? color;
  final void Function()? onTap;
  final bool readOnly;
  final String? Function(String?)? validator;
  final int? maxLength, minLength;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: pass,
      onChanged: onChanged,
      controller: controller,
      maxLength:maxLength,
      maxLines: minLength,
      validator: validator ??
          (data) {
            if (data!.isEmpty) {
              return 'Please Enter $hinText';
            }
            return null;
          },
      onTap: onTap,
      cursorColor: kGreenColor,
      readOnly: readOnly,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      style: Styles.textStyle22Inter.copyWith(
        fontSize: 14,
        color: Colors.black,
      ),
      decoration: InputDecoration(
        hintText: hinText,
        hintStyle: TextStyle(
          color: Colors.black.withOpacity(0.4000000059604645),
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: builtOutLineBorder(width: width, color: color),
        enabledBorder: builtOutLineBorder(width: width, color: color),
        focusedBorder: builtOutLineBorder(width: width, color: color),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
    );
  }

  OutlineInputBorder builtOutLineBorder(
      {required final double? width, required final Color? color}) {
    return OutlineInputBorder(
      borderRadius: const BorderRadius.all(
        Radius.circular(30),
      ),
      borderSide: BorderSide(
        color: color ?? kGreenColor,
        width: width ?? 3,
      ),
    );
  }
}
