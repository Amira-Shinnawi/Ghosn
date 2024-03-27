import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/assets_data.dart';
import '../../../../../core/utils/style.dart';
import '../add_comment_view.dart';

class PostItem extends StatefulWidget {
  const PostItem({super.key,this.allComments});
  final int? allComments;
  @override
  State<PostItem> createState() => _PostItemState();
}

class _PostItemState extends State<PostItem> {
  bool favProductAdd = false;
  int likeCount = 2;

  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var formatter = DateFormat.yMMMMd('en_US');
    String formattedDate = formatter.format(now);

    double height = MediaQuery.of(context).size.height;
    double blockHeight = (height / 100);
    double width = MediaQuery.of(context).size.width;
    double blockWidth = (width / 100);

    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: blockWidth * 3, vertical: blockHeight * 1),
      child: Container(
        height: blockHeight * 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: kHintColor.withOpacity(.2),
            width: 2,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: blockWidth * 3, vertical: blockHeight * .5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage(
                      AssetsData.imageTest2,
                    ),
                  ),
                  SizedBox(
                    width: blockWidth * 4,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'User Name',
                        style: Styles.textStyle16Inter.copyWith(
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        formattedDate,
                        style: Styles.textStyle16Inter.copyWith(
                          fontSize: 14,
                          color: kHintColor,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      FontAwesomeIcons.ellipsis,
                      size: 20,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: blockHeight * .5),
                child: const Text(
                  'Content Post',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Styles.textStyle16Inter,
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: AspectRatio(
                    aspectRatio: 2 / 3,
                    child: Image.asset(
                      AssetsData.imageTest2,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Text(
                    likeCount.toString(),
                    style: Styles.textStyle16Inter,
                  ),
                  IconButton(
                    icon: Icon(
                      favProductAdd ? Icons.favorite : Icons.favorite_border,
                      color: favProductAdd ? Colors.red : Colors.black,
                      size: 25,
                    ),
                    onPressed: () {
                      setState(() {
                        favProductAdd = !favProductAdd;
                        if (favProductAdd) {
                          likeCount++;
                        } else {
                          likeCount--;
                        }
                      });
                    },
                  ),
                  const Spacer(),
                   Text(
                    widget.allComments.toString(),
                    style: Styles.textStyle16Inter,
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.mode_comment_outlined,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AddComment(),
                        ),
                      );
                    },
                  ),
                  const Spacer(),
                  const Text(
                    '25',
                    style: Styles.textStyle16Inter,
                  ),
                  IconButton(
                    icon: const Icon(
                      FontAwesomeIcons.retweet,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
