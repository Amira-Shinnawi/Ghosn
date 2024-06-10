import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_text_field.dart';
import 'latest_item_list_view.dart';

class LatestArticleBody extends StatefulWidget {
  const LatestArticleBody({super.key});

  @override
  State<LatestArticleBody> createState() => _LatestArticleBodyState();
}

class _LatestArticleBodyState extends State<LatestArticleBody> {
  String searchQuery = '';
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double blocHeight = (height / 100);
    double width = MediaQuery.of(context).size.width;
    double blocWidth = (width / 100);
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: blocWidth * 3, vertical: blocHeight * 1),
      child: CustomScrollView(slivers: [
        SliverFillRemaining(
            child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                bottom: blocHeight * .5,
              ),
              child: CustomTextField(
                controller: _searchController,
                onFieldSubmitted: (value) {
                  setState(() {
                    searchQuery = value;
                  });
                },
                prefixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      searchQuery = _searchController.text;
                    });
                  },
                  icon: const Icon(Icons.search),
                  color: Colors.black.withOpacity(.5),
                ),
                hintText: 'What are you looking for?',
                width: 1,
                color: Colors.black.withOpacity(.3),
              ),
            ),
            Expanded(
              child: ArticleItemListView(
                searchQuery: searchQuery,
              ),
            ),
          ],
        ))
      ]),
    );
  }
}
