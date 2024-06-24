import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ghosn_app/Admin%20Features/Community/data/model/following_user_model/following_user_model.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/Api_Key.dart';
import '../../../../../core/utils/functions/network_image_handler.dart';
import '../../../../../core/utils/style.dart';
import '../../../../../core/widgets/custom_network_image.dart';
import '../../../../../translations/local_keys.g.dart';
import '../friend_profile_view.dart';

class FollowingUserProfile extends StatefulWidget {
  const FollowingUserProfile({
    super.key,
    required this.followingsModel,
    required this.gClient,
  });
  final Followings followingsModel;
  final ValueNotifier<GraphQLClient> gClient;

  @override
  State<FollowingUserProfile> createState() => _FollowingUserProfileState();
}

class _FollowingUserProfileState extends State<FollowingUserProfile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => FriendProfileView(
                        followingsModel: widget.followingsModel,
                      )));
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: CircleAvatar(
            radius: 20,
            child: CustomNetworkImage(
              imageUrl: NetworkHandler().getImage(
                '${widget.followingsModel.followee!.releventImgUrl}',
              ),
              aspectRatio: 1,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      title: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => FriendProfileView(
                        followingsModel: widget.followingsModel,
                      )));
        },
        child: Text(
          '${widget.followingsModel.followee!.firstName} ${widget.followingsModel.followee!.lastName}',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.bold,
              ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      subtitle: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => FriendProfileView(
                        followingsModel: widget.followingsModel,
                      )));
        },
        child: Text(
          '${widget.followingsModel.followee!.userName}',
          maxLines: 1,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: kGreyColor,
              ),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      trailing: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: widget.followingsModel.isFollowingBack == true
              ? Colors.white
              : kGreenColor,
          shadowColor: Colors.greenAccent,
          minimumSize: const Size(100, 30),
        ),
        onPressed: () {
          setState(() {
            if (widget.followingsModel.isFollowingBack == true) {
              widget.followingsModel.isFollowingBack =
                  !widget.followingsModel.isFollowingBack!;
              followUser(widget.followingsModel.followee!.id!);
            } else {
              widget.followingsModel.isFollowingBack =
                  !widget.followingsModel.isFollowingBack!;
              unFollowUser(widget.followingsModel.followee!.id!);
            }
          });
        },
        child: Text(
          widget.followingsModel.isFollowingBack == true
              ? LocaleKeys.Follow.tr()
              :LocaleKeys.Following.tr(),
          style: Styles.textStyle16Inter.copyWith(
            fontSize: 12,
            color: widget.followingsModel.isFollowingBack == true
                ? kGreenColor
                : Colors.white,
          ),
        ),
      ),
    );
  }

  Future<void> followUser(int userId) async {
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $userToken'
    };
    var dio = Dio();

    try {
      var response = await dio.request(
        '${ApiKeys.BASE_URL}/api/Follow/followUser?FolloweeId=$userId',
        options: Options(
          method: 'POST',
          headers: headers,
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 204) {
        // showSnackBar(context, 'Success Follow User.');
        print(json.encode(response.data));
      } else {
        throw Exception('An error occurred while adding the Like.');
      }
    } on DioException catch (error) {
      if (error.response?.statusCode == 400 ||
          error.response?.statusCode == 500) {
        // showSnackBar(context, 'You Already Follow this user !');
        print(error.response?.statusMessage);
      } else {
        rethrow;
      }
    }
  }

  Future<void> unFollowUser(int userId) async {
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $userToken'
    };
    var dio = Dio();

    try {
      var response = await dio.request(
        '${ApiKeys.BASE_URL}/api/Follow/unfollow/$userId',
        options: Options(
          method: 'DELETE',
          headers: headers,
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 204) {
        // showSnackBar(context, 'Success UnFollow User.');
        print(json.encode(response.data));
      } else {
        throw Exception('An error occurred while adding the Like.');
      }
    } on DioException catch (error) {
      if (error.response?.statusCode == 400 ||
          error.response?.statusCode == 500) {
        // showSnackBar(context, 'User is Not Found !');
        print(error.response?.statusMessage);
      } else {
        rethrow;
      }
    }
  }
}
