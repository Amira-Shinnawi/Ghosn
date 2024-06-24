import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ghosn_app/translations/local_keys.g.dart';

import '../../../../../User Features/Account/presentation/views/widgets/info_profile_item.dart';
import '../../../../../core/utils/functions/network_image_handler.dart';
import '../../../../../core/utils/style.dart';
import '../../../../../core/widgets/custom_network_image.dart';
import '../../../data/model/following_user_model/following_user_model.dart';

class FriendUserProfile extends StatelessWidget {
  const FriendUserProfile({super.key, required this.followingsModel});
  final Followings followingsModel;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double blockHeight = (height / 100);
    double width = MediaQuery.of(context).size.width;
    double blockWidth = (width / 100);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: blockWidth * 5,
        vertical: blockHeight * 2,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        backgroundColor: Colors.transparent,
                        content: CustomNetworkImage(
                          imageUrl: NetworkHandler().getImage(
                              followingsModel.followee!.releventImgUrl!),
                          aspectRatio: 2 / 2,
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  );
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(34),
                  child: CircleAvatar(
                    radius: 35,
                    child: CustomNetworkImage(
                      imageUrl: NetworkHandler().getImage(
                          '${followingsModel.followee!.releventImgUrl}'),
                      aspectRatio: 1,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: blockHeight * 1,
              ),
              Text(
                '@${followingsModel.followee!.userName}',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          SizedBox(
            width: blockWidth * 10,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InfoProfileItem(
                    icon: Icons.person,
                    infoItem:
                        '${followingsModel.followee!.firstName.toString()} ${followingsModel.followee!.lastName.toString()}',
                    width: blockWidth,
                  ),
                  SizedBox(
                    height: blockHeight * 1.5,
                  ),
                  InfoProfileItem(
                    icon: FontAwesomeIcons.locationDot,
                    infoItem: 'Egypt',
                    width: blockWidth,
                  ),
                  SizedBox(
                    height: blockHeight * 1.5,
                  ),
                  InfoProfileItem(
                    icon: Icons.link,
                    infoItem:
                        '${followingsModel.followee!.userName.toString()}@gmail.com',
                    width: blockWidth,
                  ),
                  SizedBox(
                    height: blockHeight * 1.5,
                  ),
                  InfoProfileItem(
                    icon: Icons.cake,
                    infoItem: '4/1/2001',
                    width: blockWidth,
                  ),
                  SizedBox(
                    height: blockHeight * 1.5,
                  ),
                  Row(
                    children: [
                      Text(
                        '${followingsModel.followee!.totalFollowersCount.toString()} ${LocaleKeys.followers.tr()}',
                        style: Styles.textStyle22Inter.copyWith(
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(
                        width: blockWidth * 4,
                      ),
                      Text(
                        '${followingsModel.followee!.totalFolloweesCount.toString()}  ${LocaleKeys.following.tr()}',
                        style: Styles.textStyle22Inter.copyWith(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
