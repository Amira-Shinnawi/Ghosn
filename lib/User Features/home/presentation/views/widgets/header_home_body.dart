import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/assets_data.dart';

class HeaderWithSearchField extends StatelessWidget {
  const HeaderWithSearchField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double blockHeight = (height / 100);
    double width = MediaQuery.of(context).size.width;
    double blockWidth = (width / 100);
    return Container(
      margin: EdgeInsets.only(bottom: blockHeight * 2),
      height: blockHeight * 15,
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              left: blockWidth * 5,
              right: blockWidth * 5,
              bottom: blockHeight * 7,
            ),
            height: blockHeight * 13,
            decoration: const BoxDecoration(
              color: kGreenColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(36),
                bottomRight: Radius.circular(36),
              ),
            ),
            child: Row(
              children: <Widget>[
                Text(
                  'Hi there!',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Image.asset(
                  AssetsData.logoMenu,
                  fit: BoxFit.fill,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: blockWidth * 5),
              padding: EdgeInsets.symmetric(horizontal: blockWidth * 5),
              height: blockHeight * 6,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 10),
                    blurRadius: 50,
                    color: kGreenColor.withOpacity(0.23),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      onChanged: (value) => {},
                      decoration: InputDecoration(
                        hintText: "Search",
                        hintStyle: TextStyle(
                          color: kGreenColor.withOpacity(0.5),
                        ),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                  ),
                  const Icon(
                    FontAwesomeIcons.magnifyingGlass,
                    color: kGreenColor,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
