import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart';

import '../display_detect_img.dart';

class CameraBody extends StatefulWidget {
  const CameraBody({
    super.key,
  });

  @override
  State<CameraBody> createState() => _CameraBodyState();
}

class _CameraBodyState extends State<CameraBody> {
  late CameraController _controller;
  Future<void>? _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    // Initialize camera
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    final firstCamera = cameras.first;

    _controller = CameraController(
      firstCamera,
      ResolutionPreset.medium,
    );

    _initializeControllerFuture = _controller.initialize();
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _takePicture() async {
    try {
      await _initializeControllerFuture;

      final path = join(
        (await getTemporaryDirectory()).path,
        '${DateTime.now()}.png',
      );

      XFile picture = await _controller.takePicture();
      await picture.saveTo(path);

      //  Navigate to the preview screen with the captured image
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => DisplayPictureScreen(imagePath: path),
      //   ),
      // );
    } catch (e) {
      print('Error taking picture: $e');
    }
  }

  Future<void> _chooseFromGallery() async {
    try {
      final imagePicker = ImagePicker();
      final XFile? image =
          await imagePicker.pickImage(source: ImageSource.gallery);

      if (image == null) return; // User canceled the operation

      final path = join(
        (await getTemporaryDirectory()).path,
        '${DateTime.now()}.png',
      );

      // Save the picture to the specified path
      await File(image.path).copy(path);

      // Navigate to the preview screen with the selected image
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DisplayPictureScreen(
                  imagePath: path,
                )),
      );
    } catch (e) {
      print('Error choosing image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    double blocHeight = (height / 100);
    double blocWidth = (width / 100);
    return Scaffold(
        body: Column(
      children: [
        Expanded(
          child: FutureBuilder<void>(
            future: _initializeControllerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return CameraPreview(_controller);
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
        Container(
          height: height * .20,
          color: Colors.white,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: blocWidth * 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: _chooseFromGallery,
                      icon: const Icon(
                        Icons.photo_library_outlined,
                        color: Colors.green,
                        size: 35,
                      ),
                    ),
                    IconButton(
                      onPressed: _takePicture,
                      icon: const Icon(
                        Icons.camera,
                        color: Colors.green,
                        size: 70,
                      ),
                    ),
                    IconButton(
                      onPressed: () async {
                        if (_controller.value.isInitialized) {
                          // Toggle flash mode
                          final bool isFlashOn =
                              _controller.value.flashMode == FlashMode.torch;
                          await _controller.setFlashMode(
                              isFlashOn ? FlashMode.off : FlashMode.torch);
                          setState(() {}); // Update UI
                        }
                      },
                      icon: const Icon(
                        Icons.flash_on,
                        color: Colors.green,
                        size: 35,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
