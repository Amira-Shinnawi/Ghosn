import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/style.dart';

class EditingLatestArticle extends StatelessWidget {
  const EditingLatestArticle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Article Title',
          style: Styles.textStyle16Inter.copyWith(
            fontSize: 14,
          ),
        ),
        const Spacer(),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.edit,
            size: 20,
            color: kGreenColor,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.delete,
            size: 20,
            color: kGreenColor,
          ),
        ),
        Expanded(
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              FontAwesomeIcons.ellipsis,
              size: 20,
              color: kGreenColor,
            ),
          ),
        ),
      ],
    );
  }
}
