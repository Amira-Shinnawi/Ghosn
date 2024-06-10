import 'package:flutter/material.dart';
import 'package:ghosn_app/core/widgets/custom_appbar.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../../data/model/following_post_model/following_post_model.dart';
import 'widgets/add_comment_following_post.dart';

class AddCommentFollowingPost extends StatelessWidget {
  const AddCommentFollowingPost(
    this.gClient, {
    super.key,
    required this.postCommentModel,
  });
  final FollowingPosts postCommentModel;
  final ValueNotifier<GraphQLClient> gClient;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 20,
          ),
        ),
      ),
      body: SafeArea(
        child: AddCommentFollowingBody(
          gClient,
          publicPost: postCommentModel,
        ),
      ),
    );
  }
}
