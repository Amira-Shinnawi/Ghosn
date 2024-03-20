import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ghosn_app/core/widgets/custom_appbar.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/app_router.dart';
import '../../../../core/utils/style.dart';
import '../../../Account/presentation/views/widgets/custom_drawer.dart';
import 'widgets/article_home_body.dart';

class ArticleHome extends StatefulWidget {
  const ArticleHome({super.key});

  @override
  State<ArticleHome> createState() => _ArticleHomeState();
}

class _ArticleHomeState extends State<ArticleHome> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: CustomAppBar(
          titleAppBar: Text(
            'Article Popular',
            style: Styles.textStyle20Inter.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
          automaticallyImplyLeading: false,
          centerTitle: false,
          actions: [
            IconButton(
              onPressed: () {
                GoRouter.of(context).push(AppRouter.kNotification);
              },
              icon: const Icon(
                Icons.notifications_none,
                size: 25,
              ),
            ),
            IconButton(
              onPressed: () {
                _scaffoldKey.currentState!.openDrawer();
              },
              icon: const Icon(
                FontAwesomeIcons.bars,
                size: 20,
              ),
            ),
          ]),
      drawer: const CustomDrawer(),
      body: const ArticleHomeBody(),
    );
  }
}
