import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ghosn_app/User%20Features/Article/presentation/views/widgets/article_details_body.dart';
import 'package:ghosn_app/core/widgets/custom_appbar.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/app_router.dart';
import '../../../Account/presentation/views/widgets/user_custom_drawer.dart';

class ArticleDetails extends StatefulWidget {
  const ArticleDetails({super.key});

  @override
  State<ArticleDetails> createState() => _ArticleDetailsState();
}

class _ArticleDetailsState extends State<ArticleDetails> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: CustomAppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 20,
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
      drawer: const UserCustomDrawer(),
      body: const ArticleDetailsBody(),
    );
  }
}
