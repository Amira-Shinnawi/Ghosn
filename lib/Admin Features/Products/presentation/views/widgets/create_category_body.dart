import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:ghosn_app/core/utils/Api_Key.dart';
import 'package:ghosn_app/core/utils/style.dart';

import '../../../../../constants.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../../../../../core/widgets/show_snack_bar.dart';

class CreateCategoryBody extends StatefulWidget {
  const CreateCategoryBody({super.key});

  @override
  State<CreateCategoryBody> createState() => _CreateCategoryBodyState();
}

class _CreateCategoryBodyState extends State<CreateCategoryBody> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double blockHeight = (height / 100);
    double width = MediaQuery.of(context).size.width;
    double blockWidth = (width / 100);
    final categoryName = TextEditingController();
    final categoryDesc = TextEditingController();
    GlobalKey<FormState> formKey = GlobalKey();

    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: blockWidth * 3, vertical: blockHeight * 2),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Category Name',
                style: Styles.textStyle16Inter.copyWith(
                  fontSize: 14,
                ),
              ),
              SizedBox(
                height: blockHeight * 1,
              ),
              CustomTextField(
                hintText: 'Category Name',
                controller: categoryName,
              ),
              SizedBox(
                height: blockHeight * 2,
              ),
              Text(
                'Category Description',
                style: Styles.textStyle16Inter.copyWith(
                  fontSize: 14,
                ),
              ),
              SizedBox(
                height: blockHeight * 1,
              ),
              CustomTextField(
                hintText: 'Category Description',
                minLength: 4,
                controller: categoryDesc,
              ),
              SizedBox(
                height: blockHeight * 4,
              ),
              Center(
                child: CustomButton(
                    height: blockHeight * 5,
                    text: 'Add',
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return SimpleDialog(
                                backgroundColor: Colors.white,
                                title: const Text(
                                  'Are You Sure!\n You want to Add it',
                                  textAlign: TextAlign.center,
                                  style: Styles.textStyle18Inter,
                                ),
                                children: [
                                  const Divider(),
                                  TextButton(
                                    style: TextButton.styleFrom(
                                      textStyle: Theme.of(context)
                                          .textTheme
                                          .labelLarge,
                                    ),
                                    child: Text(
                                      'Add',
                                      style: Styles.textStyle18Inter.copyWith(
                                        color: kGreenColor,
                                      ),
                                    ),
                                    onPressed: () {
                                      addCategory(
                                          name: categoryName.text,
                                          description: categoryDesc.text);
                                      categoryName.clear();
                                      categoryDesc.clear();
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  const Divider(),
                                  TextButton(
                                    style: TextButton.styleFrom(
                                      textStyle: Theme.of(context)
                                          .textTheme
                                          .labelLarge,
                                    ),
                                    child: Text(
                                      'Cancel',
                                      style: Styles.textStyle18Inter.copyWith(
                                        color: Colors.red,
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            });
                      }
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> addCategory({
    required String name,
    required String description,
  }) async {
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $userToken'
    };
    try {
      var data = json.encode({"name": name, "description": description});
      var dio = Dio();
      var response = await dio.request(
        '${ApiKeys.BASE_URL}/api/category/Create',
        options: Options(
          method: 'POST',
          headers: headers,
        ),
        data: data,
      );

      if (response.statusCode == 200) {
        print(json.encode(response.data));
      } else {
        throw Exception('An error occurred, Please Try Again!.');
      }
    } on DioException catch (error) {
      if (error.response?.statusCode == 400) {
        showSnackBar(context, 'This Category already exists.');
        print(error.response?.statusMessage);
      } else {
        rethrow;
      }
    }
  }
}
