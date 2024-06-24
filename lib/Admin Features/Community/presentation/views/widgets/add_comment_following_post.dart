import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ghosn_app/Admin%20Features/Community/presentation/views/widgets/following_post_item.dart';
import 'package:ghosn_app/constants.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:http/http.dart' as http;

import '../../../../../core/utils/Api_Key.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../../../../../translations/local_keys.g.dart';
import '../../../data/model/following_post_model/following_post_model.dart';
import 'following_comment_post_item.dart';

class AddCommentFollowingBody extends StatefulWidget {
  const AddCommentFollowingBody(
    this.gClient, {
    super.key,
    required this.publicPost,
    this.onReplayFollowingPosts,
  });
  final FollowingPosts publicPost;
  final ValueNotifier<GraphQLClient> gClient;
  final void Function()? onReplayFollowingPosts;

  @override
  State<AddCommentFollowingBody> createState() =>
      _AddCommentFollowingBodyState();
}

class _AddCommentFollowingBodyState extends State<AddCommentFollowingBody> {
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
    commentCount = widget.publicPost.post!.totalComments!;
    likesCount = widget.publicPost.post!.totalLikes!;
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
                  FollowingPostItem(
                    widget.gClient,
                    postModel: widget.publicPost,
                    allComments: commentCount,
                    likes: likesCount,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: widget.publicPost.post!.totalComments,
                    itemBuilder: (context, index) {
                      FollowingPosts comments = widget.publicPost;
                      FollowingComments comment =
                          comments.post!.comments![index];
                      return FollowingCommentPostItem(
                        widget.gClient,
                        post: comments,
                        commentModel: comment,
                        commentIndex: index,
                        onReplay: () {},
                        onDeleteTap: () {
                          deleteComment(
                              widget.publicPost.post!.id!, comment.id!);
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          CustomTextField(
            showSuffixIcon: true,
            controller: commentController,
            width: 1,
            hintText: LocaleKeys.Writeacomment.tr(),
            suffixIcon: IconButton(
              onPressed: () async {
                String commentContent = commentController.text.trim();
                if (commentContent.isNotEmpty) {
                  await addComment(
                    widget.publicPost.post!.id!,
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
    setState(() {
      widget.publicPost.post!.comments!
          .removeWhere((comment) => comment.id == commentId);
      widget.publicPost.post!.totalComments =
          widget.publicPost.post!.comments!.length;
    });
    if (response.statusCode == 404) {
      setState(() {
        widget.publicPost.post!.comments!
            .removeWhere((comment) => comment.id == commentId);
        widget.publicPost.post!.totalComments =
            widget.publicPost.post!.comments!.length;
      });
    }
    print('Response body: ${response.body}');

    return response;
  }
}
