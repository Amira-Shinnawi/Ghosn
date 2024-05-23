import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ghosn_app/User%20Features/Account/data/model/user_profile_model.dart';
import 'package:ghosn_app/constants.dart';
import 'package:ghosn_app/core/utils/assets_data.dart';
import 'package:ghosn_app/core/utils/style.dart';
import 'package:ghosn_app/core/widgets/custom_elvated_button.dart';
import 'package:ghosn_app/core/widgets/custom_text_field.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../core/widgets/custom_text_editing.dart';
import '../../../../../translations/local_keys.g.dart';

class EditProfileBody extends StatefulWidget {
  const EditProfileBody({
    required this.userProfileModel,
    required this.firstNameController,
    required this.lastNameController,
    // required this.passController,
    required this.phoneController,
    required this.onUpdatePressed,
    required this.emailController,
    required this.cityController,
    required this.stateController,
    required this.dateOfBirthController,
    required this.userNameController,
  });

  final UserProfileModel userProfileModel;
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController emailController;
  final TextEditingController userNameController;
  // final TextEditingController passController;
  final TextEditingController phoneController;
  final TextEditingController cityController;
  final TextEditingController stateController;
  final TextEditingController dateOfBirthController;

  final Function(UserProfileModel) onUpdatePressed;

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

  bool showLocationFields = false;
  bool gender = true;
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
            CustomTextFormEditing(
              hintText: 'First Name',
              controller: widget.firstNameController,
            ),
            CustomTextFormEditing(
              hintText: 'Last Name',
              controller: widget.lastNameController,
            ),
            CustomTextFormEditing(
              hintText: 'User Name',
              controller: widget.userNameController,
            ),
            SizedBox(
              height: blockHeight * 1,
            ),
            CustomTextField(
              width: 2,
              hintText: 'Choose your Birthday',
              controller: widget.dateOfBirthController,
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
            SizedBox(
              height: blockHeight * 1,
            ),
            const Divider(),
            SizedBox(
              height: blockHeight * 2,
            ),
            const Text(
              'Contact Info',
              style: Styles.textStyle18Inter,
            ),
            SizedBox(
              height: blockHeight * 1,
            ),
            CustomTextFormEditing(
              hintText: '+20 01025167595',
              controller: widget.phoneController,
            ),
            CustomTextFormEditing(
              hintText: 'Email',
              controller: widget.emailController,
            ),
            // CustomTextFormEditing(
            //   hintText: 'Password',
            //   controller: widget.passController,
            // ),
            SizedBox(
              width: blockWidth * 4,
            ),
            Text(
              LocaleKeys.gender.tr(),
              style: TextStyle(
                color: Colors.black.withOpacity(0.4000000059604645),
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            Row(
              children: [
                Radio<bool>(
                  value: true,
                  activeColor: kGreenColor,
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = value!;
                    });
                  },
                ),
                Text(
                  LocaleKeys.Male.tr(),
                  style: Styles.textStyle16Inter,
                ),
              ],
            ),
            Row(
              children: [
                Radio<bool>(
                  value: false,
                  groupValue: gender,
                  activeColor: kGreenColor,
                  onChanged: (value) {
                    setState(() {
                      gender = value!;
                    });
                  },
                ),
                Text(
                  LocaleKeys.Female.tr(),
                  style: Styles.textStyle16Inter,
                ),
              ],
            ),
            SizedBox(
              height: blockHeight * 2,
            ),
            const Divider(),
            SizedBox(
              height: blockHeight * 2,
            ),
            Text(
              LocaleKeys.currentCity.tr(),
              style: Styles.textStyle18Inter,
            ),
            SizedBox(
              height: blockHeight * 1,
            ),
            CustomTextField(
              width: 2,
              onTap: () {
                setState(() {
                  showLocationFields = !showLocationFields;
                });
              },
              hintText: LocaleKeys.chooseLocation.tr(),
              suffixIcon: const Icon(
                FontAwesomeIcons.chevronDown,
                size: 20,
                color: kGreenColor,
              ),
              controller: TextEditingController(text: ''),
              readOnly: true,
              prefixIcon: const Icon(
                FontAwesomeIcons.locationDot,
                size: 20,
                color: kHintColor,
              ),
            ),
            SizedBox(
              height: blockHeight * 2,
            ),
            if (showLocationFields)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: blockWidth * 2.5),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            width: 1,
                            hintText: LocaleKeys.city.tr(),
                            controller: widget.cityController,
                            onChanged: (value) {
                              setState(() {});
                            },
                          ),
                        ),
                        SizedBox(width: blockWidth * 2),
                        Expanded(
                          child: CustomTextField(
                            width: 1,
                            hintText: LocaleKeys.state.tr(),
                            controller: widget.stateController,
                            onChanged: (value) {
                              setState(() {});
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            SizedBox(
              height: blockHeight * 2,
            ),
            CustomElevatedButton(
              padding: const EdgeInsets.all(10),
              onPressed: () {
                final updatedProfile = UserProfileModel(
                  firstName: widget.firstNameController.text,
                  lastName: widget.lastNameController.text,
                  phoneNumber: widget.phoneController.text,
                  // password: widget.passController.text,
                  email: widget.emailController.text,
                  userName: widget.userNameController.text,
                  dateOfBirth: widget.dateOfBirthController.text,
                  cityId: int.parse(widget.cityController.text),
                  street: widget.stateController.text,
                );
                // Navigator.of(context)
                //     .push(MaterialPageRoute(builder: (context) {
                //   return const ContinueEditing();
                // }));
                widget.onUpdatePressed(updatedProfile);
              },

              // BlocProvider.of<AuthCubit>(context).editUser(
              //     firstName: firstNameController.text,
              //     lastName: lastNameController.text,
              //     email: emailController.text,
              //     userName: userNameController.text,
              //     password: passController.text,
              //     phoneNumber: phoneController.text,
              //     dateOfBirth: dateOfBirthController.text);

              buttonName: LocaleKeys.okContinue.tr(),
            ),
          ],
        ),
      ),
    );
  }
}
