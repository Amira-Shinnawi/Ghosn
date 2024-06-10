import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ghosn_app/Admin%20Features/Article/presentation/views/widgets/latest_article_body.dart';
import 'package:ghosn_app/core/widgets/custom_appbar.dart';

import '../../../../constants.dart';
import '../../../../core/utils/style.dart';
import '../../../Drawer/presentation/views/admin_custom_drawer.dart';
import 'article_content.dart';

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
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 20,
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
      floatingActionButton: ClipRRect(
        borderRadius: BorderRadius.circular(40),
        child: FloatingActionButton(
          backgroundColor: kGreenColor,
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const ArticleContent();
            }));
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
