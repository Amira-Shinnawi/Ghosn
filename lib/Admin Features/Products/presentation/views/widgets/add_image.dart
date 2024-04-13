import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/style.dart';

class AddPlantPhoto extends StatefulWidget {
  const AddPlantPhoto({
    super.key,
  });

  @override
  State<AddPlantPhoto> createState() => _AddPlantPhotoState();
}

class _AddPlantPhotoState extends State<AddPlantPhoto> {
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
    double width = MediaQuery.of(context).size.width;
    double blocWidth = (width / 100);
    return Column(
      children: [
        _pickedImage != null
            ? Container(
                height: blocHeight * 40,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: kHintColor,
                    width: 1,
                  ),
                  image: DecorationImage(
                    image: FileImage(File(_pickedImage!.path)),
                    fit: BoxFit.contain,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
              )
            : Container(
                height: blocHeight * 40,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: kHintColor,
                    width: 1,
                  ),
                ),
                child: IconButton(
                  onPressed: () {
                    _pickImage();
                  },
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
              size: 20,
            ),
            SizedBox(
              width: blocWidth * 2,
            ),
            Text(
              'Add Photo',
              style: Styles.textStyle16Inter.copyWith(
                decoration: TextDecoration.underline,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
