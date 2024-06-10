import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:ghosn_app/constants.dart';

import '../../../../../core/utils/style.dart';
import '../../../../../core/widgets/custom_button.dart';

class UploadArticleContent extends StatefulWidget {
  const UploadArticleContent({
    super.key,
  });

  @override
  State<UploadArticleContent> createState() => _UploadArticleContentState();
}

class _UploadArticleContentState extends State<UploadArticleContent> {
  FilePickerResult? result;

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
        SizedBox(
          height: blocHeight * 25,
          child: DottedBorder(
            borderType: BorderType.RRect,
            color: kGreenColor,
            strokeWidth: 3,
            padding: EdgeInsets.zero,
            dashPattern: const [8, 4],
            radius: const Radius.circular(10),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (result == null)
                    Column(
                      children: [
                        Icon(
                          Icons.cloud_upload_rounded,
                          color: Colors.black.withOpacity(.5),
                        ),
                        Text(
                          'Drag and Drop your file here',
                          style: Styles.textStyle16Inter.copyWith(
                            color: Colors.black.withOpacity(.5),
                          ),
                        ),
                        SizedBox(
                          height: blocHeight * 1,
                        ),
                        Text(
                          'Files supported Pdf, doc, jpg',
                          style: Styles.textStyle16Inter.copyWith(
                            color: Colors.black.withOpacity(.5),
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  if (result != null && result!.files.isNotEmpty)
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: blocWidth * 2),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ListView.separated(
                            shrinkWrap: true,
                            itemCount: result?.files.length ?? 0,
                            itemBuilder: (context, index) {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    result?.files[index].name ?? '',
                                    style: Styles.textStyle16Inter,
                                  ),
                                  IconButton(
                                    icon: const Icon(
                                      Icons.remove_circle_outline_rounded,
                                      color: Colors.red,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        result!.files.removeAt(index);
                                        if (result!.files.isEmpty) {
                                          result = null;
                                        }
                                      });
                                    },
                                  ),
                                ],
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return SizedBox(
                                height: blocHeight * 2,
                              );
                            },
                          )
                        ],
                      ),
                    ),
                  CustomButton(
                    onPressed: () async {
                      result = await FilePicker.platform
                          .pickFiles(allowMultiple: true);
                      if (result == null) {
                        print("No file selected");
                      } else {
                        setState(() {});
                        for (var element in result!.files) {
                          print(element.name);
                        }
                      }
                    },
                    decoration: BoxDecoration(
                      color: const Color(0xff7f53ac5f),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    height: 45,
                    width: 150,
                    text: 'Choose File',
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
