import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ghosn_app/Admin%20Features/Community/data/model/follower_user_model.dart';
import 'package:ghosn_app/translations/local_keys.g.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/Api_Key.dart';
import '../../../../../core/utils/style.dart';
import 'follower_profile.dart';

class FollowerProfileItem extends StatefulWidget {
  const FollowerProfileItem({
    super.key,
    required this.followersModel,
  });
  final Followers followersModel;

  @override
  State<FollowerProfileItem> createState() => _FollowerProfileItemState();
}

class _FollowerProfileItemState extends State<FollowerProfileItem> {
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
            FollowerUserProfileView(
              followingsModel: widget.followersModel,
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
                        widget.followersModel.isFollowingBack == true
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
