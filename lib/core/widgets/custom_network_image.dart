import 'package:flutter/material.dart';

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage({
    super.key,
    required this.imageUrl,
    required this.aspectRatio,
    this.fit,
  });

  final double aspectRatio;
  final BoxFit? fit;
  final ImageProvider<Object> imageUrl;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: aspectRatio,
        child: Image(
          image: imageUrl,
          errorBuilder: (context, error, stackTrace) {
            return Image.network('https://www.mashtalegypt.com/media/IMG_5980.jpeg');
          },
          fit: fit ?? BoxFit.cover,
        ));
  }
}
