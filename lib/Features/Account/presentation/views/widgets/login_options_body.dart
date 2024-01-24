import 'package:flutter/material.dart';
import 'package:ghosn_app/core/utils/assets_data.dart';
import 'package:ghosn_app/core/utils/style.dart';
import 'package:ghosn_app/core/widgets/custom_button.dart';

class LoginOptionsBody extends StatelessWidget {
  const LoginOptionsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(child: Image.asset(AssetsData.loginOption)),
        const CustomButton(
          text: 'I\'ll use email or phone',
          childIcon: Icon(
            Icons.email_outlined,
            color: Color(0xff39579A),
          ),
        ),
        CustomButton(
          text: 'Continue with Facebook',
          childIcon: Image.asset(
            AssetsData.facebook,
            width: 30,
          ),
        ),
        CustomButton(
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
    );
  }
}
