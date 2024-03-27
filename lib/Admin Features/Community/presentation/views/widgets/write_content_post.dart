import 'package:flutter/material.dart';

import '../../../../../core/utils/assets_data.dart';
import '../../../../../core/utils/style.dart';
import '../../../../../core/widgets/custom_text_field.dart';

class WritePostContent extends StatelessWidget {
  const WritePostContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double blockHeight = (height / 100);
    double width = MediaQuery.of(context).size.width;
    double blockWidth = (width / 100);
    return Column(
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 20,
              child: Image.asset(
                AssetsData.imageTest2,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: blockWidth * 4,
            ),
            const Text(
              'UserName',
              style: Styles.textStyle16Inter,
            ),
          ],
        ),
        SizedBox(
          height: blockHeight * 3,
        ),
        CustomTextField(
          hintText: 'What\'s on your Mind?',
          width: 0,
          color: Colors.black,
          minLength: 6,
        ),
      ],
    );
  }
}
