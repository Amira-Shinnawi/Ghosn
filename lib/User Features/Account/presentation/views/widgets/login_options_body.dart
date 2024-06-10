import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ghosn_app/User%20Features/Account/data/repo/auth_login_options_control.dart';
import 'package:ghosn_app/core/utils/app_router.dart';
import 'package:ghosn_app/core/utils/assets_data.dart';
import 'package:ghosn_app/core/utils/style.dart';
import 'package:ghosn_app/core/widgets/custom_icon_button.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../../translations/local_keys.g.dart';

class LoginOptionsBody extends StatelessWidget {
  const LoginOptionsBody({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 5 / 6,
            child: Image.asset(
              AssetsData.loginOption,
            ),
          ),
          CustomIconButton(
            text: 'I\'ll Use Email Or Phone',
            childIcon: const Icon(
              Icons.email_outlined,
              color: Color(0xff39579A),
            ),
            onPressed: () {
              GoRouter.of(context).push(AppRouter.kLoginPage);
            },
          ),
          CustomIconButton(
            text: LocaleKeys.continueWithFacebook.tr(),
            childIcon: Image.asset(
              AssetsData.facebook,
              width: 30,
            ),
            onPressed: () {
              Provider.of<AuthController>(context, listen: false)
                  .allowUserToLogInFacebook();
            },
          ),
          CustomIconButton(
            text: LocaleKeys.continueWithGoogle.tr(),
            childIcon: Image.asset(
              AssetsData.google,
              width: 25,
            ),
            onPressed: () {
              Provider.of<AuthController>(context, listen: false)
                  .allowUserToLoginGoogle();
            },
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
                style: Styles.textStyle16Inter.copyWith(
                  fontWeight: FontWeight.w400,
                ),
              ),
              GestureDetector(
                onTap: () {
                  GoRouter.of(context).push(AppRouter.kRegisterPage);
                },
                child: Text(
                  LocaleKeys.Signup.tr(),
                  style: Styles.textStyle16Inter.copyWith(
                    fontWeight: FontWeight.bold,
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
