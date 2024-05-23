import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'article_details_list_view.dart';
import 'article_similar_section.dart';

class ArticleDetailsBody extends StatelessWidget {
  const ArticleDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double blocHeight = (height / 100);
    double width = MediaQuery.of(context).size.width;
    double blocWidth = (width / 100);
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: blocHeight * 2, horizontal: blocWidth * 3),
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: ArticleDetailsListView(),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: blocHeight * 2,
            ),
          ),
          const SliverFillRemaining(
            hasScrollBody: false,
            child: ArticleSimilarSection(),
          ),
        ],
      ),
    );
  }
}
