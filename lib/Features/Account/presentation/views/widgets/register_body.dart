import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ghosn_app/constants.dart';

import '../../../../../core/utils/assets_data.dart';
import '../../../../../core/utils/style.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../../../../../translations/local_keys.g.dart';

class RegisterPageBody extends StatefulWidget {
  const RegisterPageBody({super.key});

  @override
  State<RegisterPageBody> createState() => _RegisterPageBodyState();
}

class _RegisterPageBodyState extends State<RegisterPageBody> {
  bool obscureText = true;
  bool isChecked = false;

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
                    hinText: LocaleKeys.Email.tr(),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(
                    height: height * .018,
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
                    keyboardType: TextInputType.visiblePassword,
                  ),
                  SizedBox(
                    height: height * .018,
                  ),
                  CustomTextFelid(
                    pass: obscureText,
                    hinText: LocaleKeys.confirmpassword.tr(),
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
                  CustomTextFelid(
                    prefixIcon: const Icon(
                      Icons.phone,
                      color: kHintColor,
                    ),
                    hinText: LocaleKeys.phone.tr(),
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        fillColor: MaterialStateProperty.resolveWith((states) {
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
                          onPressed: () {},
                          text: LocaleKeys.Signup.tr().toUpperCase(),
                        )
                      : CustomButton(
                          backgroundColor: const Color(0xff7F53AC5F),
                          text: LocaleKeys.Signup.tr().toUpperCase(),
                        ),
                  SizedBox(
                    height: height * .015,
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
