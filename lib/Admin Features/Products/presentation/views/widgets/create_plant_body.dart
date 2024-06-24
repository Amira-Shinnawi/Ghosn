import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ghosn_app/core/utils/Api_Key.dart';
import 'package:ghosn_app/core/widgets/custom_button.dart';
import 'package:ghosn_app/translations/local_keys.g.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/style.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../../../../../core/widgets/show_snack_bar.dart';

class CreatePlantBody extends StatefulWidget {
  const CreatePlantBody({super.key});

  @override
  State<CreatePlantBody> createState() => _CreatePlantBodyState();
}

class _CreatePlantBodyState extends State<CreatePlantBody> {
  File? _image;
  final picker = ImagePicker();

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

  //create Plant and upload Image
  Future<void> createPlant({
    required int categoryId,
    required String humidity,
    required String plantName,
    required String soilType,
    required String plantDesc,
    required int quantity,
    required double price,
    required int amountofSunlight,
    required int amountofWater,
    required int minTemp,
    required int maxTemp,
    required double plantHeight,
    required File? image,
  }) async {
    var headers = {
      'Content-Type': 'multipart/form-data',
      'Authorization': 'Bearer $userToken'
    };
    try {
      String fileName = image!.path.split('/').last;

      var data = FormData.fromMap({
        "ImageFile": await MultipartFile.fromFile(
          image.path,
          filename: fileName,
        ),
        'AmountOfWater': amountofWater,
        'AmountSunlight': amountofSunlight,
        'CategoryId': categoryId,
        'Description': plantDesc,
        'Height': plantHeight,
        'Humdity': humidity,
        'MaxTemperature': maxTemp,
        'MinTemperature': minTemp,
        'Name': plantName,
        'Price': price,
        'Quantity': quantity,
        'SoilType': soilType,
      });

      var dio = Dio();
      var response = await dio.request(
        '${ApiKeys.BASE_URL}/api/Plant/CreatePlant',
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
        showSnackBar(context, 'This item already Added .');
        print(error.response?.statusMessage);
      } else {
        rethrow;
      }
    }
  }

  TextEditingController plantNameController = TextEditingController();
  TextEditingController plantDescController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController amountofWaterController = TextEditingController();
  TextEditingController amountofSunlightController = TextEditingController();
  TextEditingController humidityController = TextEditingController();
  TextEditingController minTempController = TextEditingController();
  TextEditingController maxTempController = TextEditingController();
  TextEditingController plantHeightController = TextEditingController();
  TextEditingController soilTypeController = TextEditingController();
  TextEditingController categoryIdController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double blockHeight = (height / 100);
    double width = MediaQuery.of(context).size.width;
    double blockWidth = (width / 100);

    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: blockWidth * 3, vertical: blockHeight * 2),
      child: Form(
        key: formKey,
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
                child: Column(
              children: [
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
                      ),
                SizedBox(
                  height: blockHeight * 2,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.image,
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
              ],
            )),
            SliverToBoxAdapter(
              child: SizedBox(
                height: blockHeight * 2,
              ),
            ),
            SliverToBoxAdapter(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  LocaleKeys.PlantDetails.tr(),
                  style: Styles.textStyle16Inter,
                ),
                SizedBox(
                  height: blockHeight * 1,
                ),
                CustomTextField(
                  showSuffixIcon: false,
                  hintText: LocaleKeys.PlantName.tr(),
                  labelText: LocaleKeys.PlantName.tr(),
                  controller: plantNameController,
                ),
                CustomTextField(
                  showSuffixIcon: false,
                  hintText: LocaleKeys.PlantDescription.tr(),
                  labelText: LocaleKeys.PlantDescription.tr(),
                  controller: plantDescController,
                  minLength: 4,
                ),
                CustomTextField(
                  showSuffixIcon: false,
                  hintText: LocaleKeys.Quantity.tr(),
                  labelText: LocaleKeys.Quantity.tr(),
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  controller: quantityController,
                ),
                CustomTextField(
                  showSuffixIcon: false,
                  hintText: LocaleKeys.Price.tr(),
                  labelText: LocaleKeys.Price.tr(),
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  controller: priceController,
                ),
                SizedBox(
                  height: blockHeight * 1,
                ),
                const Divider(),
                SizedBox(
                  height: blockHeight * 1,
                ),
                Text(
                  LocaleKeys.PlantProperties.tr(),
                  style: Styles.textStyle16Inter,
                ),
                SizedBox(
                  height: blockHeight * 1,
                ),
                CustomTextField(
                  showSuffixIcon: false,
                  hintText: LocaleKeys.AmountWater.tr(),
                  labelText: LocaleKeys.AmountWater.tr(),
                  controller: amountofWaterController,
                  prefixIcon: const Icon(
                    Icons.water_drop_outlined,
                    size: 20,
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
                CustomTextField(
                  showSuffixIcon: false,
                  hintText: LocaleKeys.AmountSunlight.tr(),
                  labelText: LocaleKeys.AmountSunlight.tr(),
                  controller: amountofSunlightController,
                  prefixIcon: const Icon(
                    Icons.wb_sunny_outlined,
                    size: 20,
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
                CustomTextField(
                  showSuffixIcon: false,
                  hintText: LocaleKeys.Humidity.tr(),
                  labelText: LocaleKeys.Humidity.tr(),
                  controller: humidityController,
                  prefixIcon: const Icon(
                    Icons.opacity_outlined,
                    size: 20,
                  ),
                ),
                CustomTextField(
                  showSuffixIcon: false,
                  hintText: LocaleKeys.MinTemperature.tr(),
                  labelText: LocaleKeys.MinTemperature.tr(),
                  controller: minTempController,
                  prefixIcon: const Icon(
                    FontAwesomeIcons.temperatureLow,
                    size: 20,
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
                CustomTextField(
                  showSuffixIcon: false,
                  hintText: LocaleKeys.MaxTemperature.tr(),
                  labelText: LocaleKeys.MaxTemperature.tr(),
                  controller: maxTempController,
                  prefixIcon: const Icon(
                    FontAwesomeIcons.temperatureHigh,
                    size: 20,
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
                CustomTextField(
                  showSuffixIcon: false,
                  hintText: LocaleKeys.Height.tr(),
                  labelText: LocaleKeys.Height.tr(),
                  controller: plantHeightController,
                  prefixIcon: const Icon(
                    Icons.height_outlined,
                    size: 20,
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
                CustomTextField(
                  showSuffixIcon: false,
                  hintText: LocaleKeys.SoilType.tr(),
                  labelText: LocaleKeys.SoilType.tr(),
                  controller: soilTypeController,
                ),
                CustomTextField(
                  showSuffixIcon: false,
                  hintText: LocaleKeys.CategoryID.tr(),
                  labelText: LocaleKeys.CategoryID.tr(),
                  controller: categoryIdController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
              ],
            )),
            SliverToBoxAdapter(
                child: CustomButton(
                    height: blockHeight * 5,
                    text: LocaleKeys.Save.tr(),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return SimpleDialog(
                                backgroundColor: Colors.white,
                                title: Text(
                                  LocaleKeys.AreYouSureYouwanttoSave.tr(),
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
                                      LocaleKeys.Save.tr(),
                                      style: Styles.textStyle18Inter.copyWith(
                                        color: kGreenColor,
                                      ),
                                    ),
                                    onPressed: () {
                                      createPlant(
                                        categoryId: int.parse(
                                            categoryIdController.text),
                                        humidity: humidityController.text,
                                        plantName: plantNameController.text,
                                        soilType: soilTypeController.text,
                                        plantDesc: plantDescController.text,
                                        quantity:
                                            int.parse(quantityController.text),
                                        price:
                                            double.parse(priceController.text),
                                        amountofSunlight: int.parse(
                                            amountofSunlightController.text),
                                        amountofWater: int.parse(
                                            amountofWaterController.text),
                                        minTemp:
                                            int.parse(minTempController.text),
                                        maxTemp:
                                            int.parse(maxTempController.text),
                                        plantHeight: double.parse(
                                            plantHeightController.text),
                                        image: _image!,
                                      );
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
                      }
                    })),
          ],
        ),
      ),
    );
  }
}
