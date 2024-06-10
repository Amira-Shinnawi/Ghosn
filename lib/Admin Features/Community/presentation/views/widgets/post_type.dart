import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/style.dart';

class PostType extends StatefulWidget {
  const PostType({super.key});

  @override
  State<PostType> createState() => _PostTypeState();
}

class _PostTypeState extends State<PostType> {
  bool postType = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Post Type',
          style: Styles.textStyle16Inter.copyWith(
            decoration: TextDecoration.underline,
            fontSize: 14,
          ),
        ),
        Row(
          children: [
            Row(
              children: [
                Radio<bool>(
                  value: true,
                  activeColor: kGreenColor,
                  groupValue: postType,
                  onChanged: (value) {
                    setState(() {
                      postType = value!;
                    });
                  },
                ),
                Text(
                  'Q&A',
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
                  groupValue: postType,
                  activeColor: kGreenColor,
                  onChanged: (value) {
                    setState(() {
                      postType = value!;
                    });
                  },
                ),
                Text(
                  'Share Experience',
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
