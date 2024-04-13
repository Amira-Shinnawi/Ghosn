import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ghosn_app/core/utils/app_router.dart';
import 'package:ghosn_app/core/utils/assets_data.dart';
import 'package:go_router/go_router.dart';

import '../../../../../constants.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../../../../../translations/local_keys.g.dart';

class ChangePasswordBody extends StatefulWidget {
  const ChangePasswordBody({super.key});

  @override
  State<ChangePasswordBody> createState() => _ChangePasswordBodyState();
}

class _ChangePasswordBodyState extends State<ChangePasswordBody> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 31, vertical: 10),
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Image.asset(
                AssetsData.changepass,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              height: height * .05,
            ),
            CustomTextField(
              pass: obscureText,
              hintText: LocaleKeys.newPassword.tr(),
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
            CustomTextField(
              pass: obscureText,
              hintText: LocaleKeys.confirmpassword.tr(),
              prefixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    obscureText = !obscureText;
                  });
                },
                icon: Icon(
                  obscureText ? Icons.visibility_off : Icons.visibility,
                  color: Colors.grey,
                ),
              ),
              keyboardType: TextInputType.visiblePassword,
            ),
            SizedBox(
              height: height * .1,
            ),
            CustomButton(
              onPressed: () {
                GoRouter.of(context).push(AppRouter.kLoginOptionView);
              },
              text: LocaleKeys.LOGIN.tr(),
            ),
          ],
        ),
      ),
    );
  }
}
