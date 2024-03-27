import 'package:flutter/material.dart';
import 'package:ghosn_app/Admin%20Features/Community/presentation/views/widgets/privacy_post.dart';

import 'add_photo_video_post.dart';
import 'post_type.dart';
import 'write_content_post.dart';

class CreatePostBody extends StatelessWidget {
  const CreatePostBody({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double blockHeight = (height / 100);
    double width = MediaQuery.of(context).size.width;
    double blockWidth = (width / 100);
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: blockWidth * 3, vertical: blockHeight * 2),
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: WritePostContent(),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: blockHeight * 2,
            ),
          ),
          const SliverToBoxAdapter(
            child: AddPhotoVideo(),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: blockHeight * 2,
            ),
          ),
          const SliverToBoxAdapter(
            child: PostType(),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: blockHeight * 2,
            ),
          ),
          const SliverToBoxAdapter(
            child: PostPrivacy(),
          ),
        ],
      ),
    );
  }
}
