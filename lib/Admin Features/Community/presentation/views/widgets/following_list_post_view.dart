import 'package:flutter/material.dart';

import '../../../data/model/following_user_model/following_user_model.dart';
import 'firend_post_item.dart';

class FollowerFollowingPostsListView extends StatefulWidget {
  const FollowerFollowingPostsListView({
    super.key,
    required this.followingsModel,
  });

  final Followings followingsModel;

  @override
  State<FollowerFollowingPostsListView> createState() =>
      _FollowerFollowingPostsListViewState();
}

class _FollowerFollowingPostsListViewState
    extends State<FollowerFollowingPostsListView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: widget.followingsModel.followee!.posts!.length,
      itemBuilder: (context, index) {
        PostsFollowing posts = widget.followingsModel.followee!.posts![index];
        return FriendPostItem(
          postModel: posts,
          allComments: int.parse(posts.totalComments.toString()),
          likes: 0,
        );
      },
    );
  }
}
