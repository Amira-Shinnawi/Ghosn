import 'package:flutter/material.dart';
import 'package:ghosn_app/Admin%20Features/Products/presentation/views/widgets/create_plant_body.dart';
import 'package:ghosn_app/core/widgets/custom_appbar.dart';

class CreatePlantView extends StatelessWidget {
  const CreatePlantView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 20,
          ),
        ),
      ),
      body: const SafeArea(
        child: CreatePlantBody(),
      ),
    );
  }
}
