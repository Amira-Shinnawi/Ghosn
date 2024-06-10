import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ghosn_app/User%20Features/detection/presentation/views/detect_result.dart';
import 'package:ghosn_app/core/utils/Api_Key.dart';
import 'package:ghosn_app/core/widgets/custom_button.dart';
import 'package:ghosn_app/core/widgets/show_snack_bar.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

import '../../../../../constants.dart';
import '../../../data/model/plant_disease_model.dart';

PlantData? plantDataModel;

class DisplayPictureScreenBody extends StatefulWidget {
  const DisplayPictureScreenBody({
    super.key,
    required this.imagePath,
  });
  final String imagePath;

  @override
  State<DisplayPictureScreenBody> createState() =>
      _DisplayPictureScreenBodyState();
}

class _DisplayPictureScreenBodyState extends State<DisplayPictureScreenBody> {
  Future<PlantData?> detectPlant(XFile imageFile) async {
    var headers = {
      'Content-Type': 'multipart/form-data',
      'Authorization': 'Bearer $userToken'
    };
    var request = http.MultipartRequest(
        'POST', Uri.parse('${ApiKeys.BASE_URL}/api/ML/disease/predict'));
    request.files
        .add(await http.MultipartFile.fromPath('imgFile', imageFile.path));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final responseString = await response.stream.bytesToString();
      final Map<String, dynamic> responseData = json.decode(responseString);
      return PlantData.fromJson(responseData);
    } else {
      print(response.reasonPhrase);
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    double blocHeight = (height / 100);
    double blocWidth = (width / 100);
    return Padding(
      padding: EdgeInsets.only(left: blocHeight * 3, right: blocHeight * 3),
      child: SingleChildScrollView(
        child: Column(
          children: [
            AspectRatio(
                aspectRatio: 2 / 3.3,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image(
                    image: FileImage(File(widget.imagePath)),
                    fit: BoxFit.cover,
                  ),
                )),
            SizedBox(height: height * .1),
            // CustomButton(
            //   text: "Identify the plant",
            //   width: 265,
            //   height: 50,
            //   onPressed: () {
            //     // Navigator.push(
            //     //   context,
            //     //   MaterialPageRoute(
            //     //     builder: (context) => const DetectResult(),
            //     //   ),
            //     // );
            //   },
            // ),
            CustomButton(
              text: "Identify plants disease ",
              width: 265,
              height: 50,
              onPressed: () async {
                showDialog(
                  context: context,
                  builder: (context) {
                    return const Center(
                        child: CircularProgressIndicator(
                      color: kGreenColor,
                      backgroundColor: Colors.blueGrey,
                    ));
                  },
                  barrierDismissible: false,
                );

                plantDataModel = await detectPlant(XFile(widget.imagePath));

                if (plantDataModel != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetectResult(
                        plantDataModel: plantDataModel!,
                      ),
                    ),
                  );
                } else {
                  showSnackBar(context, 'Failed to Detect Diseases ');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
