import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ghosn_app/User%20Features/Account/presentation/views/widgets/info_profile_item.dart';
import 'package:ghosn_app/core/utils/assets_data.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/style.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double blockHeight = (height / 100);
    double width = MediaQuery.of(context).size.width;
    double blockWidth = (width / 100);
    return Container(
      height: blockHeight * 22,
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
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: blockHeight * 1, horizontal: blockWidth * 2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: Image.asset(
                    AssetsData.imageTest2,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: blockHeight * 1,
                ),
                Text(
                  'User Name',
                  style: Styles.textStyle22Inter.copyWith(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: blockWidth * 8,
            ),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InfoProfileItem(
                    icon: Icons.calendar_today_rounded,
                    infoItem: 'Birthday',
                    width: blockWidth,
                  ),
                  SizedBox(
                    height: blockHeight * 1.5,
                  ),
                  InfoProfileItem(
                    icon: FontAwesomeIcons.locationDot,
                    infoItem: 'Current Location',
                    width: blockWidth,
                  ),
                  SizedBox(
                    height: blockHeight * 1.5,
                  ),
                  InfoProfileItem(
                    icon: Icons.work_outline_rounded,
                    infoItem: 'Work',
                    width: blockWidth,
                  ),
                  SizedBox(
                    height: blockHeight * 1.5,
                  ),
                  InfoProfileItem(
                    icon: FontAwesomeIcons.globe,
                    infoItem: 'Birthday',
                    width: blockWidth,
                  ),
                  SizedBox(
                    height: blockHeight * 1.5,
                  ),
                  Row(
                    children: [
                      Text(
                        '47 Followers',
                        style: Styles.textStyle22Inter.copyWith(
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(
                        width: blockWidth * 4,
                      ),
                      Text(
                        '32 Following',
                        style: Styles.textStyle22Inter.copyWith(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
