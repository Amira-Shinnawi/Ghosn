import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/assets_data.dart';
import '../../../../../core/utils/style.dart';
import '../../../../../translations/local_keys.g.dart';

class PurchaseItem extends StatefulWidget {
  const PurchaseItem({super.key});

  @override
  State<PurchaseItem> createState() => _PurchaseItemState();
}

class _PurchaseItemState extends State<PurchaseItem> {
  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var formatter = DateFormat.yMMMMd('en_US');
    String formattedDate = formatter.format(now);

    double height = MediaQuery.of(context).size.height;
    double blockHeight = (height / 100);
    double width = MediaQuery.of(context).size.width;
    double blockWidth = (width / 100);

    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: blockWidth * 3, vertical: blockHeight * 1),
      child: Container(
        height: blockHeight * 10,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: kHintColor.withOpacity(.2),
            width: 2,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: blockWidth * 3, vertical: blockHeight * .5),
          child: Row(
            children: [
              AspectRatio(
                aspectRatio: 2 / 3,
                child: Image.asset(
                  AssetsData.imageTest2,
                  fit: BoxFit.cover,
                ),
              ),
              const Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sliver Plant',
                    style: Styles.textStyle16Inter.copyWith(
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    'Brown Bowl',
                    style: Styles.textStyle16Inter.copyWith(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '400 EGP',
                    style: Styles.textStyle16Inter.copyWith(
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    formattedDate,
                    style: Styles.textStyle16Inter.copyWith(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  PopupMenuButton(
                    icon: const Icon(FontAwesomeIcons.ellipsis),
                    color: kGreenColor,
                    onSelected: (value) {
                      GoRouter.of(context).push(AppRouter.kProductDetailsHome);
                    },
                    itemBuilder: (context) {
                      return [
                        PopupMenuItem(
                          value: 'showProduct',
                          child: Text(
                            LocaleKeys.show.tr(),
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ];
                    },
                  ),

                  // ElevatedButton(
                  //   onPressed: () {
                  //     GoRouter.of(context).push(AppRouter.kProductDetailsHome);
                  //   },
                  //   style: const ButtonStyle(
                  //     backgroundColor: MaterialStatePropertyAll(
                  //       kGreenColor,
                  //     ),
                  //     minimumSize: MaterialStatePropertyAll(
                  //       Size(30, 30),
                  //     ),
                  //   ),
                  //   child: Text(
                  //     LocaleKeys.show.tr(),
                  //     style: Styles.textStyle22Inter.copyWith(
                  //       fontSize: 14,
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
