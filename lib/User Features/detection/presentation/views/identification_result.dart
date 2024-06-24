import 'package:flutter/material.dart';

import '../../../../core/utils/style.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../../data/model/plant_identification_model.dart';
import 'widgets/identification_result_body.dart';

class IdentificationResult extends StatelessWidget {
  const IdentificationResult(
      {super.key, required this.plantIdentificationDataModel});
  final IdentifyData plantIdentificationDataModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20,
          ),
        ),
        titleAppBar: Text(
          'Tulip ( Tulipa )',
          style: Styles.textStyle18Inter.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: false,
      ),
      body: SafeArea(
        child: IdentificationResultBody(
          plantIdentificationDataModel: plantIdentificationDataModel,
        ),
      ),
    );
  }
}
