import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../../../../../core/utils/functions/shared_pref_cache.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  final _baseURL = 'https://qs2d9q4n-7268.uks1.devtunnels.ms/api/Auth';

  Future<void> registerUser({
    required String firstName,
    required String lastName,
    required String email,
    required String userName,
    required String password,
  }) async {
    emit(RegisterLoadingState());
    String body = json.encode({
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'password': password,
      'userName': userName,
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
      await SharedPrefCache.insertToCache(
          key: 'token', value: responseBody['accessToken']);
      log(responseBody['accessToken']);
      emit(RegisterSuccessState());
    } else {
      print(responseBody);
      //responseBody['errorMessages']
      emit(RegisterFailureState(
          errorMessage: '${responseBody['errors']}, Please Try Again Later'));
    }
  }

  Future<void> loginUser(
      {required String userName, required String password}) async {
    emit(LoginLoadingState());
    String body = json.encode({
      'userName': userName,
      'password': password,
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
