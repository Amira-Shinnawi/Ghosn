import 'package:flutter/material.dart';

class DrawerItemModel {
  final String title;
  final IconData icon;
  final void Function()? onTap;

  DrawerItemModel(
      {required this.title, required this.icon, required this.onTap});
}
