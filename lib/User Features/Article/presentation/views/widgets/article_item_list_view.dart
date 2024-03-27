import 'package:flutter/material.dart';

import 'article_item.dart';

class ArticleItemListView extends StatelessWidget {
  const ArticleItemListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
        itemCount: 15,
        itemBuilder: (context, index) {
          final isOddIndex = index % 2 == 1;
          final textDirection =
              isOddIndex ? TextDirection.rtl : TextDirection.ltr;
          return Directionality(
            textDirection: textDirection,
            child: const ArticleItem(),
          );
        });
  }
}
