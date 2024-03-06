import 'package:flutter/material.dart';
import 'package:ghosn_app/Features/Account/presentation/views/widgets/follower_item.dart';

class FollowersListView extends StatelessWidget {
  const FollowersListView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: 10,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 1,
        crossAxisSpacing: 1,
      ),
      itemBuilder: (context, index) {
        return const FollowersItem();
      },
    );
  }
}

