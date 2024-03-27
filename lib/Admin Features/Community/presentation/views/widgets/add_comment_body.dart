import 'package:flutter/material.dart';
import 'package:ghosn_app/constants.dart';

import '../../../../../core/widgets/custom_text_field.dart';
import 'comment_post_item.dart';
import 'post_item.dart';

class AddCommentBody extends StatefulWidget {
  const AddCommentBody({super.key});

  @override
  State<AddCommentBody> createState() => _AddCommentBodyState();
}

class _AddCommentBodyState extends State<AddCommentBody> {
  List<String> comments = [];
  TextEditingController commentController = TextEditingController();

  void addComment() {
    String content = commentController.text.trim();
    if (content.isNotEmpty) {
      setState(() {
        comments.add(content);
        commentController.clear();
      });
    }
  }

  @override
  void dispose() {
    commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double blockHeight = (height / 100);
    double blockWidth = (width / 100);
    return Padding(
      padding: EdgeInsets.only(
          left: blockWidth * 2, right: blockWidth * 2, bottom: blockHeight * 2),
      child: Column(
        children: [
          PostItem(
            allComments: comments.length,
          ),
          Expanded(
              child: ListView.builder(
            itemCount: comments.length,
            itemBuilder: (context, index) {
              return CommentPostItem(
                commentContent: comments[index],
                onReplay: () {},
              );
            },
          )),
          CustomTextField(
            controller: commentController,
            width: 1,
            hintText: 'Write a comment...',
            suffixIcon: IconButton(
              onPressed: addComment,
              icon: const Icon(
                Icons.send_rounded,
                color: kGreenColor,
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
