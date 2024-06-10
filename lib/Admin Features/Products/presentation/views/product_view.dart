import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ghosn_app/constants.dart';
import 'package:ghosn_app/core/widgets/custom_appbar.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/app_router.dart';
import '../../../../core/utils/style.dart';
import '../../../Drawer/presentation/views/admin_custom_drawer.dart';
import 'widgets/product_view_body.dart';

class ProductAdminView extends StatefulWidget {
  const ProductAdminView({super.key});

  @override
  State<ProductAdminView> createState() => _ProductAdminViewState();
}

class _ProductAdminViewState extends State<ProductAdminView> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  int _counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        appBar: CustomAppBar(
            titleAppBar: Text(
              'Products',
              style: Styles.textStyle20Inter.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
            centerTitle: false,
            actions: [
              IconButton(
                onPressed: () {
                  scaffoldKey.currentState!.openDrawer();
                },
                icon: const Icon(
                  FontAwesomeIcons.bars,
                  size: 20,
                ),
              ),
            ]),
        drawer: const AdminCustomDrawer(),
        body: const SafeArea(
          child: ProductAdminBody(),
        ),
        floatingActionButton: SpeedDial(
            animatedIcon: AnimatedIcons.menu_close,
            animatedIconTheme: const IconThemeData(
              size: 20,
              color: Colors.white,
            ),
            backgroundColor: kGreenColor,
            visible: true,
            curve: Curves.bounceIn,
            children: [
              SpeedDialChild(
                child: const Icon(
                  FontAwesomeIcons.seedling,
                  color: Colors.white,
                  size: 20,
                ),
                backgroundColor: kGreenColor,
                onTap: () {
                  GoRouter.of(context).push(AppRouter.kCreatePlant);
                },
                label: 'Add Plant',
                labelStyle:
                    Styles.textStyle16Inter.copyWith(color: Colors.white),
                labelBackgroundColor: kGreenColor,
              ),
              SpeedDialChild(
                child: const Icon(
                  FontAwesomeIcons.glassWater,
                  color: Colors.white,
                  size: 20,
                ),
                backgroundColor: kGreenColor,
                onTap: () {
                  setState(() {
                    _counter = 0;
                    GoRouter.of(context).push(AppRouter.kCreatePot);
                  });
                },
                label: 'Add Pot',
                labelStyle:
                    Styles.textStyle16Inter.copyWith(color: Colors.white),
                labelBackgroundColor: kGreenColor,
              ),
              SpeedDialChild(
                child: const Icon(
                  FontAwesomeIcons.sitemap,
                  color: Colors.white,
                  size: 20,
                ),
                backgroundColor: kGreenColor,
                onTap: () {
                  setState(() {
                    _counter = 0;
                    GoRouter.of(context).push(AppRouter.kCreateCategory);
                  });
                },
                label: 'Add Category',
                labelStyle:
                    Styles.textStyle16Inter.copyWith(color: Colors.white),
                labelBackgroundColor: kGreenColor,
              ),
            ]));
  }
}
