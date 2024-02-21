import 'package:flutter/material.dart';

AppBar CustomAppBar(
    {Widget? titleAppBar,
    required final Widget leading,
    Color? backgroundColor,
    List<Widget>? actions}) {
  return AppBar(
    leading: leading,
    elevation: 0.0,
    centerTitle: true,
    backgroundColor: backgroundColor,
    title: titleAppBar,
    actions: actions,
  );
}
