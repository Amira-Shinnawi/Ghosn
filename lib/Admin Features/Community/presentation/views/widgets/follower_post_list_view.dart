import 'package:flutter/material.dart';
import 'package:ghosn_app/Admin%20Features/Community/data/model/follower_user_model.dart';

import 'follower_post_view.dart';

class FollowerPostsListView extends StatefulWidget {
  const FollowerPostsListView({
    super.key,
    required this.followingsModel,
  });

  final Followers followingsModel;

  @override
  State<FollowerPostsListView> createState() => _FollowerPostsListViewState();
}

class _FollowerPostsListViewState extends State<FollowerPostsListView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: widget.followingsModel.follower!.posts!.length,
      itemBuilder: (context, index) {
        PostsFollower posts = widget.followingsModel.follower!.posts![index];
        return FollowerPostItem(
          postModel: posts,
          allComments: int.parse(posts.totalComments.toString()),
          likes: 0,
        );
      },
    );
  }
}
