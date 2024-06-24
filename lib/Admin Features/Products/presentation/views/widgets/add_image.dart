import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ghosn_app/translations/local_keys.g.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/style.dart';

class AddPlantPhoto extends StatefulWidget {
  AddPlantPhoto({super.key, required this.image, this.onPressed});
  final File image;
  final void Function()? onPressed;
  @override
  State<AddPlantPhoto> createState() => _AddPlantPhotoState();
}

class _AddPlantPhotoState extends State<AddPlantPhoto> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double blocHeight = (height / 100);
    double width = MediaQuery.of(context).size.width;
    double blocWidth = (width / 100);
    return Column(
      children: [
        widget.image != null
            ? Container(
                height: blocHeight * 20,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: kHintColor,
                    width: 1,
                  ),
                  image: DecorationImage(
                    image: FileImage(widget.image),
                    fit: BoxFit.contain,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
              )
            : Container(
                height: blocHeight * 20,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: kHintColor,
                    width: 1,
                  ),
                ),
                child: IconButton(
                  onPressed: widget.onPressed,
                  icon: const Icon(
                    Icons.add,
                  ),
                ),
              ),
        SizedBox(
          height: blocHeight * 2,
        ),
        Row(
          children: [
            const Icon(
              Icons.image,
              size: 18,
            ),
            SizedBox(
              width: blocWidth * 2,
            ),
            Text(
              LocaleKeys.AddPhoto.tr(),
              style: Styles.textStyle16Inter.copyWith(
                decoration: TextDecoration.underline,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
