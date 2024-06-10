import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ghosn_app/core/utils/style.dart';

import '../../constants.dart';

class CustomTextFormEditing extends StatelessWidget {
  const CustomTextFormEditing({
    super.key,
    required this.hintText,
    this.onSaved,
    this.onChanged,
    this.onTap,
    this.controller,
    this.readOnly = false,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.formKey,
    this.labelText,
    this.initialValue,
    this.keyboardType,
    this.inputFormatters,
  });
  final String hintText;
  final void Function(String?)? onSaved;
  final Function(String)? onChanged;
  final void Function()? onTap;
  final TextEditingController? controller;
  final bool readOnly;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final Key? formKey;
  final String? labelText;
  final String? initialValue;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double blockHeight = (height / 100);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: blockHeight * 1),
      child: TextFormField(
        key: formKey,
        initialValue: initialValue,
        readOnly: readOnly,
        controller: controller,
        onTap: onTap,
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
        onSaved: onSaved,
        onChanged: onChanged,
        cursorColor: kGreenColor,
        validator: validator ??
            (data) {
              if (data!.isEmpty) {
                return 'Please Enter $hintText';
              }
              return null;
            },
        style: Styles.textStyle22Inter.copyWith(
          fontSize: 14,
          color: Colors.black,
        ),
        decoration: InputDecoration(
          enabledBorder: builtOutLineBorder(width: 2, color: kGreenColor),
          focusedBorder: builtOutLineBorder(width: 2, color: kGreenColor),
          border: builtOutLineBorder(width: 2, color: kGreenColor),
          contentPadding: const EdgeInsets.fromLTRB(20, 10.0, 20.0, 10.0),
          hintText: hintText,
          hintStyle: Styles.textStyle16Inter.copyWith(
            fontSize: 14,
            color: kHintColor,
          ),
          labelText: labelText,
          labelStyle: Styles.textStyle16Inter.copyWith(
            fontSize: 14,
            color: kHintColor,
          ),
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
        width: width ?? 3,
      ),
    );
  }
}
