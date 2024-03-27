import 'package:flutter/material.dart';

import 'comment_post_item.dart';

class AllCommentsListView extends StatelessWidget {
  const AllCommentsListView({
    super.key,
    required this.comments,
  });

  final List<String> comments;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: comments.length,
      itemBuilder: (context, index) {
        return CommentPostItem(
          commentContent: comments[index],
          onReplay: () {},
        );
      },
    );
  }
}
