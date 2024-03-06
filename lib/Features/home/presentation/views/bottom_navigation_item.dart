import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ghosn_app/Features/Account/presentation/views/profile_view.dart';
import 'package:ghosn_app/Features/home/presentation/views/chart.dart';
import 'package:ghosn_app/Features/home/presentation/views/home.dart';
import 'package:ghosn_app/Features/home/presentation/views/product_details_home.dart';
import 'package:ghosn_app/constants.dart';

class BottomNavigationItem extends StatefulWidget {
  const BottomNavigationItem({
    super.key,
  });

  @override
  State<BottomNavigationItem> createState() => _BottomNavigationItemState();
}

class _BottomNavigationItemState extends State<BottomNavigationItem> {
  int currentIndex = 0;

  List<Widget> screens = [
    HomePage(),
    const ProductDetailsHome(),
    const Chart(),
    const ProfileView(),
    const ProductDetailsHome(),
  ];

  void _onItemTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: BottomNavigationBar(
            unselectedItemColor: Colors.black,
            selectedItemColor: kGreenColor,
            currentIndex: currentIndex,
            type: BottomNavigationBarType.shifting,
            onTap: _onItemTap,
            items: const [
              BottomNavigationBarItem(
                label: 'Home',
                icon: Icon(
                  Icons.home_rounded,
                  size: 35,
                ),
                backgroundColor: Color(0xFFE7E7E7),
              ),
              BottomNavigationBarItem(
                label: 'Search',
                icon: Icon(
                  FontAwesomeIcons.heart,
                  size: 30,
                ),
                backgroundColor: Color(0xFFE7E7E7),
              ),
              BottomNavigationBarItem(
                label: 'Cart',
                icon: Icon(
                  Icons.qr_code_scanner_rounded,
                  size: 35,
                ),
                backgroundColor: Color(0xFFE7E7E7),
              ),
              BottomNavigationBarItem(
                label: 'Profile',
                icon: Icon(
                  FontAwesomeIcons.users,
                  size: 25,
                ),
                backgroundColor: Color(0xFFE7E7E7),
              ),
              BottomNavigationBarItem(
                label: 'Profile',
                icon: Icon(
                  FontAwesomeIcons.circleUser,
                  size: 30,
                ),
                backgroundColor: Color(0xFFE7E7E7),
              ),
            ]),
      ),
      body: screens.elementAt(currentIndex),
    );
  }
}
