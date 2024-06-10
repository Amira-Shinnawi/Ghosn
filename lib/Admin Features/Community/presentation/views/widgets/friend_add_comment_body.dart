import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ghosn_app/Admin%20Features/Community/data/model/following_user_model/following_user_model.dart';
import 'package:ghosn_app/constants.dart';
import 'package:http/http.dart' as http;

import '../../../../../core/utils/Api_Key.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import 'firend_post_item.dart';
import 'friend_comment_post_item.dart';

class FriendAddCommentBody extends StatefulWidget {
  const FriendAddCommentBody({
    super.key,
    required this.userModel,
  });
  final PostsFollowing userModel;

  @override
  State<FriendAddCommentBody> createState() => _FriendAddCommentBodyState();
}

class _FriendAddCommentBodyState extends State<FriendAddCommentBody> {
  TextEditingController commentController = TextEditingController();
  int commentCount = 0;
  int likesCount = 0;
  @override
  void dispose() {
    commentController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    commentCount = widget.userModel.totalComments!;
    likesCount = widget.userModel.totalLikes!;
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
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  FriendPostItem(
                    postModel: widget.userModel,
                    allComments: commentCount,
                    likes: likesCount,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: widget.userModel.comments!.length,
                    itemBuilder: (context, index) {
                      PostsFollowing comments = widget.userModel;
                      CommentsFollowing comment = comments.comments![index];
                      return FriendCommentPostItem(
                        post: comments,
                        commentModel: comment,
                        commentIndex: index,
                        onReplay: () {},
                        onDeleteTap: () {
                          deleteComment(widget.userModel.id!, comment.id!);
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          CustomTextField(
            controller: commentController,
            width: 1,
            hintText: 'Write a comment...',
            suffixIcon: IconButton(
              onPressed: () async {
                String commentContent = commentController.text.trim();
                if (commentContent.isNotEmpty) {
                  await addComment(
                    widget.userModel.id!,
                    commentContent,
                  );
                  commentController.clear();
                }
                setState(() {
                  commentCount++;
                });
                Navigator.pop(context);
              },
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

  Future<http.Response> addComment(int id, String content) async {
    var url = Uri.parse("${ApiKeys.BASE_URL}/api/post/AddComment");
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $userToken',
    };
    var body = {"postId": id, "content": content};

    var response = await http.post(
      url,
      headers: headers,
      body: json.encode(body),
    );

    if (response.statusCode == 204 || response.statusCode == 200) {
      print(response.statusCode);
    } else {
      print(response.statusCode);
    }
    return response;
  }

  Future<http.Response> deleteComment(int postId, int commentId) async {
    var response = await http.delete(
      Uri.parse(
          "${ApiKeys.BASE_URL}/api/post/Comment?PostId=$postId&CommmentId=$commentId"),
      headers: {
        'Authorization': 'Bearer $userToken',
      },
    );
    print('Response status: ${response.statusCode}');
    // setState(() {
    //   widget.userModel.comments!
    //       .removeWhere((comment) => comment.id == commentId);
    //   widget.userModel.totalComments =
    //       widget.userModel.comments!.length;
    // });
    if (response.statusCode == 404) {
      // setState(() {
      //   widget.userModel.comments!
      //       .removeWhere((comment) => comment.id == commentId);
      //   widget.userModel.totalComments =
      //       widget.userModel.comments!.length;
      // });
    }
    print('Response body: ${response.body}');

    return response;
  }
}
