import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/style.dart';

class AllCategorySection extends StatefulWidget {
  const AllCategorySection({
    super.key,
  });

  @override
  State<AllCategorySection> createState() => _AllCategorySectionState();
}

class _AllCategorySectionState extends State<AllCategorySection> {
  int _selectedTextIndex = 0;

  List<String> sectionCategory = ['All', 'Outdoor', 'Indoor', 'Garden'];
  List<Color> categoryColor = [
    kGreenColor,
    Colors.lightGreenAccent,
    Colors.orangeAccent,
    Colors.pinkAccent,
  ];
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double blockHeight = (height / 100);
    double width = MediaQuery.of(context).size.width;
    double blockWidth = (width / 100);
    return SizedBox(
      height: blockHeight * 4,
      width: double.infinity,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: sectionCategory.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  _selectedTextIndex = index;
                });
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: blockWidth * 2),
                child: Container(
                  decoration: BoxDecoration(
                    color: _selectedTextIndex == index
                        ? kGreenColor
                        : kHintColor.withOpacity(.1),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: IntrinsicWidth(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: blockWidth * 4,
                      ),
                      child: Center(
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 5,
                              backgroundColor: categoryColor[index],
                            ),
                            SizedBox(
                              width: blockWidth * 2,
                            ),
                            Text(
                              sectionCategory[index],
                              style: Styles.textStyle16.copyWith(
                                color: _selectedTextIndex == index
                                    ? Colors.white
                                    : kHintColor,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
