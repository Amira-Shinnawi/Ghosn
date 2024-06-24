import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ghosn_app/Admin%20Features/Community/data/model/following_post_model/following_post_model.dart';
import 'package:go_router/go_router.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/functions/graph_ql_config.dart';
import '../../../../../core/utils/style.dart';
import '../../../../../translations/local_keys.g.dart';
import 'following_post_item.dart';

class FollowingPostsListView extends StatefulWidget {
  const FollowingPostsListView({super.key});

  @override
  State<FollowingPostsListView> createState() => _FollowingPostsListViewState();
}

class _FollowingPostsListViewState extends State<FollowingPostsListView> {
  ValueNotifier<GraphQLClient> gClient = GraphQLConfigration();

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: gClient,
      child: Query(
        options: QueryOptions(document: gql(r"""
             query followingPosts($postAudience: PostAudience) {
                followingPosts(where: { post: { postAudience: { eq: $postAudience } } }) {
                IsLikedByMe
                  post {
                    createdAt
                    id
                    imageUrl
                    postAudience
                    ReleventImgUrl
                    text
                    totalComments
                    totalLikes
                    comments {
                      content
                      createdAt
                      id
                      postId
                      totalLikes
                      userId
                      Author {
                        firstName
                        id
                        image
                        lastName
                        ReleventImgUrl
                        totalFolloweesCount
                        totalFollowersCount
                        userName
                      }
                    }
                    Author {
                      firstName
                      id
                      image
                      lastName
                      ReleventImgUrl
                      totalFolloweesCount
                      totalFollowersCount
                      userName
                    }
                  }
                  
                }
              }
         """), variables: {"postAudience": "FOLLOWERS"}),
        builder: (result, {fetchMore, refetch}) {
          if (result.hasException) {
            return Center(child: Text(result.exception.toString()));
          }
          if (result.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          List<FollowingPosts>? post =
              FollowingPost.fromJson(result.data!).followingPosts;
          if (post == null || post.isEmpty) {
            return Center(
              child: GestureDetector(
                onTap: () {
                  GoRouter.of(context).push(AppRouter.kCreatePost);
                },
                child: Text(
                  LocaleKeys.Youdontfollowanyoneyet.tr(),
                  style: Styles.textStyle16Inter.copyWith(
                    color: kGreenColor,
                  ),
                ),
              ),
            );
          }

          return RefreshIndicator(
            onRefresh: () async {
              await refetch?.call();
            },
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: post.length,
              itemBuilder: (context, index) {
                FollowingPosts posts = post[index];
                return FollowingPostItem(
                  gClient,
                  postModel: posts,
                  allComments: int.parse(posts.post!.totalComments.toString()),
                  likes: 0,
                );
              },
            ),
          );
        },
      ),
    );
  }
}
