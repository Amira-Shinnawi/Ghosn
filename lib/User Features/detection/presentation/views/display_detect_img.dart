import 'dart:io';

import 'package:flutter/material.dart';

import '../../../../core/utils/style.dart';
import '../../../../core/widgets/custom_appbar.dart';
import 'widgets/display_detect_img_body.dart';

class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;

  const DisplayPictureScreen({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        titleAppBar: Text(
          "Scanning Result",
          style: Styles.textStyle22Inter.copyWith(
              color: Colors.black, fontWeight: FontWeight.w600, fontSize: 20),
        ),
      ),
      body: DisplayPictureScreenBody(imagePath: imagePath),
    );
  }
}
