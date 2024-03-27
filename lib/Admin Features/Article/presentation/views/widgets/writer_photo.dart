import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/style.dart';
import '../../../../../core/widgets/custom_button.dart';

class WriterPhoto extends StatefulWidget {
  const WriterPhoto({
    super.key,
  });

  @override
  State<WriterPhoto> createState() => _WriterPhotoState();
}

class _WriterPhotoState extends State<WriterPhoto> {
  List<XFile?> articleWriterPhoto = [];

  Future<void> _pickImage(int index) async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        articleWriterPhoto[index] = pickedImage;
      });
    } else {
      setState(() {
        articleWriterPhoto.removeAt(index);
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
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
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
          height: blocHeight * 20,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: articleWriterPhoto.length,
            itemBuilder: ((context, index) {
              final pickedImage = articleWriterPhoto[index];
              return Padding(
                padding: EdgeInsets.symmetric(
                  vertical: blocHeight * 2,
                  horizontal: blocWidth * 2,
                ),
                child: Container(
                    height: blocHeight * 15,
                    width: blocWidth * 40,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: kGreenColor,
                        width: 2,
                      ),
                      image: pickedImage != null
                          ? DecorationImage(
                              image: FileImage(File(pickedImage.path)),
                              fit: BoxFit.cover,
                            )
                          : null,
                    ),
                    child: pickedImage == null
                        ? IconButton(
                            onPressed: () {
                              _pickImage(index);
                            },
                            icon: const Icon(
                              Icons.add,
                            ),
                          )
                        : IconButton(
                            onPressed: () {
                              _pickImage(index);
                            },
                            icon: const Icon(
                              Icons.remove,
                              color: Colors.red,
                            ),
                          )),
              );
            }),
          ),
        ),
        CustomButton(
          onPressed: () {
            setState(() {
              articleWriterPhoto.add(null);
            });
          },
          decoration: BoxDecoration(
            color: const Color(0x7f53ac5f),
            borderRadius: BorderRadius.circular(40),
          ),
          height: 45,
          width: 260,
          text: '+ Add an additional Photo',
        ),
      ],
    );
  }
}
