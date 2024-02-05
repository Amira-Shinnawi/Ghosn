import 'package:flutter/material.dart';
import 'package:ghosn_app/core/utils/style.dart';

AppBar CustomAppBar({required final String title}) {
  return AppBar(
    leading: const Icon(
      Icons.arrow_back_ios,
    ),
    centerTitle: true,
    title: Text(
      title,
      style: Styles.textStyle22Inter.copyWith(
        fontSize: 25,
        color: Colors.black,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}
