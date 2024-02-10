import 'package:flutter/material.dart';
import 'package:ghosn_app/core/utils/style.dart';

AppBar CustomAppBar({
  required final String title,
  required final Widget leading,
  List<Widget>? actions
}) {
  return AppBar(
    leading: leading,
    elevation: 0.0,
    centerTitle: true,
    title: Text(
      title,
      style: Styles.textStyle22Inter.copyWith(
        fontSize: 25,
        color: Colors.black,
        fontWeight: FontWeight.w600,
      ),
    ),
    actions: actions,
  );
}
