import 'package:flutter/material.dart';
import 'package:ghosn_app/core/utils/Api_Key.dart';

class NetworkHandler {
  String formatter(String url) {
    return ApiKeys.BASE_URL + url;
  }

  NetworkImage getImage(String imageName) {
    String url = formatter('/$imageName');
    return NetworkImage(url);
  }
}
