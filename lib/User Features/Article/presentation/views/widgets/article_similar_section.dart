import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ghosn_app/User%20Features/Article/data/model/article_model.dart';

import 'similar_article_list_view.dart';

class ArticleSimilarSection extends StatelessWidget {
  const ArticleSimilarSection({
    super.key,
    required this.articlesModel,
  });
  final AllArticles articlesModel;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double blocHeight = (height / 100);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: blocHeight * 1),
      child: Column(
        children: [
          Expanded(
            child: SimilarArticleListView(
              articlesModel: articlesModel,
            ),
          ),
        ],
      ),
    );
  }
}
