import 'package:flutter/material.dart';
import 'package:ghosn_app/User%20Features/Account/presentation/views/widgets/login_form.dart';

import '../../../../../core/utils/assets_data.dart';

class LoginPageBody extends StatelessWidget {
  const LoginPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            height: height * .55,
            decoration: const ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(),
            ),
            child: const LoginForm(),
          ),
        ),
        Positioned(
          top: -50,
          right: 0,
          left: 0,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(100),
                bottomRight: Radius.circular(100)),
            child: Align(
              alignment: Alignment.topCenter,
              child: AspectRatio(
                aspectRatio: 1,
                child: Image.asset(
                  AssetsData.signUpImage,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
