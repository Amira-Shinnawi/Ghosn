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

  final _baseURL = 'http://10.0.2.2:5000/api/Auth';

  Future<void> registerUser(
      {required String userName,
      required String email,
      required String password}) async {
    emit(RegisterLoadingState());

    Response response = await http.post(
      Uri.parse(
        '$_baseURL/Register',
      ),
      // headers: {
      //   'lang':'en',
      // },
      body: {
        'UserName': userName,
        'Password': password,
        'Email': email,
      },
    );

    var responseBody = jsonDecode(response.body);

    if (responseBody['isSuccess'] == true) {
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

    try {
      Response response = await http.post(
        Uri.parse(
          '$_baseURL/Login',
        ),
        // headers: {
        //   'lang':'en',
        // },
        body: {
          'UserName': userName,
          'Password': password,
        },
      );
      var responseBody = jsonDecode(response.body);

      if (response.statusCode == 200) {
        if (responseBody['isSuccess'] == true) {
          print(responseBody);
          await SharedPrefCache.insertToCache(
              key: 'token', value: responseBody['result']['token']);
          log(responseBody['result']['token']);
          emit(LoginSuccessState());
        } else {
          //responseBody['errorMessages']

          emit(LoginFailureState(
              errorMessage:
                  'Login Failed Please Try Again or Registered:${responseBody['errorMessages']}'));
        }
      } else {
        emit(
          LoginFailureState(
              errorMessage:
                  '${responseBody['errorMessages']} Please Try Again'),
        );
      }
    } catch (error) {
      emit(
        LoginFailureState(errorMessage: error.toString()),
      );
    }
  }
}
