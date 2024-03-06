import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ghosn_app/Features/home/presentation/views/widgets/chart_body.dart';

import '../../../../core/utils/style.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../../../../translations/local_keys.g.dart';

class Chart extends StatelessWidget {
  const Chart({super.key});
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
          ),
        ),
        titleAppBar: Text(
          LocaleKeys.ShoppingCart.tr(),
          style: Styles.textStyle20Inter.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              FontAwesomeIcons.trashCan,
              size: 20,
            ),
          ),
        ],
      ),
      body: const SafeArea(
        child: ShoppingCartBody(),
      ),
    );
  }
}
