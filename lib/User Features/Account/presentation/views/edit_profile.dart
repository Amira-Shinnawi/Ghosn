import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ghosn_app/User%20Features/Account/presentation/views/widgets/edit_profile_body.dart';
import 'package:ghosn_app/constants.dart';
import 'package:ghosn_app/core/utils/app_router.dart';
import 'package:ghosn_app/core/widgets/custom_appbar.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/style.dart';
import '../../../../translations/local_keys.g.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 20,
              color: kGreenColor,
            ),
          ),
          centerTitle: false,
          titleAppBar: Text(
            LocaleKeys.editProfile.tr(),
            style: Styles.textStyle18Inter.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                GoRouter.of(context).push(AppRouter.kChangePassword);
              },
              icon: const Icon(
                Icons.settings,
                size: 20,
                color: kGreenColor,
              ),
            ),
          ]),
      body: const SafeArea(
        child: EditProfileBody(),
      ),
    );
  }
}
