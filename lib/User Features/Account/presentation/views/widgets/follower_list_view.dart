import 'package:flutter/material.dart';

import '../../../../../Admin Features/Community/presentation/views/widgets/recommended_friend.dart';

class FollowersListView extends StatelessWidget {
  const FollowersListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: 10,
        itemBuilder: (context, index) {
          return const RecommendedFriendItem();
        });
  }
}
