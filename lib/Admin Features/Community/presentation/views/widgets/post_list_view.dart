import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ghosn_app/Admin%20Features/Community/presentation/views/edit_post.dart';
import 'package:ghosn_app/constants.dart';
import 'package:ghosn_app/core/utils/Api_Key.dart';
import 'package:go_router/go_router.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:http/http.dart' as http;

import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/functions/graph_ql_config.dart';
import '../../../../../core/utils/style.dart';
import '../../../../../translations/local_keys.g.dart';
import '../../../data/model/post_model/post_model.dart';
import 'post_item.dart';

class PostsListView extends StatefulWidget {
  const PostsListView({
    super.key,
  });

  @override
  State<PostsListView> createState() => _PostsListViewState();
}

class _PostsListViewState extends State<PostsListView> {
  ValueNotifier<GraphQLClient> gClient = GraphQLConfigration();

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: gClient,
      child: Query(
        options: QueryOptions(
          document: gql(r"""
               query {
                  myPosts {
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
                          }
                        }
                }

         """),
        ),
        builder: (result, {fetchMore, refetch}) {
          if (result.hasException) {
            return Center(child: Text(result.exception.toString()));
          }
          if (result.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          List<MyPosts>? post = UserPostModel.fromJson(result.data!).myPosts;
          if (post == null || post.isEmpty) {
            return Center(
              child: GestureDetector(
                onTap: () {
                  GoRouter.of(context).push(AppRouter.kCreatePost);
                },
                child: Text(
                  LocaleKeys.Createyourfirstpost.tr(),
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
                final reversedIndex = post.length - 1 - index;
                MyPosts posts = post[reversedIndex];
                return PostItem(
                  gClient,
                  postModel: posts,
                  allComments: int.parse(posts.post!.totalComments.toString()),
                  likes: 0,
                  onTapDelete: () {
                    deletePost(posts.post!.id.toString()).then((response) {
                      refetch!();
                    });
                  },
                  onTapEdit: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditPostView(
                          editPost: posts,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }

  Future<http.Response> deletePost(String postId) async {
    var response = await http.delete(
      Uri.parse("${ApiKeys.BASE_URL}/api/post/Delete/$postId"),
      headers: {
        'Authorization': 'Bearer $userToken',
      },
    );
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    return response;
  }
}
