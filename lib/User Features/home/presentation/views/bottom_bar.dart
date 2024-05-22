import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ghosn_app/Admin%20Features/Community/presentation/views/community_home.dart';
import 'package:ghosn_app/User%20Features/Reminder/presentation/views/reminder_main.dart';

import '../../../Account/presentation/views/profile_view.dart';
import '../../../detection/presentation/views/tips_page.dart';
import 'favorite_home.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;
  List<Widget> screens = [
    const ProfileView(),
    const CommunityHome(),
    const Tips(),
    const ReminderMain(),
    const ProfileView(),
  ];
  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.house),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.users),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(Icons.qr_code_scanner_rounded),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(
              Icons.edit_calendar_rounded,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.circleUser,
            ),
            label: '',
          ),
          // Add more items as needed
        ],
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        onTap: _onItemTap,

        // Add additional properties here
      ),
      body: screens.elementAt(_selectedIndex),
    );
  }
}
