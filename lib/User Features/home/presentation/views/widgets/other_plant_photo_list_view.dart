import 'package:flutter/material.dart';
import 'package:ghosn_app/User%20Features/home/presentation/views/widgets/show_image.dart';
import 'package:ghosn_app/core/utils/functions/network_image_handler.dart';

import '../../../../../core/widgets/custom_network_image.dart';
import '../../../data/plant_model.dart';

class OtherPlantsPhotoListView extends StatefulWidget {
  const OtherPlantsPhotoListView({
    super.key,
    required this.plantModel,
  });
  final Plants plantModel;

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
    double blockHeight = (height / 100);
    double blockWidth = (width / 100);

    return SizedBox(
      height: blockHeight * 15,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: widget.plantModel.category!.products!.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: ((context, index) {
          Products products = widget.plantModel.category!.products![index];
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: blockWidth * 3),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ShowImage(
                      startingIndex: selectedIndex = index,
                      plantModel: widget.plantModel,
                    ),
                  ),
                );
              },
              child: CustomNetworkImage(
                imageUrl: NetworkHandler()
                    .getImage('/plant_images/${products.imageUrl}')
                    ,
                aspectRatio: 2 / 2.5,
              ),
            ),
          );
        }),
      ),
    );
  }
}
