import 'package:flutter/material.dart';
import 'package:ghosn_app/Admin%20Features/Article/presentation/views/article_content.dart';
import 'package:ghosn_app/core/widgets/custom_button.dart';

import '../../../../../core/widgets/custom_text_field.dart';
import 'latest_item_list_view.dart';

class LatestArticleBody extends StatelessWidget {
  const LatestArticleBody({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double blocHeight = (height / 100);
    double width = MediaQuery.of(context).size.width;
    double blocWidth = (width / 100);
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: blocWidth * 3, vertical: blocHeight * 1),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(
                bottom: blocHeight * .5,
              ),
              child: CustomTextField(
                prefixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.search),
                  color: Colors.black.withOpacity(.5),
                ),
                hintText: 'What are you looking for?',
                width: 1,
                color: Colors.black.withOpacity(.3),
              ),
            ),
          ),
          const ArticleItemListView(),
          SliverToBoxAdapter(
            child: CustomButton(
              height: 45,
              text: '+ Add Another Article',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ArticleContent(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
