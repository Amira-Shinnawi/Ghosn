import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ghosn_app/User%20Features/Account/data/model/user_profile_model.dart';
import 'package:ghosn_app/User%20Features/Account/presentation/manager/cubit/auth_cubit.dart';
import 'package:ghosn_app/constants.dart';
import 'package:ghosn_app/core/utils/assets_data.dart';
import 'package:ghosn_app/core/utils/style.dart';
import 'package:ghosn_app/core/widgets/custom_elvated_button.dart';
import 'package:ghosn_app/core/widgets/custom_text_field.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../core/widgets/custom_text_editing.dart';
import '../../../../../translations/local_keys.g.dart';

class EditProfileBody extends StatefulWidget {
  EditProfileBody({super.key});
  UserProfileModel? userProfileModel;
  @override
  State<EditProfileBody> createState() => _EditProfileBodyState();
}

class _EditProfileBodyState extends State<EditProfileBody> {
  final firstNameKey = GlobalKey<FormState>();
  final lastNameKey = GlobalKey<FormState>();
  final userNameKey = GlobalKey<FormState>();
  final birthdayKey = GlobalKey<FormState>();
  final phoneKey = GlobalKey<FormState>();
  final emailKey = GlobalKey<FormState>();
  final passKey = GlobalKey<FormState>();

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
    // firstNameController.text = widget.userProfileModel!.firstName!;
    // lastNameController.text = widget.userProfileModel!.lastName!;
    // emailController.text = widget.userProfileModel!.email!;
    // userNameController.text = widget.userProfileModel!.userName!;
    // passController.text = widget.userProfileModel!.password!;
    // phoneController.text = widget.userProfileModel!.phoneNumber!;
    // dateOfBirthController.text = widget.userProfileModel!.dateOfBirth!;

    super.initState();
  }

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
              controller: firstNameController,
              formKey: firstNameKey,
            ),
            CustomTextFormEditing(
              hintText: 'Last Name',
              controller: lastNameController,
              formKey: lastNameKey,
            ),
            CustomTextFormEditing(
              hintText: 'User Name',
              controller: userNameController,
              formKey: userNameKey,
            ),
            SizedBox(
              height: blockHeight * 1,
            ),
            CustomTextField(
              width: 2,
              hintText: 'Choose your Birthday',
              controller: dateOfBirthController,
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
              controller: phoneController,
              formKey: phoneKey,
            ),
            CustomTextFormEditing(
              hintText: 'Email',
              controller: emailController,
              formKey: emailKey,
            ),
            CustomTextFormEditing(
              hintText: 'Password',
              controller: passController,
              formKey: passKey,
            ),
            SizedBox(
              height: blockHeight * 2,
            ),
            CustomElevatedButton(
              padding: const EdgeInsets.all(10),
              onPressed: () {
                // Navigator.of(context)
                //     .push(MaterialPageRoute(builder: (context) {
                //   return const ContinueEditing();
                // }));
                // BlocProvider.of<AuthCubit>(context).editUser(
                //     firstName: firstNameController.text,
                //     lastName: lastNameController.text,
                //     email: emailController.text,
                //     userName: userNameController.text,
                //     password: passController.text,
                //     phoneNumber: phoneController.text,
                //     dateOfBirth: dateOfBirthController.text);
              },
              buttonName: LocaleKeys.okContinue.tr(),
            ),
          ],
        ),
      ),
    );
  }
}
