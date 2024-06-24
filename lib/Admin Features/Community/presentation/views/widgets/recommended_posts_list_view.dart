import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ghosn_app/Admin%20Features/Community/presentation/views/widgets/public_post_item.dart';
import 'package:ghosn_app/translations/local_keys.g.dart';
import 'package:go_router/go_router.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/functions/graph_ql_config.dart';
import '../../../../../core/utils/style.dart';
import '../../../data/model/recommended_post_model/recommended_post_model.dart';

class PublicPostsListView extends StatefulWidget {
  const PublicPostsListView({super.key});

  @override
  State<PublicPostsListView> createState() => _PublicPostsListViewState();
}

class _PublicPostsListViewState extends State<PublicPostsListView> {
  ValueNotifier<GraphQLClient> gClient = GraphQLConfigration();

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: gClient,
      child: Query(
        options: QueryOptions(document: gql(r"""
         query recommendedPosts($postAudience: PostAudience, $pageNumber: Int!, $pageSize: Int!) {
              recommendedPosts(
                where: { postAudience: { eq: $postAudience } }
                pageSize: $pageSize
                pageNumber: $pageNumber
              ) {
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

         """), variables: const {
          "postAudience": "PUBLIC",
          "pageNumber": 0,
          "pageSize": 50
        }),
        builder: (result, {fetchMore, refetch}) {
          if (result.hasException) {
            return Center(child: Text(result.exception.toString()));
          }
          if (result.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          List<RecommendedPosts>? post =
              PublicPost.fromJson(result.data!).recommendedPosts;
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
                RecommendedPosts posts = post[index];
                return PublicPostItem(
                  gClient,
                  postModel: posts,
                  allComments: int.parse(posts.totalComments.toString()),
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
