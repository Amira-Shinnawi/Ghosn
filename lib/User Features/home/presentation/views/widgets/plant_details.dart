import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../../core/utils/style.dart';
import '../../../../../core/widgets/custom_rating.dart';
import '../../../data/plant_model.dart';
import 'other_plant_photo_list_view.dart';
import 'plant_details_info.dart';

class PlantDetails extends StatefulWidget {
  const PlantDetails({
    super.key,
    required this.plantModel,
  });
  final Plants plantModel;

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
        SliverToBoxAdapter(
          child: PlantDetailsInfo(
            plantModel: widget.plantModel,
          ),
        ),
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: blockHeight * 1.5,
              ),
              Text(
                'Other Product Image',
                style: Styles.textStyle18Inter.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: blockHeight * 1.5,
              ),
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: OtherPlantsPhotoListView(
            plantModel: widget.plantModel,
          ),
        ),
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: blockHeight * 1.5,
              ),
              Text(
                'Reviews',
                style: Styles.textStyle18Inter.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        SliverToBoxAdapter(
            child: SizedBox(
          height: blockHeight * 5,
          child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: widget.plantModel.userReviews!.length,
              itemBuilder: (context, index) {
                UserReviews userReviews = widget.plantModel.userReviews!.first;
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${userReviews.comment}',
                    ),
                    CustomRatingBar(
                      rating: userReviews.rating!.toDouble(),
                    ),
                  ],
                );
              }),
        )),
        SliverToBoxAdapter(
          child: SizedBox(
            height: blockHeight * 5,
          ),
        ),
      ]),
    );
  }
}
