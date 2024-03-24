import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ghosn_app/Admin%20Features/Article/presentation/views/widgets/latest_article_body.dart';
import 'package:ghosn_app/core/widgets/custom_appbar.dart';

import '../../../../core/utils/style.dart';
import '../../../Drawer/presentation/views/admin_custom_drawer.dart';

class LatestArticleHome extends StatefulWidget {
  const LatestArticleHome({super.key});

  @override
  State<LatestArticleHome> createState() => _LatestArticleHomeState();
}

class _LatestArticleHomeState extends State<LatestArticleHome> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: CustomAppBar(
          titleAppBar: Text(
            'Latest Article',
            style: Styles.textStyle20Inter.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
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
      body: const LatestArticleBody(),
    );
  }
}
