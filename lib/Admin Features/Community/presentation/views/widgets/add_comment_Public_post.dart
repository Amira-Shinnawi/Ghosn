import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ghosn_app/Admin%20Features/Community/data/model/recommended_post_model/recommended_post_model.dart';
import 'package:ghosn_app/constants.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:http/http.dart' as http;

import '../../../../../core/utils/Api_Key.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import 'public_comment_item.dart';
import 'public_post_item.dart';

class AddCommentPublicBody extends StatefulWidget {
  const AddCommentPublicBody(
    this.gClient, {
    super.key,
    required this.publicPost,
  });
  final RecommendedPosts publicPost;
  final ValueNotifier<GraphQLClient> gClient;

  @override
  State<AddCommentPublicBody> createState() => _AddCommentPublicBodyState();
}

class _AddCommentPublicBodyState extends State<AddCommentPublicBody> {
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
    commentCount = widget.publicPost.totalComments!;
    likesCount = widget.publicPost.totalLikes!;
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
                  PublicPostItem(
                    widget.gClient,
                    postModel: widget.publicPost,
                    allComments: commentCount,
                    likes: likesCount,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: widget.publicPost.totalComments,
                    itemBuilder: (context, index) {
                      RecommendedPosts comments = widget.publicPost;
                      CommentsPublicPost comment = comments.comments![index];
                      return PublicCommentPostItem(
                        widget.gClient,
                        post: comments,
                        commentModel: comment,
                        commentIndex: index,
                        onReplay: () {},
                        onDeleteTap: () {
                          deleteComment(widget.publicPost.id!, comment.id!);
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
              onPressed: () {
                String commentContent = commentController.text.trim();
                addComment(
                  widget.publicPost.id!,
                  commentContent,
                );
                commentController.clear();

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

      // var newComment = CommentsPublicPost(
      //   id: id,
      //   createdAt: DateTime.now().toString(),
      //   content: content,
      // );

      // setState(() {
      //   widget.publicPost.comments!.add(newComment);
      //   widget.publicPost.totalComments = widget.publicPost.comments!.length;
      // });
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
    setState(() {
      widget.publicPost.comments!
          .removeWhere((comment) => comment.id == commentId);
      widget.publicPost.totalComments = widget.publicPost.comments!.length;
    });
    if (response.statusCode == 404) {
      setState(() {
        widget.publicPost.comments!
            .removeWhere((comment) => comment.id == commentId);
        widget.publicPost.totalComments = widget.publicPost.comments!.length;
      });
    }
    print('Response body: ${response.body}');

    return response;
  }
}
