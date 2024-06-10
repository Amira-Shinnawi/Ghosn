import 'package:flutter/material.dart';
import 'package:ghosn_app/Admin%20Features/Community/data/model/recommended_post_model/recommended_post_model.dart';
import 'package:ghosn_app/core/widgets/custom_appbar.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'widgets/add_comment_Public_post.dart';

class AddCommentPublicPost extends StatelessWidget {
  const AddCommentPublicPost(
    this.gClient, {
    super.key,
    required this.postCommentModel,
  });
  final RecommendedPosts postCommentModel;
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
        child: AddCommentPublicBody(
          gClient,
          publicPost: postCommentModel,
        ),
      ),
    );
  }
}
