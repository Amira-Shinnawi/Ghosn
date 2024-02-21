import 'package:flutter/material.dart';
import 'package:ghosn_app/Features/home/presentation/views/widgets/show_image.dart';

import '../../../../../core/utils/assets_data.dart';

class OtherPlantsPhotoListView extends StatefulWidget {
  const OtherPlantsPhotoListView({
    super.key,
  });

  @override
  State<OtherPlantsPhotoListView> createState() =>
      _OtherPlantsPhotoListViewState();
}

class _OtherPlantsPhotoListViewState extends State<OtherPlantsPhotoListView> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    List<String> imageAssets = [
      AssetsData.imageTest1,
      AssetsData.imageTest2,
      AssetsData.imageTest3,
    ];

    return SizedBox(
      height: height * .15,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: imageAssets.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: ((context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: width * .02),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ShowImage(
                      startingIndex: selectedIndex = index,
                      image: imageAssets,
                    ),
                  ),
                );
              },
              child: AspectRatio(
                aspectRatio: 2 / 3,
                child: Image.asset(
                  imageAssets[index],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
