import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ghosn_app/User%20Features/Account/presentation/manager/cubit/auth_cubit.dart';
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

  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final confirmPassController = TextEditingController();

  bool gender = true;

  bool showLocationFields = false;
  final cityController = TextEditingController();
  final stateController = TextEditingController();

  String city = '';
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
                horizontal: blockWidth * 5, vertical: blockHeight * 2),
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
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: blockHeight * 2,
                    ),
                    CustomTextFelid(
                      prefixIcon: const Icon(
                        Icons.email_rounded,
                        color: kHintColor,
                      ),
                      controller: emailController,
                      hinText: LocaleKeys.Email.tr(),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(
                      height: blockHeight * 2,
                    ),
                    CustomTextFelid(
                      prefixIcon: const Icon(
                        Icons.email_rounded,
                        color: kHintColor,
                      ),
                      controller: userNameController,
                      hinText: 'UserName',
                      keyboardType: TextInputType.name,
                    ),
                    SizedBox(
                      height: blockHeight * 2,
                    ),
                    CustomTextFelid(
                      pass: obscureText,
                      controller: passController,
                      hinText: LocaleKeys.Password.tr(),
                      prefixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            obscureText = !obscureText;
                          });
                        },
                        icon: Icon(
                          obscureText ? Icons.visibility_off : Icons.visibility,
                          color: kHintColor,
                        ),
                      ),
                      keyboardType: TextInputType.visiblePassword,
                    ),
                    SizedBox(
                      height: blockHeight * 2,
                    ),
                    CustomTextFelid(
                      pass: obscureText,
                      hinText: LocaleKeys.confirmpassword.tr(),
                      validator: (value) {
                        if (value != passController.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                      prefixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            obscureText = !obscureText;
                          });
                        },
                        icon: Icon(
                          obscureText ? Icons.visibility_off : Icons.visibility,
                          color: kHintColor,
                        ),
                      ),
                      keyboardType: TextInputType.visiblePassword,
                    ),
                    // SizedBox(
                    //   height: blockHeight * 2,
                    // ),
                    // CustomTextFelid(
                    //   prefixIcon: const Icon(
                    //     Icons.phone,
                    //     color: kHintColor,
                    //   ),
                    //   hinText: LocaleKeys.phone.tr(),
                    //   keyboardType: TextInputType.number,
                    //   inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    // ),
                    SizedBox(
                      height: blockHeight * 2,
                    ),
                    Container(
                      height: blockHeight * 6.5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                          color: kGreenColor,
                          width: 3,
                        ),
                      ),
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: blockWidth * 2.5),
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
                                fontSize: 18,
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
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
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
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: blockHeight * 2,
                    ),
                    CustomTextFelid(
                      onTap: () {
                        setState(() {
                          showLocationFields = !showLocationFields;
                        });
                      },
                      hinText: LocaleKeys.chooseLocation.tr(),
                      suffixIcon: const Icon(
                        FontAwesomeIcons.chevronDown,
                        size: 20,
                        color: kGreenColor,
                      ),
                      controller: TextEditingController(
                          text:
                              '${cityController.text}${stateController.text}'),
                      readOnly: true,
                      prefixIcon: const Icon(
                        FontAwesomeIcons.locationDot,
                        size: 20,
                        color: kHintColor,
                      ),
                    ),
                    SizedBox(
                      height: blockHeight * 1,
                    ),
                    if (showLocationFields)
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: blockWidth * 2.5),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: CustomTextFelid(
                                    hinText: LocaleKeys.city.tr(),
                                    controller: cityController,
                                    onChanged: (value) {
                                      setState(() {
                                        city = value;
                                      });
                                    },
                                  ),
                                ),
                                SizedBox(width: blockWidth * 2),
                                Expanded(
                                  child: CustomTextFelid(
                                    hinText: LocaleKeys.state.tr(),
                                    controller: stateController,
                                    onChanged: (value) {
                                      setState(() {
                                        yourState = value;
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
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
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    isChecked
                        ? CustomButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                BlocProvider.of<AuthCubit>(context)
                                    .registerUser(
                                        userName: userNameController.text,
                                        email: emailController.text,
                                        password: passController.text);
                              }
                            },
                            text: state is RegisterLoadingState
                                ? LocaleKeys.Loading.tr()
                                : LocaleKeys.Signup.tr().toUpperCase(),
                          )
                        : CustomButton(
                            backgroundColor: const Color(0xff7F53AC5F),
                            text: LocaleKeys.Signup.tr().toUpperCase(),
                          ),
                    SizedBox(
                      height: blockHeight * 1.5,
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
