import 'package:flutter/material.dart';

import 'post_item.dart';

class RecommendedPostsListView extends StatelessWidget {
  const RecommendedPostsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: 10,
      itemBuilder: (context, index) {
        return const PostItem();
      },
    );
  }
}
