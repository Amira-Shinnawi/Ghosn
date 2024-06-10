import 'package:flutter/material.dart';
import 'package:ghosn_app/Admin%20Features/Community/data/model/follower_user_model.dart';
import 'package:ghosn_app/core/widgets/custom_appbar.dart';

import 'widgets/follower_add_community_body.dart';

class FollowerAddComment extends StatelessWidget {
  const FollowerAddComment({
    super.key,
    required this.postCommentModel,
  });
  final PostsFollower postCommentModel;
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
        child: FollowerAddCommentBody(
          userModel: postCommentModel,
        ),
      ),
    );
  }
}
