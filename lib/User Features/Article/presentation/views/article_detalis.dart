import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ghosn_app/User%20Features/Article/data/model/article_model.dart';
import 'package:ghosn_app/User%20Features/Article/presentation/views/widgets/article_details_body.dart';
import 'package:ghosn_app/core/widgets/custom_appbar.dart';

import '../../../../Admin Features/Drawer/presentation/views/user_custom_drawer.dart';
import '../../../../core/utils/style.dart';

class ArticleDetails extends StatefulWidget {
  const ArticleDetails({super.key, required this.articlesModel});
  final AllArticles articlesModel;
  @override
  State<ArticleDetails> createState() => _ArticleDetailsState();
}

class _ArticleDetailsState extends State<ArticleDetails> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

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
          titleAppBar: Text(
            '${widget.articlesModel.slug}',
            style: Styles.textStyle18Inter.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
          automaticallyImplyLeading: false,
          centerTitle: true,
          actions: [
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
      body: ArticleDetailsBody(
        articlesModel: widget.articlesModel,
      ),
    );
  }
}
