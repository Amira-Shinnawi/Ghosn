import 'package:flutter/material.dart';

import 'widgets/detect_result_body.dart';



class DetectResult extends StatelessWidget {
  const DetectResult({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Silver snake plant"),),
      body: const DetectResultBody(),

    );
  }
}