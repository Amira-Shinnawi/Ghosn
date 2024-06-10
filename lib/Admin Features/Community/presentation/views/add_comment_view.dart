import 'package:flutter/material.dart';
import 'package:ghosn_app/core/widgets/custom_appbar.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../../data/model/post_model/post_model.dart';
import 'widgets/add_comment_body.dart';

class AddComment extends StatelessWidget {
  const AddComment(
    this.gClient, {
    super.key,
    required this.postCommentModel,
  });
  final MyPosts postCommentModel;
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
        child: AddCommentBody(
          gClient,
          userModel: postCommentModel,
        ),
      ),
    );
  }
}
