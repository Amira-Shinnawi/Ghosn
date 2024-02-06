import 'package:flutter/material.dart';
import 'package:ghosn_app/core/utils/style.dart';
import 'package:ghosn_app/core/widgets/custom_text_field.dart';

class CustomDropdown extends StatefulWidget {
  final Widget child;
  final String labelText;
  final TextEditingController? controller;
  const CustomDropdown({
    super.key,
    required this.child,
    required this.labelText,
    this.controller,
  });

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  bool isOpen = false;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.labelText,
          style: Styles.textStyle20Inter.copyWith(
            fontSize: 18,
          ),
        ),
        SizedBox(height: height * .008),
        CustomTextFelid(
          hinText: 'Address',
          width: 1,
          color: Colors.black,
          onTap: () {
            setState(() {
              isOpen = !isOpen;
            });
          },
          suffixIcon: const Icon(Icons.arrow_drop_down),
          readOnly: true,
          controller: widget.controller,
        ),
        if (isOpen)
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            child: widget.child,
          ),
      ],
    );
  }
}
