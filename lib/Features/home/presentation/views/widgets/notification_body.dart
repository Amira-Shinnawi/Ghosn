import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ghosn_app/core/utils/style.dart';

import '../../../../../translations/local_keys.g.dart';
import 'notification.item.dart';

class NotificationBody extends StatelessWidget {
  const NotificationBody({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double blockWidth = (width / 100);

    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: blockWidth * 5),
            child: Text(
              LocaleKeys.Today.tr(),
              style: Styles.textStyle20Inter.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              if (index == 10) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: blockWidth * 5),
                      child: Text(
                        LocaleKeys.Earlier.tr(),
                        style: Styles.textStyle20Inter.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                );
              } else if (index > 10) {
                return const NotificationItem();
              } else {
                return const NotificationItem();
              }
            },
            childCount: 20,
          ),
        ),
      ],
    );
  }
}
