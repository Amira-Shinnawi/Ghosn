import 'package:flutter/material.dart';

import '../../../../../User Features/Account/presentation/views/widgets/user_profile.dart';
import '../../../../../constants.dart';
import '../../../../../core/utils/style.dart';

class FriendProfileItem extends StatefulWidget {
  const FriendProfileItem({
    super.key,
  });

  @override
  State<FriendProfileItem> createState() => _FriendProfileItemState();
}

class _FriendProfileItemState extends State<FriendProfileItem> {
  bool isAccept = true;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double blockHeight = (height / 100);
    double width = MediaQuery.of(context).size.width;
    double blockWidth = (width / 100);
    return Container(
      height: blockHeight * 32,
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
            const UserProfile(),
            SizedBox(
              height: blockHeight * 1,
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
                    backgroundColor: Colors.white,
                    shadowColor: Colors.greenAccent,
                    minimumSize: const Size(100, 30),
                  ),
                  onPressed: () {
                    setState(() {
                      isAccept = !isAccept;
                    });
                  },
                  child: Text(
                    isAccept ? 'Follow' : 'Following',
                    style: Styles.textStyle16Inter.copyWith(
                      fontSize: 12,
                      color: kGreenColor,
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
}
