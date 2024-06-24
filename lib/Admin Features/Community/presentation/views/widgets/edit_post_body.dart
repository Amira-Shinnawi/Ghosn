import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ghosn_app/Admin%20Features/Community/data/model/post_model/post_model.dart';
import 'package:ghosn_app/core/utils/Api_Key.dart';
import 'package:ghosn_app/core/utils/functions/network_image_handler.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/style.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../../../../../core/widgets/show_snack_bar.dart';
import '../../../../../translations/local_keys.g.dart';

class EditPostBody extends StatefulWidget {
  const EditPostBody({super.key, required this.editPost});
  final MyPosts editPost;
  @override
  State<EditPostBody> createState() => _EditPostBodyState();
}

class _EditPostBodyState extends State<EditPostBody> {
  File? _image;
  final picker = ImagePicker();
  int? _selectedId;
  String? _selectedPostAudience;

  final List<DropdownMenuItem<int>> _audience = const [
    DropdownMenuItem(value: 1, child: Text('Public')),
    DropdownMenuItem(value: 2, child: Text('Followers')),
    DropdownMenuItem(value: 3, child: Text('Only Me')),
  ];

  Future<void> getImage(String content, int postAudience, int id) async {
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedImage != null) {
        _image = File(pickedImage.path);
      } else {
        print('No Image Choose');
      }
    });
    await updateImageProfile(_image!, content, postAudience, id);
  }

  //createPost and upload Image
  Future<void> updatePost(String content, int postAudience, int id) async {
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $userToken'
    };

    try {
      var dio = Dio();
      Response response;

      FormData data = FormData.fromMap({
        "Content": content,
        "PostAudience": postAudience,
      });

      response = await dio.request(
        '${ApiKeys.BASE_URL}/api/post/updatePost?PostId=$id',
        options: Options(
          method: 'PUT',
          headers: headers,
        ),
        data: data,
      );

      if (response.statusCode == 204) {
        print(json.encode(response.data));
      } else {
        throw Exception('An error occurred, Please Try Again!.');
      }
    } on DioException catch (error) {
      if (error.response?.statusCode == 405 ||
          error.response?.statusCode == 415 ||
          error.response?.statusCode == 500) {
        showSnackBar(context, 'Updated Failed.');
        print(error.response?.statusMessage);
      } else {
        rethrow;
      }
    }
  }

  Future<void> updateImageProfile(
      File image, String content, int postAudience, int id) async {
    var headers = {
      'Content-Type': 'multipart/form-data',
      'Authorization': 'Bearer $userToken'
    };
    String fileName = image.path.split('/').last;

    FormData data = FormData.fromMap({
      "ImageFile": await MultipartFile.fromFile(
        image.path,
        filename: fileName,
      ),
      'Content': content,
      'PostAudience': postAudience
    });

    var dio = Dio();
    var response = await dio.request(
      '${ApiKeys.BASE_URL}/api/post/updatePost?PostId=$id',
      options: Options(
        method: 'PUT',
        headers: headers,
      ),
      data: data,
    );

    if (response.statusCode == 200) {
      print(json.encode(response.data));
    } else {
      print(response.statusMessage);
    }
  }

  GlobalKey<FormState> formKey = GlobalKey();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double blockHeight = (height / 100);
    double width = MediaQuery.of(context).size.width;
    double blockWidth = (width / 100);
    TextEditingController content = TextEditingController(
      text: widget.editPost.post!.text,
    );
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
                child: ContentEditPost(
                    onPressed: () {
                      updatePost(content.text, _selectedId!,
                          widget.editPost.post!.id!);
                    },
                    widget: widget,
                    content: content),
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
                            image: DecorationImage(
                              image: NetworkHandler().getImage(
                                  widget.editPost.post!.releventImgUrl!),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: IconButton(
                            onPressed: () {
                              getImage(
                                content.text,
                                _selectedId!,
                                widget.editPost.post!.id!,
                              );
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

class ContentEditPost extends StatelessWidget {
  const ContentEditPost({
    super.key,
    required this.widget,
    required this.content,
    required this.onPressed,
  });

  final EditPostBody widget;
  final TextEditingController content;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double blockHeight = (height / 100);
    double width = MediaQuery.of(context).size.width;
    double blockWidth = (width / 100);
    return Column(
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: NetworkHandler()
                  .getImage(widget.editPost.post!.author!.releventImgUrl!),
            ),
            SizedBox(
              width: blockWidth * 4,
            ),
            Text(
              '${widget.editPost.post!.author!.userName}',
              style: Styles.textStyle16Inter,
            ),
            const Spacer(),
            ElevatedButton(
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(kGreenColor),
              ),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return SimpleDialog(
                        backgroundColor: Colors.white,
                        title: Text(
                          LocaleKeys.AreYouSureYouwanttopostit.tr(),
                          textAlign: TextAlign.center,
                          style: Styles.textStyle18Inter,
                        ),
                        children: [
                          const Divider(),
                          TextButton(
                            style: TextButton.styleFrom(
                              textStyle: Theme.of(context).textTheme.labelLarge,
                            ),
                            onPressed: onPressed,
                            child: Text(
                              LocaleKeys.Post.tr(),
                              style: Styles.textStyle18Inter.copyWith(
                                color: kGreenColor,
                              ),
                            ),
                          ),
                          const Divider(),
                          TextButton(
                            style: TextButton.styleFrom(
                              textStyle: Theme.of(context).textTheme.labelLarge,
                            ),
                            child: Text(
                              LocaleKeys.Cancel.tr(),
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
              },
              child: Text(
                LocaleKeys.Post.tr(),
                style: Styles.textStyle16Inter.copyWith(
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: blockHeight * 2,
        ),
        CustomTextField(
          showSuffixIcon: false,
          hintText: LocaleKeys.WhatsonyourMind.tr(),
          width: 0,
          color: Colors.black,
          minLength: 6,
          controller: content,
        ),
      ],
    );
  }
}
