import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ghosn_app/Admin%20Features/Community/data/model/suggested_user_model/suggested_user_model.dart';
import 'package:ghosn_app/core/utils/functions/network_image_handler.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/Api_Key.dart';
import '../../../../../core/utils/style.dart';
import '../../../../../core/widgets/custom_network_image.dart';
import '../../../../../translations/local_keys.g.dart';

class RecommendedFriendItem extends StatefulWidget {
  const RecommendedFriendItem({super.key, required this.suggestedUser});
  final SuggestedUserModel suggestedUser;
  @override
  State<RecommendedFriendItem> createState() => _RecommendedFriendItemState();
}

class _RecommendedFriendItemState extends State<RecommendedFriendItem> {
  // bool isAccept = true;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: CircleAvatar(
          radius: 20,
          child: CustomNetworkImage(
            imageUrl: NetworkHandler().getImage(
              '${widget.suggestedUser.imageProfile}',
            ),
            aspectRatio: 1,
            fit: BoxFit.cover,
          ),
        ),
      ),
      title: Text(
        '${widget.suggestedUser.fullName}',
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.bold,
            ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(
        '@${widget.suggestedUser.userName}',
        maxLines: 1,
        style: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: kGreyColor,
            ),
        overflow: TextOverflow.ellipsis,
      ),
      trailing: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: widget.suggestedUser.isFollowing == false
              ? Colors.white
              : kGreenColor,
          shadowColor: Colors.greenAccent,
          minimumSize: const Size(100, 30),
        ),
        onPressed: () {
          setState(() {
            if (widget.suggestedUser.isFollowing == false) {
              widget.suggestedUser.isFollowing =
                  !widget.suggestedUser.isFollowing!;
              followUser(widget.suggestedUser.id!);
            } else {
              widget.suggestedUser.isFollowing =
                  !widget.suggestedUser.isFollowing!;
              unFollowUser(widget.suggestedUser.id!);
            }
          });
        },
        child: Text(
          widget.suggestedUser.isFollowing == false ? LocaleKeys.Follow.tr() : LocaleKeys.following.tr(),
          style: Styles.textStyle16Inter.copyWith(
            fontSize: 12,
            color: widget.suggestedUser.isFollowing == false
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
