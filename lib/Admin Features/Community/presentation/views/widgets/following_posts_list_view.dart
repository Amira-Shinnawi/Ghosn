import 'package:flutter/material.dart';

import 'post_item.dart';

class FollowingPostsListView extends StatelessWidget {
  const FollowingPostsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: 5,
      itemBuilder: (context, index) {
        return const PostItem();
      },
    );
  }
}
