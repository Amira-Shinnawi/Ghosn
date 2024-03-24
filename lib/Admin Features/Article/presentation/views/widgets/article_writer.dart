import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/style.dart';
import '../../../../../core/widgets/custom_text_editing.dart';

class ArticleWriter extends StatefulWidget {
  const ArticleWriter({
    super.key,
  });

  @override
  State<ArticleWriter> createState() => _ArticleWriterState();
}

class _ArticleWriterState extends State<ArticleWriter> {
  List<Widget> articleWriterName = [];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Article Writer',
          style: Styles.textStyle16Inter.copyWith(
            decoration: TextDecoration.underline,
          ),
        ),
        CustomTextFormEditing(
          prefixIcon: IconButton(
            onPressed: () {
              setState(() {
                articleWriterName.add(
                  CustomTextFormEditing(
                    prefixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          articleWriterName.removeLast();
                        });
                      },
                      icon: const Icon(
                        Icons.remove,
                        color: Colors.red,
                      ),
                    ),
                    hintText: 'Writer Name',
                  ),
                );
              });
            },
            icon: const Icon(
              Icons.add,
              color: kGreenColor,
            ),
          ),
          hintText: 'Add Writer Name',
        ),
        ...articleWriterName,
      ],
    );
  }
}
