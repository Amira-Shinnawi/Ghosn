import 'package:flutter/material.dart';
import 'package:ghosn_app/core/utils/app_router.dart';
import 'package:ghosn_app/core/utils/assets_data.dart';
import 'package:ghosn_app/core/utils/style.dart';
import 'package:ghosn_app/core/widgets/custom_icon_button.dart';
import 'package:go_router/go_router.dart';

class LoginOptionsBody extends StatelessWidget {
  const LoginOptionsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Image.asset(
            AssetsData.loginOption,
            height: MediaQuery.of(context).size.height * .6,
            width: MediaQuery.of(context).size.width * 1.2,
          ),
          CustomIconButton(
            text: 'I\'ll use email or phone',
            childIcon: const Icon(
              Icons.email_outlined,
              color: Color(0xff39579A),
            ),
            onPressed: () {
              GoRouter.of(context).push(AppRoute.kLoginPage);
            },
          ),
          CustomIconButton(
            text: 'Continue with Facebook',
            childIcon: Image.asset(
              AssetsData.facebook,
              width: 30,
            ),
          ),
          CustomIconButton(
            text: 'Continue with Google',
            childIcon: Image.asset(
              AssetsData.google,
              width: 25,
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Already have an account? ',
                style: Styles.textStyle22Inter.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                ),
              ),
              Text(
                'Signup',
                style: Styles.textStyle22Inter.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
