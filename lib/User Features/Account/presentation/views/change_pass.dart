import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ghosn_app/User%20Features/Account/presentation/views/widgets/change_pass_body.dart';
import 'package:ghosn_app/core/utils/functions/shared_pref_cache.dart';
import 'package:ghosn_app/core/widgets/custom_appbar.dart';
import 'package:ghosn_app/translations/local_keys.g.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/app_router.dart';
import '../../../../core/utils/style.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          titleAppBar: Text(
            LocaleKeys.changepassword.tr(),
            style: Styles.textStyle22Inter.copyWith(
              fontSize: 25,
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
          leading: IconButton(
            onPressed: () {
              GoRouter.of(context).push(AppRouter.kLoginOptionView);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
            ),
          ),
          actions: [
            IconButton(
                onPressed: () async {
                  await SharedPrefCache.deleteCacheItem(key: 'token');
                  await SharedPrefCache.deleteCacheItem(key: 'accessToken');

                  GoRouter.of(context)
                      .pushReplacement(AppRouter.kLoginOptionView);
                },
                icon: const Icon(Icons.logout)),
          ]),
      body: const SafeArea(child: ChangePasswordBody()),
    );
  }
}
