import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ghosn_app/core/utils/Api_Key.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/style.dart';
import '../../../../../core/widgets/show_snack_bar.dart';
import '../../../../../translations/local_keys.g.dart';
import 'write_content_post.dart';

class CreatePostBody extends StatefulWidget {
  const CreatePostBody({super.key, this.onPressed});
  final void Function()? onPressed;

  @override
  State<CreatePostBody> createState() => _CreatePostBodyState();
}

class _CreatePostBodyState extends State<CreatePostBody> {
  TextEditingController content = TextEditingController();
  File? _image;
  final picker = ImagePicker();
  int? _selectedId;
  String? _selectedPostAudience;

  final List<DropdownMenuItem<int>> _audience = [
    DropdownMenuItem(value: 1, child: Text(LocaleKeys.Public.tr())),
    DropdownMenuItem(value: 2, child: Text(LocaleKeys.Followers.tr())),
    DropdownMenuItem(value: 3, child: Text(LocaleKeys.OnlyMe.tr())),
  ];
  Future<void> getImage() async {
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedImage != null) {
        _image = File(pickedImage.path);
      } else {
        print('No Image Choose');
      }
    });
  }

  //createPost and upload Image
  Future<void> createPost(
    File? image,
    String content,
    int postAudience,
  ) async {
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $userToken'
    };

    try {
      var dio = Dio();
      Response response;
      if (image != null) {
        String fileName = image.path.split('/').last;

        FormData data = FormData.fromMap({
          "ImageFile": await MultipartFile.fromFile(
            image.path,
            filename: fileName,
          ),
          "Content": content,
          "PostAudience": postAudience,
        });

        response = await dio.request(
          '${ApiKeys.BASE_URL}/api/post/Add',
          options: Options(
            method: 'POST',
            headers: headers,
          ),
          data: data,
        );
      } else {
        response = await dio.request(
          '${ApiKeys.BASE_URL}/api/post/Add',
          options: Options(
            method: 'POST',
            headers: headers,
          ),
        );
      }

      if (response.statusCode == 200 || response.statusCode == 204) {
        print(json.encode(response.data));
      } else {
        throw Exception('An error occurred, Please Try Again!.');
      }
    } on DioException catch (error) {
      if (error.response?.statusCode == 400 ||
          error.response?.statusCode == 415) {
        showSnackBar(context, 'Error Adding post, Please Try Again! .');
        print(error.response?.statusMessage);
      } else {
        rethrow;
      }
    }
  }

  GlobalKey<FormState> formKey = GlobalKey();
  bool isLoading = false;
  @override
  void dispose() {
    content;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double blockHeight = (height / 100);
    double width = MediaQuery.of(context).size.width;
    double blockWidth = (width / 100);

    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: blockWidth * 3, vertical: blockHeight * 2),
      child: LoadingOverlay(
        isLoading: isLoading,
        child: Form(
          key: formKey,
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: WritePostContent(
                  controller: content,
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      createPost(_image, content.text, _selectedId!);

                      Navigator.pop(context);
                    }
                  },
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: blockHeight * 1,
                ),
              ),
              SliverToBoxAdapter(
                  child: Column(
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.collections,
                        size: 18,
                      ),
                      SizedBox(
                        width: blockWidth * 2,
                      ),
                      Text(
                        LocaleKeys.AddPhoto.tr(),
                        style: Styles.textStyle16Inter.copyWith(
                          decoration: TextDecoration.underline,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: blockHeight * 2,
                  ),
                  _image != null
                      ? Container(
                          height: blockHeight * 20,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: kHintColor,
                              width: 1,
                            ),
                            image: DecorationImage(
                              image: FileImage(_image!),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        )
                      : Container(
                          height: blockHeight * 20,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: kHintColor,
                              width: 1,
                            ),
                          ),
                          child: IconButton(
                            onPressed: () {
                              getImage();
                            },
                            icon: const Icon(
                              Icons.add,
                            ),
                          ),
                        )
                ],
              )),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: blockHeight * 2,
                ),
              ),
              SliverToBoxAdapter(
                child: DropdownButtonFormField<int>(
                  value: _selectedId,
                  hint: Text(LocaleKeys.PostAudience.tr()),
                  items: _audience,
                  onChanged: (int? newValue) {
                    setState(() {
                      _selectedId = newValue;
                      _selectedPostAudience = _audience
                          .firstWhere((item) => item.value == newValue)
                          .child
                          .toString();
                    });
                  },
                  decoration: InputDecoration(
                    hintStyle: TextStyle(
                      color: Colors.black.withOpacity(0.4000000059604645),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                    labelStyle: TextStyle(
                      color: Colors.black.withOpacity(0.4000000059604645),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                    contentPadding:
                        const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                      borderSide: BorderSide(
                        color: kGreenColor,
                        width: 1,
                      ),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                      borderSide: BorderSide(
                        color: kGreenColor,
                        width: 1,
                      ),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                      borderSide: BorderSide(
                        color: kGreenColor,
                        width: 1,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
