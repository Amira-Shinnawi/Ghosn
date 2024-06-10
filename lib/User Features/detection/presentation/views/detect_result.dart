import 'package:flutter/material.dart';
import 'package:ghosn_app/User%20Features/detection/data/model/plant_disease_model.dart';

import '../../../../core/utils/style.dart';
import '../../../../core/widgets/custom_appbar.dart';
import 'widgets/detect_result_body.dart';

class DetectResult extends StatelessWidget {
  const DetectResult({super.key, required this.plantDataModel});
  final PlantData plantDataModel;
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
          '${plantDataModel.diseaseName}',
          style: Styles.textStyle18Inter.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: false,
      ),
      body: SafeArea(
        child: DetectResultBody(
          plantDataModel: plantDataModel,
        ),
      ),
    );
  }
}
