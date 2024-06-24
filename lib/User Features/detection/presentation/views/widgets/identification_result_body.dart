import 'package:flutter/material.dart';

import '../../../../../core/utils/functions/network_image_handler.dart';
import '../../../../../core/utils/style.dart';
import '../../../../../core/widgets/custom_detect_row.dart';
import '../../../data/model/plant_identification_model.dart';

class IdentificationResultBody extends StatelessWidget {
  const IdentificationResultBody({
    super.key,
    required this.plantIdentificationDataModel,
  });
  final IdentifyData plantIdentificationDataModel;
  @override
  Widget build(BuildContext context) {
    const textDirection = TextDirection.ltr;

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    double blocHeight = (height / 100);
    double blocWidth = (width / 100);

    return SingleChildScrollView(
        child: Directionality(
      textDirection: textDirection,
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
                  image: NetworkHandler().getImage(
                      'Images/IdentityPredictions/IMG-UID-5-IDENTITY-PREDICTION-20240611205854.jpg'),
                  // : const NetworkImage(
                  //     'https://pbs.twimg.com/media/GPLNPLlXEAA8WkE?format=jpg&name=large'),
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
                  image: NetworkHandler().getImage(
                      'Images/IdentityPredictions/IMG-UID-5-IDENTITY-PREDICTION-20240611205854.jpg'),
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
                  child:const Text(
                    "Tulip ( Tulipa )",
                    style: Styles.textStyle16Inter,
                  ),
                ),
                SizedBox(
                  height: blocHeight * 1,
                ),
const DetectResultRow(
                  label: "Confidence Score",
                  value: '60%',
                ),
              const  DetectResultRow(
                  label: "Plant Origin",
                  value: 'Central Asia, Turkey, and surrounding regions',
                ),
              const  DetectResultRow(
                  label: "Blossoming Season",
                  value: 'March to May, depending on the variety and climate',
                ),
                DetectResultRow(
                  label: "Description",
                  value:
                      'Tulips are spring-blooming perennials that come in a variety of bright colors including red, yellow, pink, purple, and white. They are popular in gardens and as cut flowers for their elegant shape and vibrant colors. Tulips prefer well-drained, fertile soil and need to be watered regularly during their growing season. They thrive in full sunlight and cooler climates.\r\n\r\nWhile most tulips have little to no scent, some varieties do have a light, pleasant fragrance. However, their stunning visual appeal makes them a favorite among gardeners and florists.',
                ),
                DetectResultRow(
                  label: "MinTemperature",
                  value: '5',
                ),
                DetectResultRow(
                  label: "Max Temperature",
                  value: '20%',
                ),
                DetectResultRow(
                  label: "Humidity",
                  value: '30% to 50%',
                ),
                DetectResultRow(
                  label: "Height",
                  value: "between 10 and 70 cm (4 and 28 inches) high.",
                ),
                DetectResultRow(
                  label: "Sunlight Amount",
                  value: 'Full sunlight, ideally 6 hours or more per day',
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
      ),
    ));
  }
}
