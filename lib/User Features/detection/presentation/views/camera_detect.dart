import 'package:flutter/material.dart';

import 'widgets/camera_detect_body.dart';

class Camera extends StatelessWidget {
  const Camera({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: CameraBody());
  }
}
