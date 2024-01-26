import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ghosn_app/core/utils/app_router.dart';
import 'package:ghosn_app/core/utils/assets_data.dart';
import 'package:ghosn_app/core/utils/style.dart';
import 'package:ghosn_app/core/widgets/custom_icon_button.dart';
import 'package:go_router/go_router.dart';

import '../../../../../translations/local_keys.g.dart';

class LoginOptionsBody extends StatelessWidget {
  const LoginOptionsBody({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Column(
        children: [
          Image.asset(
            AssetsData.loginOption,
            height: height * .6,
            width: width * 1.2,
          ),
          CustomIconButton(
            text: LocaleKeys.useEmailOrPhone.tr(),
            childIcon: const Icon(
              Icons.email_outlined,
              color: Color(0xff39579A),
            ),
            onPressed: () {
              GoRouter.of(context).push(AppRoute.kLoginPage);
            },
          ),
          CustomIconButton(
            text: LocaleKeys.continueWithFacebook.tr(),
            childIcon: Image.asset(
              AssetsData.facebook,
              width: 30,
            ),
          ),
          CustomIconButton(
            text: LocaleKeys.continueWithGoogle.tr(),
            childIcon: Image.asset(
              AssetsData.google,
              width: 25,
            ),
          ),
          SizedBox(
            height: height * .025,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                LocaleKeys.alreadyhaveaccount.tr(),
                style: Styles.textStyle22Inter.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                ),
              ),
              GestureDetector(
                onTap: () {
                  GoRouter.of(context).push(AppRoute.kRegisterPage);
                },
                child: Text(
                  LocaleKeys.Signup.tr(),
                  style: Styles.textStyle22Inter.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
