import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_appbar.dart';
import 'widgets/create_category_body.dart';

class CreateCategoryView extends StatelessWidget {
  const CreateCategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              size: 20,
            ),
          ),
        ),
        body: const SafeArea(
          child: CreateCategoryBody(),
        ));
  }
}
