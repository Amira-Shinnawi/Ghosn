// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> ar = {
  "getStarted": "بدأ الاستخدام",
  "title": "مدخلك لعالم النبات",
  "useEmailOrPhone": "الدخول باستخدام حسابي",
  "continueWithFacebook": "تسجبل الدخول باستخدام",
  "continueWithGoogle": "تسجبل الدخول باستخدام",
  "alreadyhaveaccount": " هل لديك حساب؟ ",
  "Signup": "إنشاء حساب الآن",
  "signInYourAccount": "الدخول باستخدام حسابي",
  "Email": "البريد إلكتروني",
  "Password": "كلمة المرور",
  "LOGIN": "تسجيل الدخول",
  "forgotPassword": "هل نسيت كلمة المرور؟",
  "createAccount": "إنشاء حساب",
  "confirmpassword": "تأكيد كلمة المرور",
  "phone": "رقم الهاتف",
  "appPolicy": "الموافقة علي سياسة التطبيق",
  "changepassword": "تغيير كلمة المرور",
  "newPassword": "ادخل كلمة المرور الجديدة"
};
static const Map<String,dynamic> en = {
  "getStarted": "Get Started",
  "title": "Welcome To Palnta World",
  "appbartitle": "Language App",
  "useEmailOrPhone": "I'll use email or phone",
  "continueWithFacebook": "Continue with Facebook",
  "continueWithGoogle": "Continue with Google",
  "alreadyhaveaccount": "Already have an account? ",
  "Signup": "Signup",
  "signInYourAccount": "SIGN IN TO YOUR ACCOUNT",
  "Email": "Email",
  "Password": "Password",
  "LOGIN": "LOGIN",
  "forgotPassword": "Forgot Your Password?",
  "createAccount": "CREATE AN ACCOUNT",
  "confirmpassword": "Confirm Password",
  "phone": "Phone",
  "appPolicy": "I agree to the terms and conditions",
  "changepassword": "Change Password",
  "newPassword": " Enter your New Password"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"ar": ar, "en": en};
}
