import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/style.dart';
import '../../../../../translations/local_keys.g.dart';

class PostPrivacy extends StatefulWidget {
  const PostPrivacy({super.key});

  @override
  State<PostPrivacy> createState() => _PostPrivacyState();
}

class _PostPrivacyState extends State<PostPrivacy> {
  bool privacyPost = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.PostPrivacy.tr(),
          style: Styles.textStyle16Inter.copyWith(
            decoration: TextDecoration.underline,
          ),
        ),
        Row(
          children: [
            Row(
              children: [
                Radio<bool>(
                  value: true,
                  activeColor: kGreenColor,
                  groupValue: privacyPost,
                  onChanged: (value) {
                    setState(() {
                      privacyPost = value!;
                    });
                  },
                ),
                Text(
                  LocaleKeys.Public.tr(),
                  style: Styles.textStyle16Inter.copyWith(
                    decoration: TextDecoration.underline,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Radio<bool>(
                  value: false,
                  groupValue: privacyPost,
                  activeColor: kGreenColor,
                  onChanged: (value) {
                    setState(() {
                      privacyPost = value!;
                    });
                  },
                ),
                Text(
                  LocaleKeys.FollowersOnly.tr(),
                  style: Styles.textStyle16Inter.copyWith(
                    decoration: TextDecoration.underline,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
