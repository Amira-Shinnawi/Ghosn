import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'other_plant_photo_list_view.dart';
import 'plant_details_info.dart';

class PlantDetails extends StatefulWidget {
  const PlantDetails({
    super.key,
    this.colorBowlListView,
  });
  final Widget? colorBowlListView;
  @override
  State<PlantDetails> createState() => _PlantDetailsState();
}

class _PlantDetailsState extends State<PlantDetails> {
  @override
  Widget build(BuildContext context) {
     double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double blockHeight = (height / 100);
    double blockWidth = (width / 100);

    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: blockWidth * 6, vertical: blockHeight * 4),
      child: CustomScrollView(slivers: [
        SliverToBoxAdapter(
          child: PlantDetailsInfo(colorBowlListView: widget.colorBowlListView),
        ),
        const SliverToBoxAdapter(
          child: OtherPlantsPhotoListView(),
        ),
      ]),
    );
  }
}
