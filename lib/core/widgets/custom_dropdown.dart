// import 'package:flutter/material.dart';
// import 'package:ghosn_app/core/utils/style.dart';

// class CustomDropdown extends StatefulWidget {
//   final Widget child;
//   final String labelText;
//     final FormFieldValidator<String>? validator;

//   CustomDropdown({required this.child,required this.labelText, this.validator, required String value, required List<DropdownMenuItem<String>> items, required Null Function(String? value) onChanged});

//   @override
//   _CustomDropdownState createState() => _CustomDropdownState();
// }

// class _CustomDropdownState extends State<CustomDropdown> {
//   bool isOpen = false;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.stretch,

//        children: [
//         Text(
//           widget.labelText,
//           style:Styles.textStyle16Inter,),
//          const SizedBox(height: 8),
//         GestureDetector(
//           onTap: () {
//             setState(() {
//               isOpen = !isOpen;
//             });
//           },

//           child: Container(
//             height: 57,

//             decoration: BoxDecoration(
//         color: Colors.white,
//          border: Border.all(color: const Color.fromARGB(255, 0, 0, 0),width: 2.5),
//         borderRadius: BorderRadius.circular(30),

//       ),

//             padding: EdgeInsets.symmetric(vertical: 13, horizontal: 12),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text('Select', style:TextStyle(fontWeight:FontWeight.w500) ,),
//                 Icon(Icons.arrow_drop_down),
//               ],
//             ),
//           ),
//         ),
//         if (isOpen)
//           Container(
//             padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),

//             child: widget.child,
//           ),

//       ],
//     );
//   }
//
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ghosn_app/core/utils/style.dart';
import 'package:ghosn_app/translations/local_keys.g.dart';

class CustomDropdown extends StatefulWidget {
  final Widget child;
  final String labelText;
  final TextEditingController? controller;
  const CustomDropdown({
    super.key,
    required this.child,
    required this.labelText,
    this.controller,
    required String value,
    required List items,
    required Null Function(String? value) onChanged,
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
        GestureDetector(
          onTap: () {
            setState(() {
              isOpen = !isOpen;
            });
          },
          child: Container(
            height: 58,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: Colors.black),
            ),
            padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(LocaleKeys.select.tr()),
                const Icon(Icons.arrow_drop_down),
              ],
            ),
          ),
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
