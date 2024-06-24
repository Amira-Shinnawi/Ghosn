import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ghosn_app/core/widgets/custom_appbar.dart';
import 'package:ghosn_app/translations/local_keys.g.dart';

import '../../../../core/utils/style.dart';
import 'widgets/tips_body.dart';

class Tips extends StatelessWidget {
  const Tips({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        titleAppBar: Text(
          LocaleKeys.Photographytips.tr(),
          style: Styles.textStyle18Inter.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SafeArea(child: TipsBody(),),
    );
  }
}
