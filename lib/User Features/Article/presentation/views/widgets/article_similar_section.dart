import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/style.dart';
import 'similar_article_list_view.dart';

class ArticleSimilarSection extends StatelessWidget {
  const ArticleSimilarSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double blocHeight = (height / 100);
    return Container(
      height: blocHeight * 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          width: 2,
          color: kGreenColor,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: blocHeight * 1),
        child: Column(
          children: [
            const Text(
              'Recommended Articles',
              style: Styles.textStyle16Inter,
            ),
            SizedBox(
              height: blocHeight * 1,
            ),
            const Expanded(
              child: SimilarArticleListView(),
            ),
          ],
        ),
      ),
    );
  }
}
