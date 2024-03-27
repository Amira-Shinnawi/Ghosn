import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/style.dart';

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
          'Post Privacy',
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
                const Text(
                  'Public',
                  style: Styles.textStyle16Inter,
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
                const Text(
                  'Followers Only',
                  style: Styles.textStyle16Inter,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
