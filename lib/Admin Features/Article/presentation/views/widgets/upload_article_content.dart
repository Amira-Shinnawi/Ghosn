import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:ghosn_app/constants.dart';
import 'package:ghosn_app/core/utils/Api_Key.dart';
import 'package:ghosn_app/core/widgets/custom_button.dart';

import '../../../../../core/utils/style.dart';
import '../../../../../core/widgets/custom_text_field.dart';

class UploadArticleContent extends StatefulWidget {
  const UploadArticleContent({
    super.key,
  });

  @override
  State<UploadArticleContent> createState() => _UploadArticleContentState();
}

class _UploadArticleContentState extends State<UploadArticleContent> {
  FilePickerResult? result;
  final titleController = TextEditingController();
  final slugController = TextEditingController();
  final tagsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double blocHeight = (height / 100);
    double width = MediaQuery.of(context).size.width;
    double blocWidth = (width / 100);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Article Content',
          style: Styles.textStyle16Inter.copyWith(
            decoration: TextDecoration.underline,
          ),
        ),
        SizedBox(
          height: blocHeight * 2,
        ),
        CustomTextField(
          controller: titleController,
          showSuffixIcon: false,
          hintText: 'Title',
          keyboardType: TextInputType.multiline,
          width: 2,
        ),
        CustomTextField(
          controller: slugController,
          showSuffixIcon: false,
          hintText: 'Slug',
          keyboardType: TextInputType.multiline,
          width: 2,
        ),
        CustomTextField(
          controller: tagsController,
          showSuffixIcon: false,
          hintText: 'tags',
          keyboardType: TextInputType.multiline,
          width: 2,
        ),
        CustomButton(
          height: blocHeight * 5,
          text: 'Create Article',
          onPressed: () {
            addArticle(
                titleController.text, slugController.text, tagsController.text);
          },
        )
      ],
    );
  }

  Future<void> addArticle(String title, String slug, String tags) async {
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $userToken'
    };
    var data = json.encode({
      "slug": slug,
      "title": title,
      "tags": [
        tags,
      ]
    });
    var dio = Dio();
    var response = await dio.request(
      '${ApiKeys.BASE_URL}/api/Article',
      options: Options(
        method: 'POST',
        headers: headers,
      ),
      data: data,
    );

    if (response.statusCode == 200) {
      print(json.encode(response.data));
    }
  }
}
