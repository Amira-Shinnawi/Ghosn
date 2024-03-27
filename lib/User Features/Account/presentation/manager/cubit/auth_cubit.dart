import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../../../../../core/utils/functions/shared_pref_cache.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  final _baseURL = 'https://9838mzjl-7268.uks1.devtunnels.ms/api/Auth';

  Future<void> registerUser({
    required String firstName,
    required String lastName,
    required String email,
    required String userName,
    required String password,
    required String phoneNumber,
    required bool maleGender,
    required int city,
    required String state,
    required DateTime dateOfBirth,
  }) async {
    emit(RegisterLoadingState());
    String formattedDateOfBirth = DateFormat('yyyy-MM-dd').format(dateOfBirth);
    String body = json.encode({
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'maleGender': maleGender,
      'password': password,
      'userName': userName,
      'phoneNumber': phoneNumber,
      'cityId': city,
      'street': state,
      'dateOfBirth': formattedDateOfBirth,
    });
    Response response = await http.post(
      Uri.parse(
        '$_baseURL/register',
      ),
      headers: {
        "Content-Type": "application/json",
      },
      body: body,
    );

    var responseBody = jsonDecode(response.body);

    if (responseBody['successfulOperation'] == true) {
      print(responseBody);
      emit(RegisterSuccessState());
    } else {
      print(responseBody);
      //responseBody['errorMessages']
      emit(RegisterFailureState(
          errorMessage:
              'This account has already Registered Please Try Again Later'));
    }
  }

  Future<void> loginUser(
      {required String userName, required String password}) async {
    emit(LoginLoadingState());
    String body = json.encode({
      'UserName': userName,
      'Password': password,
    });
    try {
      Response response = await http.post(
        Uri.parse(
          '$_baseURL/login',
        ),
        headers: {
          "Content-Type": "application/json",
        },
        body: body,
      );
      var responseBody = jsonDecode(response.body);

      if (response.statusCode == 200) {
        if (responseBody['successfulOperation'] == true) {
          print(responseBody);
          await SharedPrefCache.insertToCache(
              key: 'token', value: responseBody['accessToken']);
          log(responseBody['accessToken']);
          emit(LoginSuccessState());
        } else {
          emit(LoginFailureState(
              errorMessage:
                  'Login Failed Please Try Again or Registered:${responseBody['errors']}'));
        }
      } else {
        emit(
          LoginFailureState(
              errorMessage: '${responseBody['errors']} Please Try Again'),
        );
      }
    } catch (error) {
      emit(
        LoginFailureState(errorMessage: error.toString()),
      );
      print(error.toString());
    }
  }
}
