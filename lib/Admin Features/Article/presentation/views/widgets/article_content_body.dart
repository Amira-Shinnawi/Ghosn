import 'package:flutter/material.dart';
import 'package:ghosn_app/Admin%20Features/Article/presentation/views/widgets/writer_photo.dart';
import 'package:ghosn_app/core/widgets/custom_elvated_button.dart';

import 'article_image_heeader.dart';
import 'article_writer.dart';
import 'overview_article.dart';
import 'upload_article_content.dart';

class ArticleContentBody extends StatelessWidget {
  const ArticleContentBody({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double blocHeight = (height / 100);
    double width = MediaQuery.of(context).size.width;
    double blocWidth = (width / 100);
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: blocHeight * 2, horizontal: blocWidth * 4),
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: UploadArticleContent(),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: blocHeight * 2,
            ),
          ),
          const SliverToBoxAdapter(
            child: ArticleImageHeader(),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: blocHeight * 2,
            ),
          ),
          const SliverToBoxAdapter(
            child: ArticleOverView(),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: blocHeight * 2,
            ),
          ),
          const SliverToBoxAdapter(
            child: ArticleWriter(),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: blocHeight * 2,
            ),
          ),
          const SliverToBoxAdapter(
            child: WriterPhoto(),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: blocHeight * 2,
            ),
          ),
          SliverToBoxAdapter(
            child: CustomElevatedButton(
              onPressed: () {},
              padding: const EdgeInsets.all(10),
              buttonName: 'Save',
            ),
          ),
        ],
      ),
    );
  }
}
