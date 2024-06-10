import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../data/model/article_model.dart';
import 'article_details_list_view.dart';
import 'article_similar_section.dart';

class ArticleDetailsBody extends StatelessWidget {
  const ArticleDetailsBody({super.key, required this.articlesModel});
  final AllArticles articlesModel;
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
          SliverToBoxAdapter(
            child: ArticleDetailsListView(
              articlesModel: articlesModel,
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: blocHeight * 2,
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: ArticleSimilarSection(
              articlesModel: articlesModel,
            ),
          ),
        ],
      ),
    );
  }
}
