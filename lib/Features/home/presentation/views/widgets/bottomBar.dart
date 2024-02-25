import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class bottomBar extends StatelessWidget {
  bottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      height: 50,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 50,
            child: IconButton(
              onPressed: () {},
              icon: FaIcon(FontAwesomeIcons.house),
            ),
          ),
          Spacer(),
          SizedBox(
            width: 50,
            child: IconButton(
              onPressed: () {},
              icon: FaIcon(FontAwesomeIcons.users),
            ),
          ),
          Spacer(),
          SizedBox(
            width: 50,
            child: IconButton(
              onPressed: () {},
              icon: FaIcon(FontAwesomeIcons.qrcode),
            ),
          ),
          Spacer(),
          SizedBox(
            width: 50,
            child: IconButton(
              onPressed: () {},
              icon: FaIcon(Icons.favorite),
            ),
          ),
          Spacer(),
          SizedBox(
            width: 50,
            child: IconButton(
              onPressed: () {},
              icon: FaIcon(FontAwesomeIcons.user),
            ),
          ),
        ],
      ),
    );
  }
}
