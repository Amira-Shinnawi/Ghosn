import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ghosn_app/User%20Features/Account/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:ghosn_app/core/utils/app_router.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../../../../../constants.dart';
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
            GoRouter.of(context).pushReplacement(AppRouter.kEditProfile);
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
                      child: Column(
                        children: [
                          Text(
                            LocaleKeys.createAccount.tr(),
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium!
                                .copyWith(
                                  fontFamily: kArefRuqaa,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ],
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
                        FontAwesomeIcons.circleUser,
                        color: kHintColor,
                        size: 20,
                      ),
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(10),
                      ],
                      controller: userNameController,
                      hintText: 'UserName',
                      keyboardType: TextInputType.name,
                      onChanged: (username) {
                        emailController.text = '$username@gmail.com';
                      },
                    ),
                    CustomTextField(
                      prefixIcon: const Icon(
                        Icons.email_rounded,
                        color: kHintColor,
                        size: 20,
                      ),
                      controller: emailController,
                      hintText: ' userName@gamil.com',
                      keyboardType: TextInputType.emailAddress,
                      readOnly: true,
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
