import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/Api_Key.dart';
import '../../../../../core/utils/functions/network_image_handler.dart';
import '../../../../../core/utils/style.dart';
import '../../../../../core/widgets/custom_network_image.dart';
import '../../../../../translations/local_keys.g.dart';
import '../../../data/model/follower_user_model.dart';
import '../follower_profile_view.dart';

class FollowerUserProfile extends StatefulWidget {
  const FollowerUserProfile({
    super.key,
    required this.followersModel,
    required this.gClient,
  });
  final Followers followersModel;
  final ValueNotifier<GraphQLClient> gClient;

  @override
  State<FollowerUserProfile> createState() => _FollowerUserProfileState();
}

class _FollowerUserProfileState extends State<FollowerUserProfile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => FollowerProfileView(
                        followersModel: widget.followersModel,
                      )));
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: CircleAvatar(
            radius: 20,
            child: CustomNetworkImage(
              imageUrl: NetworkHandler().getImage(
                '${widget.followersModel.follower!.releventImgUrl}',
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
                  builder: (context) => FollowerProfileView(
                        followersModel: widget.followersModel,
                      )));
        },
        child: Text(
          '${widget.followersModel.follower!.firstName} ${widget.followersModel.follower!.lastName}',
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
                  builder: (context) => FollowerProfileView(
                        followersModel: widget.followersModel,
                      )));
        },
        child: Text(
          '${widget.followersModel.follower!.userName}',
          maxLines: 1,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: kGreyColor,
              ),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      trailing: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: widget.followersModel.isFollowingBack == true
              ? Colors.white
              : kGreenColor,
          shadowColor: Colors.greenAccent,
          minimumSize: const Size(100, 30),
        ),
        onPressed: () {
          setState(() {
            if (widget.followersModel.isFollowingBack == true) {
              widget.followersModel.isFollowingBack =
                  !widget.followersModel.isFollowingBack!;
              followUser(widget.followersModel.follower!.id!);
            } else {
              widget.followersModel.isFollowingBack =
                  !widget.followersModel.isFollowingBack!;
              unFollowUser(widget.followersModel.follower!.id!);
            }
          });
        },
        child: Text(
          widget.followersModel.isFollowingBack == true
              ? LocaleKeys.Follow.tr()
              : LocaleKeys.Following.tr(),
          style: Styles.textStyle16Inter.copyWith(
            fontSize: 12,
            color: widget.followersModel.isFollowingBack == true
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
