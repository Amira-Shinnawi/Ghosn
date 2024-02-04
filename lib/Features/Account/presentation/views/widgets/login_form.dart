import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ghosn_app/Features/Account/presentation/manager/cubit/auth_cubit.dart';
import 'package:ghosn_app/constants.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/assets_data.dart';
import '../../../../../core/utils/functions/is_arabic.dart';
import '../../../../../core/utils/style.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../../../../../translations/local_keys.g.dart';

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
    double width = MediaQuery.of(context).size.width;

    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is LoginLoadingState) {
            isLoading = true;
          } else if (state is LoginSuccessState) {
            GoRouter.of(context).pushReplacement(AppRouter.kChangePassword);
            isLoading = false;
          } else if (state is LoginFailureState) {
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
                        LocaleKeys.signInYourAccount.tr(),
                        style: Styles.textStyle22Inter.copyWith(
                          color: Colors.black,
                          fontSize: isArabic() ? 24 : 22,
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
                      controller: userNameController,
                      hinText: LocaleKeys.Email.tr(),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(
                      height: height * .03,
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
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    SizedBox(
                      height: height * .03,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          AssetsData.google,
                        ),
                        SizedBox(
                          width: width * .05,
                        ),
                        Image.asset(
                          AssetsData.facebook,
                        ),
                      ],
                    )
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
