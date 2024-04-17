import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ghosn_app/User%20Features/Account/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:ghosn_app/core/utils/app_router.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/style.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../../../../../core/widgets/show_snack_bar.dart';
import '../../../../../translations/local_keys.g.dart';
import 'google_facebook_login.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({
    super.key,
  });

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  bool obscureText = true;
  bool isChecked = false;
  bool isLoading = false;

  GlobalKey<FormState> formKey = GlobalKey();

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final userNameController = TextEditingController();
  final passController = TextEditingController();
  final phoneController = TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();
  final dateOfBirthController = TextEditingController();

  @override
  void initState() {
    dateOfBirthController.text;
    super.initState();
  }

  bool gender = true;

  bool showLocationFields = false;

  int city = 0;
  String yourState = '';

  @override
  void dispose() {
    cityController.dispose();
    stateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double blockHeight = (height / 100);

    double width = MediaQuery.of(context).size.width;
    double blockWidth = (width / 100);

    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is RegisterLoadingState) {
            isLoading = true;
          } else if (state is RegisterSuccessState) {
            GoRouter.of(context).pushReplacement(AppRouter.kChangePassword);
            isLoading = false;
          } else if (state is RegisterFailureState) {
            showSnackBar(context, state.errorMessage);
            isLoading = false;
          }
        },
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.symmetric(
                horizontal: blockWidth * 5, vertical: blockHeight * 1),
            child: LoadingOverlay(
              isLoading: isLoading,
              child: Form(
                key: formKey,
                child: ListView(
                  children: [
                    Center(
                      child: Text(
                        LocaleKeys.createAccount.tr(),
                        style: Styles.textStyle22Inter.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: blockHeight * 2,
                    ),
                    CustomTextField(
                      prefixIcon: const Icon(
                        FontAwesomeIcons.user,
                        color: kHintColor,
                        size: 20,
                      ),
                      controller: firstNameController,
                      hintText: 'First Name',
                      keyboardType: TextInputType.text,
                    ),
                    CustomTextField(
                      prefixIcon: const Icon(
                        FontAwesomeIcons.user,
                        color: kHintColor,
                        size: 20,
                      ),
                      controller: lastNameController,
                      hintText: 'Last Name',
                      keyboardType: TextInputType.name,
                    ),
                    CustomTextField(
                      prefixIcon: const Icon(
                        Icons.email_rounded,
                        color: kHintColor,
                        size: 20,
                      ),
                      controller: emailController,
                      hintText: LocaleKeys.Email.tr(),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    CustomTextField(
                      prefixIcon: const Icon(
                        FontAwesomeIcons.circleUser,
                        color: kHintColor,
                        size: 20,
                      ),
                      controller: userNameController,
                      hintText: 'UserName',
                      keyboardType: TextInputType.name,
                    ),
                    CustomTextField(
                      pass: obscureText,
                      controller: passController,
                      hintText: LocaleKeys.Password.tr(),
                      prefixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            obscureText = !obscureText;
                          });
                        },
                        icon: Icon(
                          obscureText ? Icons.visibility_off : Icons.visibility,
                          color: kHintColor,
                          size: 20,
                        ),
                      ),
                      keyboardType: TextInputType.visiblePassword,
                    ),
                    // CustomTextField(
                    //   prefixIcon: const Icon(
                    //     Icons.phone,
                    //     color: kHintColor,
                    //     size: 20,
                    //   ),
                    //   controller: phoneController,
                    //   hintText: LocaleKeys.phone.tr(),
                    //   keyboardType: TextInputType.number,
                    //   inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    // ),
                    // Container(
                    //   height: blockHeight * 6.5,
                    //   decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(50),
                    //     border: Border.all(
                    //       color: kGreenColor,
                    //       width: 2,
                    //     ),
                    //   ),
                    //   child: Padding(
                    //     padding:
                    //         EdgeInsets.symmetric(horizontal: blockWidth * 2.5),
                    //     child: Row(
                    //       children: [
                    //         const Icon(
                    //           FontAwesomeIcons.venusMars,
                    //           size: 20,
                    //           color: kHintColor,
                    //         ),
                    //         SizedBox(
                    //           width: blockWidth * 4,
                    //         ),
                    //         Text(
                    //           LocaleKeys.gender.tr(),
                    //           style: TextStyle(
                    //             color: Colors.black
                    //                 .withOpacity(0.4000000059604645),
                    //             fontSize: 14,
                    //             fontWeight: FontWeight.w400,
                    //           ),
                    //         ),
                    //         Row(
                    //           children: [
                    //             Radio<bool>(
                    //               value: true,
                    //               activeColor: kGreenColor,
                    //               groupValue: gender,
                    //               onChanged: (value) {
                    //                 setState(() {
                    //                   gender = value!;
                    //                 });
                    //               },
                    //             ),
                    //             Text(
                    //               LocaleKeys.Male.tr(),
                    //               style: Styles.textStyle16Inter,
                    //             ),
                    //           ],
                    //         ),
                    //         Row(
                    //           children: [
                    //             Radio<bool>(
                    //               value: false,
                    //               groupValue: gender,
                    //               activeColor: kGreenColor,
                    //               onChanged: (value) {
                    //                 setState(() {
                    //                   gender = value!;
                    //                 });
                    //               },
                    //             ),
                    //             Text(
                    //               LocaleKeys.Female.tr(),
                    //               style: Styles.textStyle16Inter,
                    //             ),
                    //           ],
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: blockHeight * 1,
                    // ),
                    // CustomTextField(
                    //   onTap: () {
                    //     setState(() {
                    //       showLocationFields = !showLocationFields;
                    //     });
                    //   },
                    //   hintText: LocaleKeys.chooseLocation.tr(),
                    //   suffixIcon: const Icon(
                    //     FontAwesomeIcons.chevronDown,
                    //     size: 20,
                    //     color: kGreenColor,
                    //   ),
                    //   controller: TextEditingController(
                    //       text:
                    //           '${cityController.text}${stateController.text}'),
                    //   readOnly: true,
                    //   prefixIcon: const Icon(
                    //     FontAwesomeIcons.locationDot,
                    //     size: 20,
                    //     color: kHintColor,
                    //   ),
                    // ),
                    // if (showLocationFields)
                    //   Padding(
                    //     padding:
                    //         EdgeInsets.symmetric(horizontal: blockWidth * 2.5),
                    //     child: Column(
                    //       children: [
                    //         Row(
                    //           children: [
                    //             Expanded(
                    //               child: CustomTextField(
                    //                 hintText: LocaleKeys.city.tr(),
                    //                 controller: cityController,
                    //                 onChanged: (value) {
                    //                   setState(() {
                    //                     city = int.tryParse(value) ?? 0;
                    //                   });
                    //                 },
                    //               ),
                    //             ),
                    //             SizedBox(width: blockWidth * 2),
                    //             Expanded(
                    //               child: CustomTextField(
                    //                 hintText: LocaleKeys.state.tr(),
                    //                 controller: stateController,
                    //                 onChanged: (value) {
                    //                   setState(() {
                    //                     yourState = value;
                    //                   });
                    //                 },
                    //               ),
                    //             ),
                    //           ],
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // CustomTextField(
                    //   hintText: 'Choose your Birthday',
                    //   controller: dateOfBirthController,
                    //   readOnly: true,
                    //   onTap: () async {
                    //     DateTime? pickedDate = await showDatePicker(
                    //         context: context,
                    //         initialDate: DateTime.now(),
                    //         firstDate: DateTime(1950),
                    //         lastDate: DateTime(2100));

                    //     if (pickedDate != null) {
                    //       String formattedDate =
                    //           DateFormat('yyyy-MM-dd').format(pickedDate);

                    //       setState(() {
                    //         dateOfBirthController.text = formattedDate;
                    //       });
                    //     } else {}
                    //   },
                    // ),
                    Row(
                      children: [
                        Checkbox(
                          fillColor:
                              MaterialStateProperty.resolveWith((states) {
                            if (states.contains(MaterialState.selected)) {
                              return kGreenColor;
                            }
                            return Colors.transparent;
                          }),
                          value: isChecked,
                          onChanged: (newValue) {
                            setState(() {
                              isChecked = newValue!;
                            });
                          },
                        ),
                        Text(
                          LocaleKeys.appPolicy.tr(),
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    isChecked
                        ? CustomButton(
                            height: 40,
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                BlocProvider.of<AuthCubit>(context)
                                    .registerUser(
                                  firstName: firstNameController.text,
                                  lastName: lastNameController.text,
                                  email: emailController.text,
                                  userName: userNameController.text,
                                  password: passController.text,
                                  // phoneNumber: phoneController.text,
                                  // maleGender: gender,
                                  // city: int.tryParse(cityController.text) ?? 0,
                                  // state: stateController.text,
                                  // dateOfBirth: DateTime.parse(
                                  //     dateOfBirthController.text),
                                );
                              }
                            },
                            text: state is RegisterLoadingState
                                ? LocaleKeys.Loading.tr()
                                : LocaleKeys.Signup.tr().toUpperCase(),
                          )
                        : CustomButton(
                            height: 40,
                            backgroundColor: const Color(0x7F53AC5F),
                            text: LocaleKeys.Signup.tr().toUpperCase(),
                          ),
                    SizedBox(
                      height: blockHeight * 1,
                    ),
                    const GoogleFacebookLogin(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
