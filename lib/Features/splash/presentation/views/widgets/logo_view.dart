import 'package:flutter/material.dart';
import 'package:ghosn_app/core/utils/style.dart';

import '../../../../../core/utils/assets_data.dart';

class LogoView extends StatelessWidget {
  const LogoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          AssetsData.logo,
        ),
        const SizedBox(
          height: 27,
        ),
        const Center(
          child: Text(
            'Welcome To Planta World',
            style: Styles.textStyle32Itim,
          ),
        ),
      ],
    );
  }
}
