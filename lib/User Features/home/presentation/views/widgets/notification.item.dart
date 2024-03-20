import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/assets_data.dart';
import '../../../../../core/utils/style.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double blockHeight = (height / 100);
    double blockWidth = (width / 100);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: blockHeight * .5),
      child: Column(
        children: [
          SizedBox(
            height: blockHeight * 11,
            width: blockWidth * 100,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.transparent,
                  child: AspectRatio(
                    aspectRatio: 2 / 3,
                    child: Image.asset(
                      AssetsData.imageTest2,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    'You may like the red rose plant.You may like the red rose plant.',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Styles.textStyle16Inter.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: blockHeight * 1,
          ),
          const Divider(
            color: kGreenColor,
            thickness: 1,
            indent: 100,
            endIndent: 100,
          ),
        ],
      ),
    );
  }
}
