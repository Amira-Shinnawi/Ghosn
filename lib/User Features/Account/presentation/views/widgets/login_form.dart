import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ghosn_app/User%20Features/Account/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:ghosn_app/User%20Features/Account/presentation/views/widgets/google_facebook_login.dart';
import 'package:ghosn_app/constants.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/style.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../../../../../core/widgets/show_snack_bar.dart';
import '../../../../../translations/local_keys.g.dart';
import '../../../../home/presentation/views/bottom_bar.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool obscureText = true;
  bool isLoading = false;

  GlobalKey<FormState> formKey = GlobalKey();

  final userNameController = TextEditingController();
  final passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is LoginLoadingState) {
            isLoading = true;
          } else if (state is LoginSuccessState) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const BottomBar()));

            isLoading = false;
          } else if (state is LoginFailureState) {
            showSnackBar(context, state.errorMessage);
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    content: Text(state.errorMessage),
                  );
                });
            isLoading = false;
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
            child: LoadingOverlay(
              isLoading: isLoading,
              child: Form(
                key: formKey,
                child: ListView(
                  children: [
                    Center(
                      child: Column(
                        children: [
                          Text('Welcome Back',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineLarge!
                                  .copyWith(
                                    fontFamily: kArefRuqaa,
                                    fontWeight: FontWeight.bold,
                                  )),
                          Text(
                            'Login to your account',
                            style: Styles.textStyle16.copyWith(
                              color: Colors.grey,
                              fontFamily: kArefRuqaa,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * .028,
                    ),
                    CustomTextField(
                                  showSuffixIcon: false,

                      prefixIcon: const Icon(
                        FontAwesomeIcons.circleUser,
                        color: kHintColor,
                      ),
                      controller: userNameController,
                      hintText: 'UserName',
                      keyboardType: TextInputType.emailAddress,
                    ),
                    CustomTextField(
                                  showSuffixIcon: false,

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
                        ),
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(
                      height: height * .03,
                    ),
                    CustomButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          BlocProvider.of<AuthCubit>(context).loginUser(
                              userName: userNameController.text,
                              password: passController.text);
                        }
                      },
                      text: state is LoginLoadingState
                          ? 'Loading...'
                          : LocaleKeys.LOGIN.tr(),
                    ),
                    SizedBox(
                      height: height * .015,
                    ),
                    GestureDetector(
                      onTap: () {
                        GoRouter.of(context).push(AppRouter.kChangePassword);
                      },
                      child: Text(
                        LocaleKeys.forgotPassword.tr(),
                        textAlign: TextAlign.center,
                        style: Styles.textStyle22Inter.copyWith(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    SizedBox(
                      height: height * .03,
                    ),
                    const GoogleFacebookLogin()
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
