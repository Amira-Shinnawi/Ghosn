import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_elvated_button.dart';

class AddCart extends StatefulWidget {
  const AddCart({
    super.key,
    required this.onPressed,
    required this.children,
  });
  final void Function() onPressed;
  final List<Widget> children;
  @override
  State<AddCart> createState() => _AddCartState();
}

class _AddCartState extends State<AddCart> {
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
          Expanded(
            child: CustomElevatedButton(
              padding: const EdgeInsets.all(10),
              onPressed: widget.onPressed,
              buttonName: 'Add Cart',
            ),
          ),
          Row(
            children: widget.children,
          ),
        ],
      ),
    );
  }
}
