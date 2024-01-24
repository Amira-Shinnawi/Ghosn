import 'package:flutter/material.dart';
import 'package:ghosn_app/Features/Account/presentation/views/widgets/login_options_body.dart';

class LoginOptionsView extends StatelessWidget {
  const LoginOptionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: LoginOptionsBody()),
    );
  }
}
