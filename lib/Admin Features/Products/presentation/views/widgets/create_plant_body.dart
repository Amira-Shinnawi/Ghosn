import 'package:flutter/material.dart';
import 'package:ghosn_app/core/widgets/custom_button.dart';

import 'add_image.dart';
import 'detail_for_add_plant.dart';

class CreatePlantBody extends StatelessWidget {
  const CreatePlantBody({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double blockHeight = (height / 100);
    double width = MediaQuery.of(context).size.width;
    double blockWidth = (width / 100);

    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: blockWidth * 3, vertical: blockHeight * 2),
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: AddPlantPhoto(),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: blockHeight * 2,
            ),
          ),
          const SliverToBoxAdapter(
            child: DetailForAddPlant(),
          ),
          SliverToBoxAdapter(
              child: CustomButton(
                  height: blockHeight * 5,
                  text: 'Save',
                  onPressed: () {
                    // showDialog(
                    //     context: context,
                    //     builder: (BuildContext context) {
                    //       return SimpleDialog(
                    //         backgroundColor: Colors.white,
                    //         title: const Text(
                    //           'Are You Sure!\n You want to Save it',
                    //           textAlign: TextAlign.center,
                    //           style: Styles.textStyle18Inter,
                    //         ),
                    //         children: [
                    //           const Divider(),
                    //           TextButton(
                    //             style: TextButton.styleFrom(
                    //               textStyle:
                    //                   Theme.of(context).textTheme.labelLarge,
                    //             ),
                    //             child: Text(
                    //               'Save',
                    //               style: Styles.textStyle18Inter.copyWith(
                    //                 color: kGreenColor,
                    //               ),
                    //             ),
                    //             onPressed: () {

                    //             },
                    //           ),
                    //           const Divider(),
                    //           TextButton(
                    //             style: TextButton.styleFrom(
                    //               textStyle:
                    //                   Theme.of(context).textTheme.labelLarge,
                    //             ),
                    //             child: Text(
                    //               'Cancel',
                    //               style: Styles.textStyle18Inter.copyWith(
                    //                 color: Colors.red,
                    //               ),
                    //             ),
                    //             onPressed: () {
                    //               Navigator.of(context).pop();
                    //             },
                    //           ),
                    //         ],
                    //       );
                    //     });
                  })),
        ],
      ),
    );
  }
}
