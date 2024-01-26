import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ghosn_app/Features/Account/presentation/views/widgets/change_pass_body.dart';
import 'package:ghosn_app/core/utils/style.dart';
import 'package:ghosn_app/translations/local_keys.g.dart';


class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
        title: Text(
          LocaleKeys.changepassword.tr(),
          style: Styles.textStyle22Inter.copyWith(
            fontSize: 25,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: const SafeArea(child: ChangePasswordBody()),
    );
  }
}
