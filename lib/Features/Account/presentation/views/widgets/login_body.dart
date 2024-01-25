import 'package:flutter/material.dart';
import 'package:ghosn_app/core/utils/assets_data.dart';
import 'package:ghosn_app/core/widgets/custom_button.dart';
import 'package:ghosn_app/generated/l10n.dart';

import '../../../../../core/utils/style.dart';
import '../../../../../core/widgets/custom_text_field.dart';

class LoginPageBody extends StatefulWidget {
  const LoginPageBody({super.key});

  @override
  State<LoginPageBody> createState() => _LoginPageBodyState();
}

class _LoginPageBodyState extends State<LoginPageBody> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 0,
          child: Image.asset(
            AssetsData.signUpImage,
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            height: MediaQuery.of(context).size.height * .55,
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
                      S.of(context).signInYourAccount,
                      style: Styles.textStyle22Inter.copyWith(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  CustomTextFelid(
                    prefixIcon: Icon(
                      Icons.email_rounded,
                      color: Colors.black.withOpacity(0.4000000059604645),
                    ),
                    hinText: S.of(context).Email,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomTextFelid(
                    pass: obscureText,
                    hinText: S.of(context).Password,
                    prefixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          obscureText = !obscureText;
                        });
                      },
                      icon: Icon(
                        obscureText ? Icons.visibility_off : Icons.visibility,
                        color: Colors.black.withOpacity(0.4000000059604645),
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomButton(onPressed: () {}, text: S.of(context).LOGIN),
                  const SizedBox(
                    height: 15,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      S.of(context).forgotPassword,
                      textAlign: TextAlign.center,
                      style: Styles.textStyle22Inter.copyWith(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        AssetsData.google,
                      ),
                      const SizedBox(
                        width: 21,
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
