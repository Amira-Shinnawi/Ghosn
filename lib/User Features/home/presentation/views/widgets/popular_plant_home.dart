import 'package:flutter/material.dart';
import 'package:ghosn_app/core/utils/app_router.dart';
import 'package:go_router/go_router.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/assets_data.dart';
import '../../../../../core/utils/style.dart';

class PopularPlant extends StatelessWidget {
  const PopularPlant({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double blockHeight = (height / 100);
    double width = MediaQuery.of(context).size.width;
    double blockWidth = (width / 100);
    return SizedBox(
      height: blockHeight * 38,
      width: double.infinity,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: 5,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: blockWidth * 4),
              child: Container(
                decoration: BoxDecoration(
                  color: kHintColor.withOpacity(.3),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Stack(
                  children: [
                    AspectRatio(
                      aspectRatio: 2 / 3,
                      child: Image.asset(
                        AssetsData.imageTest2,
                      ),
                    ),
                    Positioned(
                      top: blockHeight * 1,
                      left: blockWidth * 10,
                      right: blockWidth * 10,
                      child: Center(
                        child: Container(
                          width: blockWidth * 30,
                          decoration: BoxDecoration(
                            color: Colors.white70,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: blockWidth * 4,
                              vertical: blockHeight * .5,
                            ),
                            child: Center(
                              child: Row(
                                children: [
                                  const CircleAvatar(
                                    radius: 5,
                                    backgroundColor: Colors.lightGreenAccent,
                                  ),
                                  SizedBox(
                                    width: blockWidth * 2,
                                  ),
                                  Text(
                                    'Outdoor',
                                    style: Styles.textStyle16Inter.copyWith(
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: blockHeight * 1.5,
                      left: blockWidth * 10,
                      right: blockWidth * 10,
                      child: GestureDetector(
                        onTap: () {
                          GoRouter.of(context)
                              .push(AppRouter.kProductDetailsHome);
                        },
                        child: Container(
                          height: blockHeight * 8,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white70,
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: blockWidth * 2,
                              vertical: blockHeight * 1,
                            ),
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Snack Plant',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: Styles.textStyle16Inter.copyWith(
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      '150 EGP',
                                      style: Styles.textStyle16Inter.copyWith(
                                        fontSize: 14,
                                        color: kGreenColor,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: blockWidth * 1,
                                ),
                                const Expanded(
                                    child: Icon(
                                  Icons.arrow_forward_ios,
                                  color: kGreenColor,
                                  size: 20,
                                ))
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
