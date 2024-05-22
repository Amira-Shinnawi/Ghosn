import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ghosn_app/constants.dart';
import 'package:ghosn_app/core/utils/style.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    super.key,
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
     this.borderRadius = 30,
      this.onSuffixIconPressed,
      this.showSuffixIcon = false,
  });

  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String hintText;
   final void Function()? onSuffixIconPressed;
   final bool showSuffixIcon;

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
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
     Widget? suffixWidget;
    if (showSuffixIcon && suffixIcon != null) {
      suffixWidget = IconButton(
        icon: suffixIcon!,
        onPressed: onSuffixIconPressed != null ? () => onSuffixIconPressed!() : null,
      );
    }
    return TextFormField(
      obscureText: pass,
      onChanged: onChanged,
      controller: controller,
      maxLength: maxLength ?? null,
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
        contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: builtOutLineBorder(width: width, color: color),
        enabledBorder: builtOutLineBorder(width: width, color: color),
        focusedBorder: builtOutLineBorder(width: width, color: color),
        prefixIcon: prefixIcon,
         suffixIcon: suffixWidget,
      
    
      ),
    );
  }

  OutlineInputBorder builtOutLineBorder(
      {required final double? width, required final Color? color}) {
    return OutlineInputBorder(
      borderRadius:  BorderRadius.circular(borderRadius),
      
      borderSide: BorderSide(
        color: color ?? kGreenColor,
        width: width ?? 3,
      ),
    );
   
  }
}
