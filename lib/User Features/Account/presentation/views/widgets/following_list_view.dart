import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../../../../../Admin Features/Community/data/model/following_user_model/following_user_model.dart';
import '../../../../../Admin Features/Community/presentation/views/widgets/following_user.dart';
import '../../../../../core/utils/functions/graph_ql_config.dart';

class FollowingListView extends StatefulWidget {
  const FollowingListView({super.key});

  @override
  State<FollowingListView> createState() => _FollowingListViewState();
}

class _FollowingListViewState extends State<FollowingListView> {
  ValueNotifier<GraphQLClient> gClient = GraphQLConfigration();

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: gClient,
      child: Query(
        options: QueryOptions(
          document: gql(r"""
             query {
  followings {
    isFollowingBack
    followee {
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

          List<Followings>? followings =
              FriendFollowingUser.fromJson(result.data!).followings;

          return RefreshIndicator(
            onRefresh: () async {
              await refetch?.call();
            },
            child: ListView.builder(
                itemCount: followings!.length,
                scrollDirection: Axis.vertical,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  Followings following = followings[index];
                  return FollowingUserProfile(
                    followingsModel: following,
                    gClient: gClient,
                  );
                }),
          );
        },
      ),
    );
  }
}
