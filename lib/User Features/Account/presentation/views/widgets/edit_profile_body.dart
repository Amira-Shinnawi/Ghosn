import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ghosn_app/constants.dart';
import 'package:ghosn_app/core/utils/assets_data.dart';
import 'package:ghosn_app/core/utils/style.dart';
import 'package:ghosn_app/core/widgets/custom_elvated_button.dart';
import 'package:ghosn_app/core/widgets/custom_text_field.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../core/widgets/custom_text_editing.dart';
import '../../../../../translations/local_keys.g.dart';
import 'continue_editing_body.dart';

class EditProfileBody extends StatefulWidget {
  const EditProfileBody({super.key});

  @override
  State<EditProfileBody> createState() => _EditProfileBodyState();
}

class _EditProfileBodyState extends State<EditProfileBody> {
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

  TextEditingController dateInput = TextEditingController();

  @override
  void initState() {
    dateInput.text = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double blockHeight = (height / 100);
    double width = MediaQuery.of(context).size.width;
    double blockWidth = (width / 100);
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: blockWidth * 5, vertical: blockHeight * 2),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  LocaleKeys.ProfilePicture.tr(),
                  style: Styles.textStyle18Inter,
                ),
                GestureDetector(
                  onTap: () {
                    _pickImage();
                  },
                  child: Text(
                    LocaleKeys.edit.tr(),
                    style: Styles.textStyle18Inter.copyWith(
                      color: kGreenColor,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: blockHeight * 2,
            ),
            Center(
              child: Column(
                children: [
                  if (_pickedImage != null)
                    CircleAvatar(
                      radius: 60,
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: FileImage(File(_pickedImage!.path)),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(60),
                        ),
                      ),
                    )
                  else
                    CircleAvatar(
                      radius: 60,
                      child: Image.asset(
                        AssetsData.imageTest2,
                      ),
                    ),
                ],
              ),
            ),
            SizedBox(
              height: blockHeight * 2,
            ),
            const Divider(),
            SizedBox(
              height: blockHeight * 2,
            ),
            Text(
              LocaleKeys.Details.tr(),
              style: Styles.textStyle18Inter,
            ),
            SizedBox(
              height: blockHeight * 1,
            ),
            const CustomTextFormEditing(
              hintText: 'User Name',
            ),
            CustomTextField(
              hintText: 'Choose your Birthday',
              controller: dateInput,
              readOnly: true,
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1950),
                    lastDate: DateTime(2100));

                if (pickedDate != null) {
                  String formattedDate =
                      DateFormat('MM-dd-yyyy').format(pickedDate);

                  setState(() {
                    dateInput.text = formattedDate;
                  });
                } else {}
              },
            ),
            const CustomTextFormEditing(
              hintText: '+20 01025167595',
            ),
            SizedBox(
              height: blockHeight * 2,
            ),
            CustomElevatedButton(
              padding: const EdgeInsets.all(10),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const ContinueEditing();
                }));
              },
              buttonName: LocaleKeys.okContinue.tr(),
            ),
          ],
        ),
      ),
    );
  }
}
