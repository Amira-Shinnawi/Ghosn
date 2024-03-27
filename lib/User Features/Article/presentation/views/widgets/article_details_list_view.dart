import 'package:flutter/material.dart';
import 'package:ghosn_app/User%20Features/Article/presentation/views/widgets/article_details_item.dart';

class ArticleDetailsListView extends StatelessWidget {
  const ArticleDetailsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: ((context, index) {
        return const ArticleItemDetails();
      }),
    );
  }
}
