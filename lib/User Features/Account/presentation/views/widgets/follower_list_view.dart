import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../../../../../Admin Features/Community/data/model/follower_user_model.dart';
import '../../../../../Admin Features/Community/presentation/views/widgets/follower_user.dart';
import '../../../../../core/utils/functions/graph_ql_config.dart';

class FollowersListView extends StatefulWidget {
  const FollowersListView({super.key});

  @override
  State<FollowersListView> createState() => _FollowersListViewState();
}

class _FollowersListViewState extends State<FollowersListView> {
  ValueNotifier<GraphQLClient> gClient = GraphQLConfigration();

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: gClient,
      child: Query(
        options: QueryOptions(
          document: gql(r"""
               query {
                followers {
                  isFollowingBack
                  follower {
                    firstName
                    id
                    image
                    lastName
                    ReleventImgUrl
                    totalFolloweesCount
                    totalFollowersCount
                    userName
                    posts {
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

          List<Followers>? followings =
              FollowerUser.fromJson(result.data!).followers;

          return RefreshIndicator(
            onRefresh: () async {
              await refetch?.call();
            },
            child: ListView.builder(
                itemCount: followings!.length,
                scrollDirection: Axis.vertical,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  Followers following = followings[index];
                  return FollowerUserProfile(
                    followersModel: following,
                    gClient: gClient,
                  );
                }),
          );
        },
      ),
    );
  }
}
