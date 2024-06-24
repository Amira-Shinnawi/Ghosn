import 'package:flutter/material.dart';
import 'package:ghosn_app/core/widgets/custom_text_field.dart';

import '../../../../../core/utils/style.dart';

class ArticleOverView extends StatelessWidget {
  const ArticleOverView({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double blocHeight = (height / 100);
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        'Article OverView',
        style: Styles.textStyle16Inter.copyWith(
          decoration: TextDecoration.underline,
        ),
      ),
      SizedBox(
        height: blocHeight * 2,
      ),
      CustomTextField(
        showSuffixIcon: false,
        hintText: 'Write OverView',
        keyboardType: TextInputType.multiline,
        width: 2,
        maxLength: null,
        minLength: 5,
      )
    ]);
  }
}
