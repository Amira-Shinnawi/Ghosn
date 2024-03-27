import 'package:flutter/material.dart';
import 'package:ghosn_app/core/widgets/custom_text_field.dart';

import 'recommended_friend.dart';

class WhoToFollow extends StatelessWidget {
  const WhoToFollow({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          prefixIcon: const Icon(
            Icons.search,
            size: 20,
          ),
          hintText: 'Search',
          width: 1,
        ),
        Expanded(
          child: ListView.builder(
              itemCount: 10,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return const RecommendedFriendItem();
              }),
        ),
      ],
    );
  }
}
