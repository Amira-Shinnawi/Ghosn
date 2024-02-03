import 'package:flutter/material.dart';
import 'package:ghosn_app/core/utils/style.dart';

AppBar custom_appbar({required final String title}) {
    return AppBar(
      leading: const Icon(
        Icons.arrow_back_ios_new_outlined,
        color: Colors.black,
      ),
      centerTitle: true,
      title:  Text(title, style: Styles.textStyle32Itim,),

    );
  }