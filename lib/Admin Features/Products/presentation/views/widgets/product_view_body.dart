import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/style.dart';
import 'product_grid_view.dart';

class ProductAdminBody extends StatefulWidget {
  const ProductAdminBody({super.key});

  @override
  State<ProductAdminBody> createState() => _ProductAdminBodyState();
}

class _ProductAdminBodyState extends State<ProductAdminBody> {
  int _selectedTextIndex = 0;
  late final PageController _pageController = PageController(
    initialPage: _selectedTextIndex,
  );

  List<String> sectionCommunity = [
    'For Homes',
    'For Gardens',
    'Flowering',
    'Pots',
  ];
  Widget _buildSelectedListView() {
    switch (_selectedTextIndex) {
      case 0:
        return const ProductGridView();
      case 1:
        return const ProductGridView();
      case 2:
        return const ProductGridView();
      default:
        return const ProductGridView();
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double blockHeight = (height / 100);
    double width = MediaQuery.of(context).size.width;
    double blockWidth = (width / 100);
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: blockWidth * 3, vertical: blockHeight * 2),
      child: CustomScrollView(slivers: [
        SliverFillRemaining(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: blockHeight * 2),
                child: SizedBox(
                  height: blockHeight * 4,
                  width: double.infinity,
                  child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: sectionCommunity.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedTextIndex = index;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: _selectedTextIndex == index
                                  ? kGreenColor
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: IntrinsicWidth(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: blockWidth * 4,
                                ),
                                child: Center(
                                  child: Text(
                                    sectionCommunity[index],
                                    style: Styles.textStyle16Inter.copyWith(
                                      color: _selectedTextIndex == index
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              ),
              Expanded(
                child: PageView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: sectionCommunity.length,
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _selectedTextIndex = index;
                    });
                  },
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return _buildSelectedListView();
                  },
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
