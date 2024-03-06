import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ghosn_app/translations/local_keys.g.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/assets_data.dart';
import '../../../../../core/utils/style.dart';
import '../../../../../core/widgets/custom_elvated_button.dart';

class FollowingItem extends StatelessWidget {
  const FollowingItem({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double blockHeight = (height / 100);
    double width = MediaQuery.of(context).size.width;
    double blockWidth = (width / 100);
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: blockWidth * 2, vertical: blockHeight * 1),
      child: Container(
        height: blockHeight * 20,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: kHintColor.withOpacity(.2),
            width: 2,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: blockWidth * 3, vertical: blockHeight * 1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Align(
                alignment: Alignment.topLeft,
                child: Icon(
                  FontAwesomeIcons.ellipsisVertical,
                  size: 20,
                ),
              ),
              CircleAvatar(
                radius: 30,
                backgroundColor: kGreenColor,
                child: Image.asset(
                  AssetsData.imageTest2,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: blockHeight * .5,
              ),
              const Text(
                'User Name',
                style: Styles.textStyle16Inter,
              ),
              SizedBox(
                height: blockHeight * .5,
              ),
              Expanded(
                child: CustomElevatedButton(
                  onPressed: () {},
                  buttonName: LocaleKeys.showProfile.tr(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
