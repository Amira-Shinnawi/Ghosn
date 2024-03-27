import 'package:flutter/material.dart';

import '../../../../../Admin Features/Community/presentation/views/widgets/recommended_friend.dart';

class FollowingListView extends StatelessWidget {
  const FollowingListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return const RecommendedFriendItem();
        });
  }
}
