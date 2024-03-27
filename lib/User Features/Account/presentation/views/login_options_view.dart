import 'package:flutter/material.dart';
import 'package:ghosn_app/User%20Features/Account/presentation/views/change_pass.dart';
import 'package:ghosn_app/User%20Features/Account/presentation/views/widgets/login_options_body.dart';
import 'package:provider/provider.dart';

import '../../data/repo/auth_login_options_control.dart';

class LoginOptionsView extends StatelessWidget {
  const LoginOptionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthController(),
        ),
      ],
      child: Scaffold(
              body: Consumer<AuthController>(
                builder: (context, model, child) {
                if (model.userDetailsModel != null) {
                  return const ChangePassword();
                } else {
                  return const SafeArea(
                    child: LoginOptionsBody(),
                  );
                }
              }),
      
        
      ),
    );
  }
}
