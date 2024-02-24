import 'package:flutter/material.dart';
import 'package:ghosn_app/Features/home/presentation/views/widgets/add_cart.dart';
import 'package:ghosn_app/Features/home/presentation/views/widgets/color_item.dart';
import 'package:ghosn_app/core/utils/assets_data.dart';

import 'plant_details.dart';
import 'product_properties.dart';

class ProductDetailsBody extends StatefulWidget {
  const ProductDetailsBody({super.key});

  @override
  State<ProductDetailsBody> createState() => _ProductDetailsBodyState();
}

class _ProductDetailsBodyState extends State<ProductDetailsBody> {
  int currentIndex = 0;

  List<Color> colorBowl = [
    const Color(0xffF0F0F0),
    const Color(0xffF1AC5A),
    Colors.red,
  ];
  List<String> imageAssets = [
    AssetsData.imageTest1,
    AssetsData.imageTest2,
    AssetsData.imageTest3,
  ];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double blockHeight = (height / 100);
    double blockWidth = (width / 100);
    return Stack(
      children: [
        Positioned(
          top: 0,
          right: 0,
          left: 0,
          child: ProductProperties(
            height: blockHeight,
            width: blockWidth,
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            height: blockHeight * 55,
            decoration: const ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(37),
                  topRight: Radius.circular(37),
                ),
              ),
            ),
            child: PlantDetails(
              colorBowlListView: SizedBox(
                height: blockHeight * 5,
                width: blockWidth * 25,
                child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: colorBowl.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: blockWidth * 1),
                        child: GestureDetector(
                          onTap: () {
                            currentIndex = index;
                            setState(() {});
                          },
                          child: ColorItem(
                            color: colorBowl[index],
                            isActive: currentIndex == index,
                          ),
                        ),
                      );
                    }),
              ),
            ),
          ),
        ),
        const Positioned(
          bottom: 0,
          right: 0,
          left: 0,
          child: AddCart(),
        ),
        Positioned(
          right: 0,
          left: 0,
          top: -10,
          child: Align(
            alignment: AlignmentDirectional.bottomEnd,
            child: Image.asset(
              imageAssets[currentIndex],
              width: blockWidth * 60,
              height: blockHeight * 40,
            ),
          ),
        ),
      ],
    );
  }
}
