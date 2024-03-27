import 'package:flutter/material.dart';

import 'widgets/article_content_body.dart';

class ArticleContent extends StatelessWidget {
  const ArticleContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: ArticleContentBody(),
      ),
    );
  }
}
