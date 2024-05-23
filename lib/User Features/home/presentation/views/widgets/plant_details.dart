import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../../core/utils/style.dart';
import '../../../../../translations/local_keys.g.dart';
import 'other_plant_photo_list_view.dart';
import 'plant_details_info.dart';

class PlantDetails extends StatefulWidget {
  const PlantDetails({
    super.key,
  });
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
      padding: EdgeInsets.symmetric(
          horizontal: blockWidth * 6, vertical: blockHeight * 4),
      child: CustomScrollView(slivers: [
        const SliverToBoxAdapter(
          child: PlantDetailsInfo(),
        ),
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: blockHeight * 1.5,
              ),
              Text(
                LocaleKeys.OtherPhotos.tr(),
                style: Styles.textStyle18Inter.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        const SliverToBoxAdapter(
          child: OtherPlantsPhotoListView(),
        ),
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: blockHeight * 1.5,
              ),
              Text(
                'Other Bowls',
                style: Styles.textStyle18Inter.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        const SliverToBoxAdapter(
          child: OtherPlantsPhotoListView(),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: blockHeight * 5,
          ),
        ),
      ]),
    );
  }
}
