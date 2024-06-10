import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/Api_Key.dart';
import '../../../../../core/utils/functions/network_image_handler.dart';
import '../../../../../core/utils/style.dart';
import '../../../../../core/widgets/custom_network_image.dart';
import '../../../data/model/following_post_model/following_post_model.dart';

class FollowingCommentPostItem extends StatefulWidget {
  const FollowingCommentPostItem(
    this.gClient, {
    super.key,
    this.onReplay,
    required this.commentIndex,
    required this.commentModel,
    this.onDeleteTap,
    required this.post,
    this.onReplayFollowingPosts,
  });
  final FollowingComments commentModel;
  final FollowingPosts post;
  final ValueNotifier<GraphQLClient> gClient;
  final int commentIndex;
  final void Function()? onReplay;
  final void Function()? onDeleteTap;
  final void Function()? onReplayFollowingPosts;

  @override
  State<FollowingCommentPostItem> createState() =>
      _FollowingCommentPostItemState();
}

class _FollowingCommentPostItemState extends State<FollowingCommentPostItem> {
  int likeCount = 0;

  bool favProductAdd = false;
  bool isLiked = false;
  @override
  void initState() {
    super.initState();
    likeCount = widget.commentModel.totalLikes ?? 0;

    isLiked = false;
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double blockHeight = (height / 100);
    double blockWidth = (width / 100);

    return Padding(
        padding: EdgeInsets.only(
            left: blockWidth * 6, right: blockWidth * 6, top: blockHeight * 1),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: CircleAvatar(
                radius: 16,
                child: CustomNetworkImage(
                  imageUrl: NetworkHandler().getImage(
                    widget.commentModel.author!.releventImgUrl!,
                  ),
                  aspectRatio: 1,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              width: blockWidth * 3,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: blockWidth * 50,
                  decoration: BoxDecoration(
                    color: kHintColor.shade200,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: blockWidth * 3,
                        vertical: blockHeight * 1.5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          ('${widget.commentModel.author!.firstName!} ${widget.commentModel.author!.lastName!}'),
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          widget.commentModel.content.toString(),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: Styles.textStyle16Inter.copyWith(
                            fontWeight: FontWeight.normal,
                            fontSize: 14,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      likeCount < 0 ? '0' : likeCount.toString(),
                      style: Styles.textStyle16Inter.copyWith(
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(
                      width: blockWidth * 2,
                    ),
                    IconButton(
                      icon: Icon(
                        (isLiked || likeCount > 0)
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: (isLiked || likeCount > 0)
                            ? Colors.red
                            : Colors.black,
                        size: 18,
                      ),
                      onPressed: () async {
                        if (widget.commentModel.totalLikes != 0) {
                          unLikeComment(
                              widget.post.post!.id!, widget.commentModel.id!);
                          setState(() {});
                        } else {
                          addLikeComment(
                              widget.post.post!.id!, widget.commentModel.id!);
                          setState(() {});
                        }
                        setState(() {
                          if (isLiked) {
                            likeCount -= 1;
                            unLikeComment(
                                widget.post.post!.id!, widget.commentModel.id!);
                            isLiked = false;
                          } else {
                            likeCount += 1;
                            addLikeComment(
                                widget.post.post!.id!, widget.commentModel.id!);

                            isLiked = true;
                          }
                        });
                      },
                    ),
                    SizedBox(
                      width: blockWidth * 2,
                    ),
                    IconButton(
                      onPressed: widget.onReplay,
                      icon: const Icon(
                        Icons.mode_comment_outlined,
                        size: 18,
                      ),
                    ),
                    SizedBox(
                      width: blockWidth * 2,
                    ),
                    PopupMenuButton(
                      icon: const Icon(
                        FontAwesomeIcons.ellipsis,
                        size: 12,
                      ),
                      color: kGreenColor,
                      itemBuilder: (context) {
                        return [
                          PopupMenuItem(
                            value: 'delete',
                            onTap: widget.onDeleteTap,
                            child: const Text(
                              'Delete',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ];
                      },
                    ),
                  ],
                )
              ],
            )
          ],
        ));
  }

  Future<void> addLikeComment(int postId, int commentId) async {
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $userToken'
    };
    var data = json
        .encode({"postId": postId, "commentId": commentId, "reactionType": 3});
    var dio = Dio();
    try {
      var response = await dio.request(
        '${ApiKeys.BASE_URL}/api/post/LikeComment',
        options: Options(
          method: 'POST',
          headers: headers,
        ),
        data: data,
      );

      if (response.statusCode == 200 || response.statusCode == 204) {
        // showSnackBar(context, 'Like deleted successfully.');
        print(json.encode(response.data));
      } else {
        throw Exception('An error occurred while deleting the Like.');
      }
    } on DioException catch (error) {
      if (error.response?.statusCode == 404 ||
          error.response?.statusCode == 400) {
        // showSnackBar(context, 'Error unlike.');
        print(error.response?.statusMessage);
      } else {
        rethrow;
      }
    }
  }

  Future<void> unLikeComment(int postId, int commentId) async {
    var headers = {'Authorization': 'Bearer $userToken'};
    var dio = Dio();
    try {
      var response = await dio.request(
        '${ApiKeys.BASE_URL}/api/post/UnLikeComment/$commentId?PostId=$postId',
        options: Options(
          method: 'DELETE',
          headers: headers,
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 204) {
        // showSnackBar(context, 'Like deleted successfully.');
        print(json.encode(response.data));
      } else {
        throw Exception('An error occurred while deleting the Like.');
      }
    } on DioException catch (error) {
      if (error.response?.statusCode == 404 ||
          error.response?.statusCode == 400 ||
          error.response?.statusCode == 500) {
        // showSnackBar(context, 'Error unlike.');
        print(error.response?.statusMessage);
      } else {
        rethrow;
      }
    }
  }
}
