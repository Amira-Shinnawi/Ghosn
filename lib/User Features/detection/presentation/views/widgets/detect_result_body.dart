import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/utils/functions/network_image_handler.dart';
import '../../../../../core/utils/style.dart';
import '../../../../../core/widgets/custom_detect_row.dart';
import '../../../data/model/plant_disease_model.dart';

class DetectResultBody extends StatelessWidget {
  const DetectResultBody({
    super.key,
    required this.plantDataModel,
  });
  final PlantData plantDataModel;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    double blocHeight = (height / 100);
    double blocWidth = (width / 100);

    return SingleChildScrollView(
        child: Stack(
      children: [
        Positioned(
          top: blocHeight * .2,
          left: blocHeight * 2,
          right: blocHeight * 2,
          child: Container(
            width: width * .93,
            height: height * .3,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              image: DecorationImage(
                image: plantDataModel.submittedImgUrl != null
                    ? NetworkHandler()
                        .getImage('${plantDataModel.submittedImgUrl}')
                    : const NetworkImage(
                        'https://pbs.twimg.com/media/GPLNPLlXEAA8WkE?format=jpg&name=large'),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        Positioned(
          left: blocHeight * 1.3,
          top: blocHeight * 22,
          child: Container(
            width: width * .4,
            height: height * .17,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              image: DecorationImage(
                image: plantDataModel.submittedImgUrl != null
                    ? NetworkHandler()
                        .getImage('${plantDataModel.submittedImgUrl}')
                    : const NetworkImage(
                        'https://pbs.twimg.com/media/GPLNPLlXEAA8WkE?format=jpg&name=large'),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              left: blocHeight * 1.5,
              right: blocHeight * 1.3,
              top: blocHeight * 33),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: blocHeight * 19, bottom: blocHeight * 2.5),
                child: Row(
                  children: [
                    SizedBox(
                      width: blocWidth * 2,
                    ),
                    Icon(
                      plantDataModel.isHealthy.toString() == 'true'
                          ? FontAwesomeIcons.solidCircleCheck
                          : FontAwesomeIcons.solidCircleXmark,
                      color: plantDataModel.isHealthy.toString() == 'true'
                          ? Colors.green
                          : Colors.red,
                      size: 20,
                    ),
                    SizedBox(
                      width: blocWidth * 2,
                    ),
                    const Text(
                      "Plant Healthy",
                      style: Styles.textStyle16Inter,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: blocHeight * 1,
              ),
              DetectResultRow(
                label: "Disease Name",
                value: '${plantDataModel.diseaseName}',
              ),
              DetectResultRow(
                label: "Treatment Description",
                value: '${plantDataModel.treatmentDescription}',
              ),
              DetectResultRow(
                label: "Symptoms",
                value: '${plantDataModel.symptoms}',
              ),
              DetectResultRow(
                label: "pathogens",
                value: '${plantDataModel.pathogens}',
              ),
              DetectResultRow(
                label: "Confidence Score",
                value: '${plantDataModel.confidenceScore}%',
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "For details about the plant",
                    style: Styles.textStyle16,
                  ),
                  SizedBox(width: width * .01),
                  const Text(
                    "click here",
                    style: Styles.textStyle16green,
                  ),
                ],
              ),
              SizedBox(
                height: blocHeight * 2,
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
