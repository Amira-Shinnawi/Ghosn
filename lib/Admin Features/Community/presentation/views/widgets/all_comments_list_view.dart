import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../../../data/model/post_model/post_model.dart';
import 'comment_post_item.dart';

class AllCommentsListView extends StatelessWidget {
  const AllCommentsListView(
    this.gClient, {
    super.key,
    required this.userModel,
    required this.comments,
  });

  final MyPosts userModel;
  final Comments comments;
  final ValueNotifier<GraphQLClient> gClient;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: userModel.post!.totalComments,
      itemBuilder: (context, index) {
        return CommentPostItem(
          onReplay: () {},
          gClient,
          commentModel: comments,
          commentIndex: index,
          post: userModel,
        );
      },
    );
  }
}
