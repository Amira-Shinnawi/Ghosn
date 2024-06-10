import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ghosn_app/User%20Features/Account/presentation/manager/edit_profile_cubit/cubit/edit_profile_cubit.dart';
import 'package:ghosn_app/constants.dart';
import 'package:ghosn_app/core/utils/style.dart';
import 'package:ghosn_app/core/widgets/custom_elvated_button.dart';
import 'package:ghosn_app/core/widgets/custom_text_field.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/utils/Api_Key.dart';
import '../../../../../core/utils/functions/network_image_handler.dart';
import '../../../../../core/utils/service_locator.dart';
import '../../../../../core/widgets/custom_text_editing.dart';
import '../../../../../translations/local_keys.g.dart';
import '../../../data/repo/profile/profile_repo_imple.dart';
import 'continue_editing_body.dart';

class EditProfileBody extends StatefulWidget {
  const EditProfileBody({
    super.key,
  });

  @override
  State<EditProfileBody> createState() => _EditProfileBodyState();
}

class _EditProfileBodyState extends State<EditProfileBody> {
  int? _selectedId;
  String? _selectedCity;

  final List<DropdownMenuItem<int>> _cities = const [
    DropdownMenuItem(value: 1, child: Text('Alex')),
    DropdownMenuItem(value: 2, child: Text('Cairo')),
    DropdownMenuItem(value: 3, child: Text('Aswan')),
  ];

  Future<void> updateImageProfile(XFile _pickedImage) async {
    var headers = {
      'Content-Type': 'multipart/form-data',
      'Authorization': 'Bearer $userToken'
    };
    var request = http.MultipartRequest(
        'PUT', Uri.parse('${ApiKeys.BASE_URL}/api/Auth/profile/img'));
    request.files.add(
        await http.MultipartFile.fromPath('profileImage', _pickedImage.path));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      if (mounted) {
        setState(() {
          _pickedImage = _pickedImage;
        });
      }
    } else {
      print(response.reasonPhrase);
    }
  }

  void getImg() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      saveData(pickedImage.path.toString());
      if (mounted) {
        setState(() {
          imageFile = pickedImage;
        });
      }
      await updateImageProfile(imageFile!);
    }
  }

  void saveData(String value) async {
    final sharedPref = await SharedPreferences.getInstance();
    sharedPref.setString('path', value);
    getData();
  }

  void getData() async {
    final sharedPref = await SharedPreferences.getInstance();
    setState(() {
      profileImage = sharedPref.getString('path');
    });
  }

  void deleteData() async {
    final sharedPref = await SharedPreferences.getInstance();
    sharedPref.remove('path');
    getData();
  }

  final dateInput = TextEditingController();
  final pass = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey();

  bool gender = false;

  bool showLocationFields = false;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double blockHeight = (height / 100);
    double width = MediaQuery.of(context).size.width;
    double blockWidth = (width / 100);

    return BlocProvider(
      create: (context) => EditProfileCubit(
        getIt.get<ProfileRepoImplement>(),
      )..fetchProfile(),
      child: BlocBuilder<EditProfileCubit, EditProfileState>(
        builder: (context, state) {
          if (state is EditProfileSuccess) {
            final firstNameController =
                TextEditingController(text: state.profileModel.first.firstName);
            final lastNameController =
                TextEditingController(text: state.profileModel.first.lastName);
            final emailController =
                TextEditingController(text: state.profileModel.first.email);
            final userNameController =
                TextEditingController(text: state.profileModel.first.userName);
            final phoneController = TextEditingController(
                text: state.profileModel.first.phoneNumber);
            final stateController = TextEditingController(
                text: state.profileModel.first.countryName);

            final dateOfBirth = TextEditingController(
                text: state.profileModel.first.dateOfBirth);

            return Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: blockWidth * 5, vertical: blockHeight * 2),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
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
                              getImg();
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
                            CircleAvatar(
                              radius: 60,
                              backgroundImage: (profileImage != null)
                                  ? FileImage(File(profileImage!))
                                      as ImageProvider
                                  : (userToken != null || profileImage != null)
                                      ? NetworkHandler().getImage(
                                          state.profileModel.first.imgUrl!,
                                        )
                                      : const NetworkImage(
                                          'https://developers.google.com/static/maps/documentation/streetview/images/error-image-generic.png'),
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
                      ),
                      CustomTextFormEditing(
                        hintText: 'Last Name',
                        controller: lastNameController,
                      ),
                      CustomTextFormEditing(
                        hintText: 'User Name',
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(10),
                        ],
                        controller: userNameController,
                        onChanged: (username) {
                          emailController.text = '$username@gmail.com';
                        },
                      ),
                      SizedBox(
                        height: blockHeight * 1,
                      ),
                      CustomTextField(
                        width: 2,
                        hintText: '2002-12-12',
                        controller:
                            (dateInput.text.isEmpty) ? dateOfBirth : dateInput,
                        readOnly: true,
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime(DateTime.now().year - 18),
                            firstDate: DateTime(1900),
                            lastDate: DateTime.now(),
                          );

                          if (pickedDate != null) {
                            String formattedDate =
                                DateFormat('yyyy-MM-dd').format(pickedDate);
                            dateOfBirth.text = formattedDate;
                            setState(() {
                              dateInput.text = formattedDate;
                            });
                          }
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
                        hintText: '+20 1012345678',
                        controller: phoneController,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                      CustomTextFormEditing(
                        hintText: 'email@gmail.com',
                        controller: emailController,
                        readOnly: true,
                      ),
                      SizedBox(
                        height: blockHeight * 1,
                      ),
                      Container(
                        height: blockHeight * 6,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                            color: kGreenColor,
                            width: 2,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: blockWidth * 2.5),
                          child: Row(
                            children: [
                              const Icon(
                                FontAwesomeIcons.venusMars,
                                size: 20,
                                color: kHintColor,
                              ),
                              SizedBox(
                                width: blockWidth * 4,
                              ),
                              Text(
                                LocaleKeys.gender.tr(),
                                style: TextStyle(
                                  color: Colors.black
                                      .withOpacity(0.4000000059604645),
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
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: blockHeight * 1,
                      ),
                      CustomTextFormEditing(
                        hintText: 'Password',
                        controller: pass,
                      ),
                      SizedBox(
                        height: blockHeight * 2,
                      ),
                      const Divider(),
                      SizedBox(
                        height: blockHeight * 2,
                      ),
                      const Text(
                        'Current Location',
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
                        initialValue: LocaleKeys.chooseLocation.tr(),
                        hintText: LocaleKeys.chooseLocation.tr(),
                        suffixIcon: const Icon(
                          FontAwesomeIcons.chevronDown,
                          size: 20,
                          color: kGreenColor,
                        ),
                        readOnly: true,
                        prefixIcon: const Icon(
                          FontAwesomeIcons.locationDot,
                          size: 20,
                          color: kHintColor,
                        ),
                      ),
                      if (showLocationFields)
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: blockWidth * 2.5),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: DropdownButtonFormField<int>(
                                      value: _selectedId,
                                      hint: const Text('Select City'),
                                      items: _cities,
                                      onChanged: (int? newValue) {
                                        setState(() {
                                          _selectedId = newValue;
                                          _selectedCity = _cities
                                              .firstWhere((item) =>
                                                  item.value == newValue)
                                              .child
                                              .toString();
                                        });
                                      },
                                      decoration: InputDecoration(
                                        hintStyle: TextStyle(
                                          color: Colors.black
                                              .withOpacity(0.4000000059604645),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        labelStyle: TextStyle(
                                          color: Colors.black
                                              .withOpacity(0.4000000059604645),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        contentPadding:
                                            const EdgeInsets.fromLTRB(
                                                20.0, 10.0, 20.0, 10.0),
                                        border: const OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(30),
                                          ),
                                          borderSide: BorderSide(
                                            color: kGreenColor,
                                            width: 1,
                                          ),
                                        ),
                                        enabledBorder: const OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(30),
                                          ),
                                          borderSide: BorderSide(
                                            color: kGreenColor,
                                            width: 1,
                                          ),
                                        ),
                                        focusedBorder: const OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(30),
                                          ),
                                          borderSide: BorderSide(
                                            color: kGreenColor,
                                            width: 1,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: blockWidth * 2),
                                  Expanded(
                                    child: CustomTextField(
                                      width: 1,
                                      hintText: 'State',
                                      controller: stateController,
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
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            await BlocProvider.of<EditProfileCubit>(context)
                                .editProfile(
                              firstName: firstNameController.text,
                              lastName: lastNameController.text,
                              email: emailController.text,
                              phoneNumber: phoneController.text,
                              cityId: _selectedId,
                              street: stateController.text,
                              dateOfBirth: dateInput.text,
                              maleGender: gender.toString(),
                              userName: userNameController.text,
                              password: pass.text,
                            );
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return const ContinueEditing();
                            }));
                          }
                        },
                        buttonName: LocaleKeys.okContinue.tr(),
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else if (state is EditProfileFailure) {
            return Center(child: Text(state.errorMessage));
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
