import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class bottomBar extends StatefulWidget {
  bottomBar({super.key});

  @override
  State<bottomBar> createState() => _bottomBarState();
}

class _bottomBarState extends State<bottomBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.house),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.users),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(AssetImage("assets/scan-1024.webp"), size: 35),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(AssetImage("assets/carbon_reminder.png"), size: 35),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.user),
          label: '',
        ),
        // Add more items as needed
      ],
      selectedItemColor: Colors.green,
      unselectedItemColor: Colors.grey,
      currentIndex: _selectedIndex,
      onTap: (int index) {
        setState(() {
          _selectedIndex = index;
          // Update state or navigate to different screen based on index
        });
      },
      // Add additional properties here
    );
  }

  int _selectedIndex = 0;
}
