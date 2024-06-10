import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ghosn_app/constants.dart';
import 'package:ghosn_app/core/utils/style.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {super.key,
      this.prefixIcon,
      required this.hintText,
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
      this.labelText,
      this.initialValue,
      this.onFieldSubmitted});

  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String hintText;

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
  int? maxLength, minLength;
  final String? labelText;
  final String? initialValue;
  final void Function(String)? onFieldSubmitted;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double blockHeight = (height / 100);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: blockHeight * 1),
      child: TextFormField(
        obscureText: pass,
        initialValue: initialValue,
        onChanged: onChanged,
        onFieldSubmitted: onFieldSubmitted,
        controller: controller,
        maxLength: maxLength,
        maxLines: minLength ?? 1,
        validator: validator ??
            (data) {
              if (data!.isEmpty) {
                return 'Please Enter $hintText';
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
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.black.withOpacity(0.4000000059604645),
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          labelText: labelText,
          labelStyle: TextStyle(
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
        width: width ?? 2,
      ),
    );
  }
}
