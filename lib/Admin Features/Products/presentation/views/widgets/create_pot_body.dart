import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/style.dart';
import '../../../../../core/widgets/custom_button.dart';
import 'detail_for_add_pot.dart';

class CreatePotBody extends StatefulWidget {
  const CreatePotBody({super.key});

  @override
  State<CreatePotBody> createState() => _CreatePotBodyState();
}

class _CreatePotBodyState extends State<CreatePotBody> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double blockHeight = (height / 100);
    double width = MediaQuery.of(context).size.width;
    double blockWidth = (width / 100);
    File? _image;
    final picker = ImagePicker();
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: blockWidth * 3, vertical: blockHeight * 2),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
              child: Column(
            children: [
              Container(
                height: blockHeight * 20,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: kHintColor,
                    width: 1,
                  ),
                  // image: DecorationImage(
                  //   image: FileImage(_image!),
                  //   fit: BoxFit.contain,
                  // ),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              SizedBox(
                height: blockHeight * 2,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.image,
                    size: 18,
                  ),
                  SizedBox(
                    width: blockWidth * 2,
                  ),
                  Text(
                    'Add Photo',
                    style: Styles.textStyle16Inter.copyWith(
                      decoration: TextDecoration.underline,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ],
          )),
          SliverToBoxAdapter(
            child: SizedBox(
              height: blockHeight * 2,
            ),
          ),
          const SliverToBoxAdapter(
            child: DetailForPot(),
          ),
          SliverToBoxAdapter(
              child: CustomButton(
                  height: blockHeight * 5,
                  text: 'Save',
                  onPressed: () {
                    // showDialog(
                    //     context: context,
                    //     builder: (BuildContext context) {
                    //       return SimpleDialog(
                    //         backgroundColor: Colors.white,
                    //         title: const Text(
                    //           'Are You Sure!\n You want to Save it',
                    //           textAlign: TextAlign.center,
                    //           style: Styles.textStyle18Inter,
                    //         ),
                    //         children: [
                    //           const Divider(),
                    //           TextButton(
                    //             style: TextButton.styleFrom(
                    //               textStyle:
                    //                   Theme.of(context).textTheme.labelLarge,
                    //             ),
                    //             child: Text(
                    //               'Save',
                    //               style: Styles.textStyle18Inter.copyWith(
                    //                 color: kGreenColor,
                    //               ),
                    //             ),
                    //             onPressed: () {

                    //             },
                    //           ),
                    //           const Divider(),
                    //           TextButton(
                    //             style: TextButton.styleFrom(
                    //               textStyle:
                    //                   Theme.of(context).textTheme.labelLarge,
                    //             ),
                    //             child: Text(
                    //               'Cancel',
                    //               style: Styles.textStyle18Inter.copyWith(
                    //                 color: Colors.red,
                    //               ),
                    //             ),
                    //             onPressed: () {
                    //               Navigator.of(context).pop();
                    //             },
                    //           ),
                    //         ],
                    //       );
                    //     });
                  })),
        ],
      ),
    );
  }
}
