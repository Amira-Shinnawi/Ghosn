import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../core/utils/functions/shared_pref_cache.dart';
import '../model/user_details_model.dart';

class AuthController with ChangeNotifier {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FacebookAuth _facebookAuth = FacebookAuth.instance;

  GoogleSignInAccount? _googleSignInAccount;
  UserDetailsModel? _userDetailsModel;

  GoogleSignInAccount? get googleSignInAccount => _googleSignInAccount;
  UserDetailsModel? get userDetailsModel => _userDetailsModel;

  Future<void> allowUserToLoginGoogle() async {
    _googleSignInAccount = await _googleSignIn.signIn();
    if (_googleSignInAccount != null) {
      final accessToken = await _googleSignInAccount!.authentication;

      if (_googleSignInAccount != null) {
        _userDetailsModel = UserDetailsModel(
          displayName: _googleSignInAccount!.displayName,
          email: _googleSignInAccount!.email,
          photoURL: _googleSignInAccount!.photoUrl,
          token: accessToken.accessToken,
        );
      }
      log(accessToken.accessToken!);
      await SharedPrefCache.insertToCache(
        key: 'accessToken',
        value: accessToken.accessToken!,
      );
      notifyListeners();
    } else {
      return null;
    }
  }

  Future<void> allowUserToLogOutGoogle() async {
    await _googleSignIn.signOut();
    _googleSignInAccount = null;
    _userDetailsModel = null;
    notifyListeners();
  }

  Future<void> allowUserToLogInFacebook() async {
    var result = await _facebookAuth.login(
      permissions: ['public_profile', 'email'],
    );
    AccessToken? accessToken = result.accessToken;
    if (accessToken != null) {
      String token = accessToken.token;

      if (result.status == LoginStatus.success) {
        final requestData = await _facebookAuth.getUserData(
          fields: 'email,name,picture.type(large),id',
        );

        _userDetailsModel = UserDetailsModel(
          displayName: requestData['name'],
          email: requestData['email'],
          photoURL: requestData['picture']['data']['url'] ?? '',
          token: token,
        );
        log(token);
        await SharedPrefCache.insertToCache(
          key: 'accessToken',
          value: token,
        );
        notifyListeners();
      } else {
        return null;
      }
    }
  }

  Future<void> allowUserToLogOutFacebook() async {
    await _facebookAuth.logOut();
    _userDetailsModel = null;
    notifyListeners();
  }
}
