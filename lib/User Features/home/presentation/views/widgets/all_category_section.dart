import 'package:flutter/material.dart';
import 'package:ghosn_app/User%20Features/home/data/plant_model.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/style.dart';

class AllCategorySection extends StatefulWidget {
  const AllCategorySection({
    super.key,
    required this.categories,
    required this.onCategorySelected,
  });
  final List<Categories> categories;
  final Function(String categoryName) onCategorySelected;

  @override
  State<AllCategorySection> createState() => _AllCategorySectionState();
}

class _AllCategorySectionState extends State<AllCategorySection> {
  int _selectedTextIndex = 0;

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
          scrollDirection: Axis.horizontal,
          itemCount: widget.categories.length,
          itemBuilder: (context, index) {
            Categories categories = widget.categories[index];

            return GestureDetector(
              onTap: () {
                setState(() {
                  _selectedTextIndex = index;
                  widget.onCategorySelected(categories.name.toString());
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
                            Text(
                              categories.name!,
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
