import 'package:flutter/material.dart';
import 'package:ghosn_app/Admin%20Features/Community/presentation/views/widgets/post_item.dart';

class PostsListView extends StatelessWidget {
  const PostsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: 10,
      itemBuilder: (context, index) {
        return const PostItem();
      },
    );
  }
}
