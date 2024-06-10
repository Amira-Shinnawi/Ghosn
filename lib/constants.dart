import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

const kGreenColor = Color(0xff53AC5F);
const kLightGreenColor = Color(0xffEBF8E2);
const bgColor = Color(0xffF9FAFC);
const kWhiteColor = Colors.white;
const kInter = 'Inter';
const kItim = 'Itim';
const kArefRuqaa = 'ArefRuqaa';
const kHintColor = Colors.grey;
const kGreyColor = Color(0xff6A6A6A);
String? userToken;
String? tokenFacebookOrGoogle;
String? firstName;
String? lastName;
String? email;
String? userName;
String? birthDate;
String? location;
String? work;
String? link;

String? profileImage;
XFile? imageFile;

String? totalPrice;
const String PREF_KEY_CATEGORY = 'selected_category';
const String PREF_KEY_PRICE = 'selected_price';
const String PREF_KEY_SOIL_TYPE = 'selected_soil_type';
