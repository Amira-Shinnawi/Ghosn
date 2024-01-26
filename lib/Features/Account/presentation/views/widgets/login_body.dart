import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ghosn_app/core/utils/app_router.dart';
import 'package:ghosn_app/core/utils/assets_data.dart';
import 'package:ghosn_app/core/widgets/custom_button.dart';
import 'package:go_router/go_router.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/functions/is_arabic.dart';
import '../../../../../core/utils/style.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../../../../../translations/local_keys.g.dart';

class LoginPageBody extends StatefulWidget {
  const LoginPageBody({super.key});

  @override
  State<LoginPageBody> createState() => _LoginPageBodyState();
}

class _LoginPageBodyState extends State<LoginPageBody> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Positioned(
          top: 0,
          right: 0,
          left: 0,
          child: Image.asset(
            AssetsData.signUpImage,
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            height: height * .55,
            decoration: const ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 27),
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
                    hinText: LocaleKeys.Email.tr(),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(
                    height: height * .03,
                  ),
                  CustomTextFelid(
                    pass: obscureText,
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
                    onPressed: () {},
                    text: LocaleKeys.LOGIN.tr(),
                  ),
                  SizedBox(
                    height: height * .015,
                  ),
                  GestureDetector(
                    onTap: () {
                      GoRouter.of(context).push(AppRoute.kChangePassword);
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
        )
      ],
    );
  }
}
