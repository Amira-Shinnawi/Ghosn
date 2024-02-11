import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ghosn_app/Features/Account/presentation/manager/cubit/auth_cubit.dart';
import 'package:ghosn_app/core/utils/app_router.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/style.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_text_field.dart';
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

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

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
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                content: Text(
                  state.errorMessage,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
                backgroundColor: Colors.red,
              ),
            );
            isLoading = false;
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 27),
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
                      height: height * .028,
                    ),
                    CustomTextFelid(
                      prefixIcon: const Icon(
                        Icons.email_rounded,
                        color: kHintColor,
                      ),
                      controller: emailController,
                      hinText: LocaleKeys.email.tr(),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(
                      height: height * .018,
                    ),
                    CustomTextFelid(
                        prefixIcon: const Icon(
                          Icons.email_rounded,
                          color: kHintColor,
                        ),
                        controller: userNameController,
                        hinText: 'UserName',
                        keyboardType: TextInputType.name),
                    SizedBox(
                      height: height * .018,
                    ),
                    CustomTextFelid(
                      pass: obscureText,
                      controller: passController,
                      hinText: LocaleKeys.password.tr(),
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
                      height: height * .018,
                    ),
                    // CustomTextFelid(
                    //   pass: obscureText,
                    //   hinText: LocaleKeys.confirmpassword.tr(),
                    //   prefixIcon: IconButton(
                    //     onPressed: () {
                    //       setState(() {
                    //         obscureText = !obscureText;
                    //       });
                    //     },
                    //     icon: Icon(
                    //       obscureText ? Icons.visibility_off : Icons.visibility,
                    //       color: kHintColor,
                    //     ),
                    //   ),
                    //   keyboardType: TextInputType.visiblePassword,
                    // ),
                    // SizedBox(
                    //   height: height * .018,
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
                                ? 'Loading...'
                                : LocaleKeys.signUp.tr().toUpperCase(),
                          )
                        : CustomButton(
                            backgroundColor: const Color(0xff7F53AC5F),
                            text: LocaleKeys.signUp.tr().toUpperCase(),
                          ),
                    SizedBox(
                      height: height * .015,
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
