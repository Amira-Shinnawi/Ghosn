import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ghosn_app/Admin%20Features/Community/data/model/recommended_post_model/recommended_post_model.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/Api_Key.dart';
import '../../../../../core/utils/functions/network_image_handler.dart';
import '../../../../../core/utils/style.dart';
import '../../../../../core/widgets/custom_network_image.dart';
import '../../../../../core/widgets/show_snack_bar.dart';
import '../../../data/model/following_post_model/following_post_model.dart';
import '../add_comment_following_post.dart';

class FollowingPostItem extends StatefulWidget {
  const FollowingPostItem(
    this.gClient, {
    super.key,
    required this.allComments,
    required this.postModel,
    required this.likes,
    this.userPost,
  });
  final FollowingPosts postModel;

  final ValueNotifier<GraphQLClient> gClient;

  final int allComments, likes;
  final AuthorPublicPost? userPost;

  @override
  State<FollowingPostItem> createState() => _FollowingPostItemState();
}

class _FollowingPostItemState extends State<FollowingPostItem> {
  int likeCount = 0;
  bool isLiked = false;

  @override
  void initState() {
    super.initState();
    likeCount = widget.postModel.post!.totalLikes!;
    isLiked = false;
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double blockHeight = (height / 100);
    double width = MediaQuery.of(context).size.width;
    double blockWidth = (width / 100);

    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: blockWidth * 3, vertical: blockHeight * 1),
      child: IntrinsicHeight(
        child: Container(
          height: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: kHintColor.withOpacity(.2),
              width: 1,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: blockWidth * 3, vertical: blockHeight * .5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: CircleAvatar(
                        radius: 16,
                        child: CustomNetworkImage(
                          imageUrl: NetworkHandler().getImage(
                            widget.postModel.post!.author!.releventImgUrl!,
                          ),
                          aspectRatio: 1,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: blockWidth * 4,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${widget.postModel.post!.author!.firstName} ${widget.postModel.post!.author!.lastName}',
                          style: Styles.textStyle16Inter.copyWith(
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          '${widget.postModel.post!.createdAt}',
                          style: Styles.textStyle16Inter.copyWith(
                            fontSize: 12,
                            color: kHintColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: blockHeight * .5),
                  child: Text(
                    widget.postModel.post!.text!,
                    maxLines: (widget.postModel.post!.imageUrl != null) ? 3 : 5,
                    overflow: TextOverflow.ellipsis,
                    style: Styles.textStyle16Inter.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                if (widget.postModel.post!.imageUrl != null)
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                backgroundColor: Colors.transparent,
                                content: CustomNetworkImage(
                                  imageUrl: NetworkHandler().getImage(
                                    widget.postModel.post!.releventImgUrl!,
                                  ),
                                  aspectRatio: 2 / 2,
                                  fit: BoxFit.fill,
                                ),
                              );
                            },
                          );
                        },
                        child: CustomNetworkImage(
                          imageUrl: NetworkHandler().getImage(
                            widget.postModel.post!.releventImgUrl!,
                          ),
                          aspectRatio: 3 / 2,
                          fit: BoxFit.cover,
                        ),
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
                        widget.postModel.isLikedByMe == true
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: widget.postModel.isLikedByMe == true
                            ? Colors.red
                            : Colors.black,
                        size: 18,
                      ),
                      onPressed: () async {
                        if (widget.postModel.post!.totalLikes != 0) {
                          unLike(widget.postModel.post!.id!);
                          setState(() {});
                        } else {
                          addLike(widget.postModel.post!.id.toString());
                          setState(() {});
                        }
                        setState(() {
                          if (isLiked) {
                            likeCount -= 1;
                            unLike(widget.postModel.post!.id!);
                            isLiked = false;
                          } else {
                            likeCount += 1;
                            addLike(widget.postModel.post!.id.toString());

                            isLiked = true;
                          }
                        });
                      },
                    ),
                    const Spacer(),
                    Text(
                      widget.postModel.post!.totalComments.toString(),
                      style: Styles.textStyle16Inter.copyWith(
                        fontSize: 14,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.mode_comment_outlined,
                        size: 18,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddCommentFollowingPost(
                              widget.gClient,
                              postCommentModel: widget.postModel,
                            ),
                          ),
                        );
                      },
                    ),
                    const Spacer(),
                    Text(
                      '2',
                      style: Styles.textStyle16Inter.copyWith(
                        fontSize: 14,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(
                        FontAwesomeIcons.retweet,
                        size: 18,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> addLike(String postId) async {
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $userToken'
    };
    var dio = Dio();

    try {
      var data = json.encode({"postId": postId, "reactionType": 1});
      var response = await dio.request(
        '${ApiKeys.BASE_URL}/api/post/LikePost',
        options: Options(
          method: 'POST',
          headers: headers,
        ),
        data: data,
      );

      if (response.statusCode == 200 || response.statusCode == 204) {
        showSnackBar(context, 'Success Adding Like.');
        print(json.encode(response.data));
      } else {
        throw Exception('An error occurred while adding the Like.');
      }
    } on DioException catch (error) {
      if (error.response?.statusCode == 400 ||
          error.response?.statusCode == 500) {
        showSnackBar(context,
            '"You have already reacted to this post with the same reaction !".');
        print(error.response?.statusMessage);
      } else {
        rethrow;
      }
    }
  }

  Future<void> unLike(int postId) async {
    var headers = {'Authorization': 'Bearer $userToken'};
    var dio = Dio();
    try {
      var response = await dio.request(
        '${ApiKeys.BASE_URL}/api/post/unlikePost/$postId',
        options: Options(
          method: 'DELETE',
          headers: headers,
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 204) {
        showSnackBar(context, 'Like deleted successfully.');
        print(json.encode(response.data));
      } else {
        throw Exception('An error occurred while deleting the Like.');
      }
    } on DioException catch (error) {
      if (error.response?.statusCode == 404) {
        showSnackBar(context, 'Error unlike.');
        print(error.response?.statusMessage);
      } else {
        rethrow;
      }
    }
  }
}
