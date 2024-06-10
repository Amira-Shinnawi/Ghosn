import 'package:flutter/material.dart';
import 'package:ghosn_app/User%20Features/home/data/pot_model.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/functions/network_image_handler.dart';
import '../../../../../core/widgets/custom_network_image.dart';
import 'show_image_pots.dart';

class OtherPotsPhotoListView extends StatefulWidget {
  const OtherPotsPhotoListView({
    super.key,
    required this.potModel,
  });
  final PotProducts potModel;

  @override
  State<OtherPotsPhotoListView> createState() => _OtherPotsPhotoListViewState();
}

class _OtherPotsPhotoListViewState extends State<OtherPotsPhotoListView> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double blockHeight = (height / 100);
    double blockWidth = (width / 100);

    return SizedBox(
      height: blockHeight * 35,
      width: double.infinity,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: widget.potModel.potVariations!.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          PotVariations potVariations = widget.potModel.potVariations![index];
          return Container(
            margin: EdgeInsets.only(
              left: blockWidth * 5,
              top: blockHeight * 2,
              bottom: blockHeight * 2,
            ),
            width: blockWidth * 40,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CustomNetworkImage(
                    imageUrl: NetworkHandler()
                        .getImage('Pots-Images/${potVariations.imageUrl}')
                        ,
                    aspectRatio: 2 / 2,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ShowImagePots(
                            startingIndex: selectedIndex = index,
                            potModel: widget.potModel,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: blockWidth * 2,
                          vertical: blockHeight * 1),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(0, 10),
                            blurRadius: 50,
                            color: kGreenColor.withOpacity(0.23),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${potVariations.sizes} \n"
                                .split(' ')
                                .first
                                .toUpperCase(),
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                          Text(
                            '${potVariations.price!.roundToDouble()}.LE',
                            maxLines: 1,
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium
                                ?.copyWith(color: kGreenColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
