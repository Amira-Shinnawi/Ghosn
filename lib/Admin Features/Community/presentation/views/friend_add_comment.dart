import 'package:flutter/material.dart';
import 'package:ghosn_app/Admin%20Features/Community/data/model/following_user_model/following_user_model.dart';
import 'package:ghosn_app/core/widgets/custom_appbar.dart';

import 'widgets/friend_add_comment_body.dart';

class FriendAddComment extends StatelessWidget {
  const FriendAddComment({
    super.key,
    required this.postCommentModel,
  });
  final PostsFollowing postCommentModel;
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
        child: FriendAddCommentBody(
          userModel: postCommentModel,
        ),
      ),
    );
  }
}
