import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/assets_data.dart';
import '../../../../../core/utils/style.dart';

class CommentPostItem extends StatefulWidget {
  const CommentPostItem({
    super.key,
    required this.commentContent,
    this.onReplay,
  });
  final String commentContent;
  final void Function()? onReplay;

  @override
  State<CommentPostItem> createState() => _CommentPostItemState();
}

class _CommentPostItemState extends State<CommentPostItem> {
  bool favProductAdd = false;
  int likeCount = 2;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double blockHeight = (height / 100);
    double blockWidth = (width / 100);
    return Padding(
        padding: EdgeInsets.only(
            left: blockWidth * 6, right: blockWidth * 6, top: blockHeight * 1),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              maxRadius: 16,
              child: Image.asset(
                AssetsData.imageTest2,
              ),
            ),
            SizedBox(
              width: blockWidth * 6,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: blockWidth * 50,
                  decoration: BoxDecoration(
                    color: kHintColor.shade300,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: blockWidth * 3, vertical: blockHeight * 2),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Amira Shinnawi',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          widget.commentContent,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: Styles.textStyle16Inter.copyWith(
                            fontWeight: FontWeight.normal,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Row(
                  children: [
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
                    SizedBox(
                      width: blockWidth * 2,
                    ),
                    GestureDetector(
                      onTap: widget.onReplay,
                      child: const Text(
                        'Reply',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ));
  }
}
