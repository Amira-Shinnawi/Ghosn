import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ghosn_app/User%20Features/home/data/pot_model.dart';

import '../../../../../core/utils/style.dart';
import 'other_pots_photo.dart';
import 'pot_detail_info.dart';

class PotDetails extends StatefulWidget {
  const PotDetails({
    super.key,
    required this.potModel,
  });
  final PotProducts potModel;

  @override
  State<PotDetails> createState() => _PotDetailsState();
}

class _PotDetailsState extends State<PotDetails> {
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
          child: PotDetailsInfo(
            potModel: widget.potModel,
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
                'Other Pot Variations',
                style: Styles.textStyle18Inter.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: OtherPotsPhotoListView(
            potModel: widget.potModel,
          ),
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
