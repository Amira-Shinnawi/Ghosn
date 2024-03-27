import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/utils/assets_data.dart';
import '../../../data/repo/auth_login_options_control.dart';

class GoogleFacebookLogin extends StatelessWidget {
  const GoogleFacebookLogin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            Provider.of<AuthController>(context, listen: false)
                .allowUserToLoginGoogle();
          },
          child: Image.asset(
            AssetsData.google,
          ),
        ),
        SizedBox(
          width: width * .1,
        ),
        GestureDetector(
          onTap: () {
            Provider.of<AuthController>(context, listen: false)
                .allowUserToLogInFacebook();
          },
          child: Image.asset(
            AssetsData.facebook,
          ),
        ),
      ],
    );
  }
}
