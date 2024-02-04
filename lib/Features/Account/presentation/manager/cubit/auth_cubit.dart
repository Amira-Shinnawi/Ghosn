import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:ghosn_app/core/utils/functions/shared_pref_cache.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  final dio = Dio();
  final _baseURL = 'http://10.0.2.2:5000/api/Auth';

  Future<void> registerUser({
    required String userName,
    required String email,
    required String password,
  }) async {
    emit(RegisterLoadingState());

    try {
      final response = await dio.post(
        '$_baseURL/Register',
        data: {
          'UserName': userName,
          'Password': password,
          'Email': email,
        },
        options: Options(
          headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
            'Accept': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200) {
        final responseBody = response.data;
        if (responseBody['isSuccess'] == true) {
          log('User Registration Success ');
          emit(RegisterSuccessState());
        } else {
          debugPrint(
              'User Failed Registration and the error message is: ${responseBody['errorMessages']}');
          emit(RegisterFailureState(
              errorMessage: responseBody['errorMessages']));
        }
      }
    } catch (error) {
      print('Error : $error');
      emit(RegisterFailureState(errorMessage: error.toString()));
    }
  }

  Future<void> loginUser({
    required String userName,
    required String password,
  }) async {
    emit(LoginLoadingState());

    try {
      final response = await dio.post(
        '$_baseURL/Login',
        data: {
          'UserName': userName,
          'Password': password,
        },
        options: Options(
          headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
            'Accept': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200) {
        final responseBody = response.data;

        if (responseBody['isSuccess'] == true) {
          log('User Login Success and his Data is: $responseBody');

          await SharedPrefCache.insertToCache(
              key: 'token', value: responseBody['result']['token']);

          emit(LoginSuccessState());
        } else {
          print(
              'User Failed Login and his Data is: ${responseBody['errorMessages']}');
          emit(LoginFailureState(errorMessage: responseBody['errorMessages']));
        }
      }
    } catch (error) {
      print('Other error: $error');
      emit(LoginFailureState(errorMessage: error.toString()));
    }
  }
}
