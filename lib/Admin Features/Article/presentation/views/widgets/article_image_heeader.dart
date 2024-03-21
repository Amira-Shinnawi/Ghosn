import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ghosn_app/constants.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../core/utils/style.dart';

class ArticleImageHeader extends StatefulWidget {
  const ArticleImageHeader({super.key});

  @override
  State<ArticleImageHeader> createState() => _ArticleImageHeaderState();
}

class _ArticleImageHeaderState extends State<ArticleImageHeader> {
  XFile? _pickedImage;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _pickedImage = pickedImage;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double blocHeight = (height / 100);
    return Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
      Align(
        alignment: Alignment.topLeft,
        child: Text(
          'Writer photo',
          style: Styles.textStyle16Inter.copyWith(
            decoration: TextDecoration.underline,
          ),
        ),
      ),
      SizedBox(
        height: blocHeight * 2,
      ),
      Center(
        child: Column(
          children: [
            if (_pickedImage != null)
              Container(
                height: blocHeight * 15,
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: FileImage(File(_pickedImage!.path)),
                      fit: BoxFit.fitWidth,
                    ),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: kGreenColor,
                      width: 2,
                    )),
                child: IconButton(
                  onPressed: () {
                    _pickImage();
                  },
                  icon: const Icon(
                    Icons.add,
                  ),
                ),
              )
            else
              Container(
                height: blocHeight * 15,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: kGreenColor,
                      width: 2,
                    )),
                child: const Icon(
                  Icons.add,
                ),
              )
          ],
        ),
      ),
    ]);
  }
}
