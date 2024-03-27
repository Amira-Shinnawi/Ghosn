import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/assets_data.dart';
import '../../../../../core/utils/style.dart';
import '../friend_profile_view.dart';

class RecommendedFriendItem extends StatefulWidget {
  const RecommendedFriendItem({super.key});

  @override
  State<RecommendedFriendItem> createState() => _RecommendedFriendItemState();
}

class _RecommendedFriendItemState extends State<RecommendedFriendItem> {
  bool isAccept = true;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const FriendProfileView(),
            ),
          );
        },
        child: const CircleAvatar(
          radius: 20,
          backgroundImage: AssetImage(
            AssetsData.imageTest2,
          ),
        ),
      ),
      title: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const FriendProfileView(),
            ),
          );
        },
        child: const Text(
          'Amira Shinnawi',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      subtitle: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const FriendProfileView(),
            ),
          );
        },
        child: const Text(
          'I\'m Software Engineer',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      trailing: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: isAccept ? Colors.white : kGreenColor,
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
            color: isAccept ? kGreenColor : Colors.white,
          ),
        ),
      ),
    );
  }
}
