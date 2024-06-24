import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ghosn_app/Admin%20Features/Community/presentation/views/widgets/friend_profile.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/Api_Key.dart';
import '../../../../../core/utils/style.dart';
import '../../../../../translations/local_keys.g.dart';
import '../../../data/model/following_user_model/following_user_model.dart';

class FriendProfileItem extends StatefulWidget {
  const FriendProfileItem({
    super.key,
    required this.followingsModel,
  });
  final Followings followingsModel;

  @override
  State<FriendProfileItem> createState() => _FriendProfileItemState();
}

class _FriendProfileItemState extends State<FriendProfileItem> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double blockHeight = (height / 100);
    double width = MediaQuery.of(context).size.width;
    double blockWidth = (width / 100);
    return Container(
      height: blockHeight * 30,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            kGreenColor,
            Color.fromARGB(255, 3, 87, 62),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        color: kGreenColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            FriendUserProfile(
              followingsModel: widget.followingsModel,
            ),
            SizedBox(
              height: blockHeight * .5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.white,
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.message_sharp,
                        color: kGreenColor,
                        size: 20,
                      )),
                ),
                SizedBox(
                  width: blockWidth * 5,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        widget.followingsModel.isFollowingBack == true
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
                        ? ' ${LocaleKeys.followers.tr()}'
                        : ' ${LocaleKeys.following.tr()}',
                    style: Styles.textStyle16Inter.copyWith(
                      fontSize: 12,
                      color: widget.followingsModel.isFollowingBack == true
                          ? kGreenColor
                          : Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  width: blockWidth * 5,
                ),
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.white,
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.share,
                        color: kGreenColor,
                        size: 20,
                      )),
                ),
              ],
            ),
          ],
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
