import 'package:flutter/material.dart';

class CustomNotification extends StatelessWidget {
  const CustomNotification({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.notifications,
            color: Colors.white,
          ),
        ),
        const Positioned(
          top: 10,
          left: 12,
          right: 0,
          child: CircleAvatar(
            radius: 5,
            backgroundColor: Colors.red,
          ),
        ),
      ],
    );
  }
}
