import 'package:flutter/material.dart';
import 'package:ghosn_app/constants.dart';
import 'package:ghosn_app/core/utils/style.dart';

class AddCart extends StatefulWidget {
  const AddCart({
    super.key,
  });

  @override
  State<AddCart> createState() => _AddCartState();
}

class _AddCartState extends State<AddCart> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: width * .03, vertical: height * .01),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                kGreenColor,
              ),
            ),
            child: Text(
              'Add To Cart',
              style: Styles.textStyle20Inter.copyWith(
                color: Colors.white,
              ),
            ),
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    count++;
                  });
                },
                icon: const Icon(
                  Icons.add,
                  size: 30,
                  color: Colors.black,
                ),
              ),
              Text(
                '$count',
                style: Styles.textStyle20Inter,
              ),
              IconButton(
                onPressed: () {
                  if (count > 0) {
                    setState(() {
                      count--;
                    });
                  }
                },
                icon: const Icon(
                  Icons.remove,
                  size: 30,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
