import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/style.dart';

class AddPhotoVideo extends StatefulWidget {
  const AddPhotoVideo({
    super.key,
    this.onPressed,
    required this.imagePath,
  });
  final void Function()? onPressed;
  final String imagePath;
  @override
  State<AddPhotoVideo> createState() => _AddPhotoVideoState();
}

class _AddPhotoVideoState extends State<AddPhotoVideo> {
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
        Row(
          children: [
            const Icon(
              Icons.collections,
              size: 20,
            ),
            SizedBox(
              width: blocWidth * 2,
            ),
            Text(
              'Add Photo/Video',
              style: Styles.textStyle16Inter.copyWith(
                decoration: TextDecoration.underline,
              ),
            ),
          ],
        ),
        SizedBox(
          height: blocHeight * 2,
        ),
        _pickedImage != null
            ? Container(
                height: blocHeight * 20,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: kHintColor,
                    width: 1,
                  ),
                  image: DecorationImage(
                    image: FileImage(File(_pickedImage!.path)),
                    fit: BoxFit.cover,
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
              )
      ],
    );
  }
}
