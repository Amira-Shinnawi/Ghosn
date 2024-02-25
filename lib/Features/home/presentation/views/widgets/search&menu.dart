import 'package:flutter/material.dart';

class searchPmenu extends StatelessWidget {
  searchPmenu({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: .7 * width,
          height: 50,
          decoration: BoxDecoration(
              color: Color(0xffFAF6F6),
              boxShadow: [
                BoxShadow(
                    blurRadius: 4, color: Colors.black12, offset: Offset(0, 4))
              ],
              borderRadius: BorderRadius.circular(30)),
          child: const TextField(
            decoration: InputDecoration(
              hintText: 'search',
              hintStyle: TextStyle(color: Colors.grey),
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              prefixIcon: Icon(
                Icons.search,
                color: Colors.black,
              ),
            ),
          ),
        ),
        Container(
          width: .25 * width,
          height: 50,
          decoration: BoxDecoration(
              color: Color(0xffFAF6F6),
              boxShadow: [
                BoxShadow(
                    blurRadius: 4, color: Colors.black12, offset: Offset(0, 4))
              ],
              borderRadius: BorderRadius.circular(10)),
          child: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
        )
      ],
    );
  }
}
